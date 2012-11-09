using System;
using Microsoft.SharePoint;
using Microsoft.SharePoint.Administration;
using Microsoft.SharePoint.WebControls;
using UserProfilePictureUpdater.UserProfileService;

namespace UserProfilePictureUpdater.Layouts.UserProfilePictureUpdater
{
    public partial class UpdateUserProfileImage : LayoutsPageBase
    {
        public string ProfilePictureLibrary = "ProfilePictures";
        protected void Page_Load(object sender, EventArgs e)
        {
        }
        protected void BtnRegister_Click(object sender, EventArgs e)
        {
            try
            {
                if (IsPostBack && SPContext.Current != null)
                {
                    if (Fuprofileimage.HasFile)
                    {

                        var web = SPContext.Current.Site.RootWeb;

                        // uploading image to document library
                        var list = web.Lists.TryGetList(ProfilePictureLibrary);
                        if(list == null)
                        {
                            web.AllowUnsafeUpdates = true;
                            var listUID = web.Lists.Add(ProfilePictureLibrary, string.Empty, SPListTemplateType.PictureLibrary);
                            web.Update();
                            web.AllowUnsafeUpdates = false;
                            list = web.Lists[listUID];
                        }
                        if (list != null)
                        {
                            // now upload the file to document library
                            var file = list.RootFolder.Files.Add(list.RootFolder.Url + "/" + Fuprofileimage.FileName,Fuprofileimage.FileBytes,true);
                            file.Update();
                            var userProfileService = new UserProfileService.UserProfileService
                                                         {
                                                             UseDefaultCredentials = true,
                                                             Url = web.Site.Url + "/_vti_bin/userprofileservice.asmx",
                                                             AllowAutoRedirect = true
                                                         };
                            foreach (var account in PEaccount.Accounts)
                            {
                                var newdata = new PropertyData[1];
                                newdata[0] = new PropertyData { Name = "PictureURL", Values = new ValueData[1] };
                                newdata[0].Values[0] = new ValueData { Value = web.Url + "/" + file.Url };
                                newdata[0].IsValueChanged = true;
                                userProfileService.ModifyUserPropertyByAccountName(account.ToString(), newdata);
                            }
                            LblError.Text = "Profile pictures updated successfully.";
                        }
                        else
                            LblError.Text = "Profile pictures list not available";
                    }
                    else
                        LblError.Text = "Please select the profile picture and then update!";
                }
            }
            catch (Exception ex)
            {
                LblError.Text = "Error - " + ex.Message;
                SPDiagnosticsService.Local.WriteTrace(0, new SPDiagnosticsCategory("SkillLabTestScheduling", TraceSeverity.Monitorable, EventSeverity.Error), TraceSeverity.Monitorable, ex.Message, new object[] { ex.StackTrace });
            }
        }
    }
}
