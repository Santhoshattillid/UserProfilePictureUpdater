<%@ Assembly Name="$SharePoint.Project.AssemblyFullName$" %>
<%@ Import Namespace="Microsoft.SharePoint.ApplicationPages" %>
<%@ Register Tagprefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Import Namespace="Microsoft.SharePoint" %>
<%@ Assembly Name="Microsoft.Web.CommandUI, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UpdateUserProfileImage.aspx.cs" Inherits="UserProfilePictureUpdater.Layouts.UserProfilePictureUpdater.UpdateUserProfileImage" DynamicMasterPageFile="~masterurl/default.master" %>
<asp:Content ID="PageTitle" ContentPlaceHolderID="PlaceHolderPageTitle" runat="server">
Update User profile picture
</asp:Content>
<asp:Content ID="PageTitleInTitleArea" ContentPlaceHolderID="PlaceHolderPageTitleInTitleArea" runat="server" >
Update User profile picture
</asp:Content>
<asp:Content ID="PageHead" ContentPlaceHolderID="PlaceHolderAdditionalPageHead" runat="server">
    <link href="Stylesheet.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Main" ContentPlaceHolderID="PlaceHolderMain" runat="server">
    <div class="container">
        <ul>
            <li>
                <h3>Update user profile picture</h3>
            </li>
            <li>
                <label>User account</label>
            </li>
            <li>
                <SharePoint:PeopleEditor ID="PEaccount" ControlMode="New" 
                runat="server" AllowEmpty="False" AutoPostBack="True"   SelectionSet="User" CssClass="peopleeditor" 
                Width="300px" />
            </li>
            <li>
                <label>Select profile image</label>
            </li>
            <li>
                <asp:FileUpload ID="Fuprofileimage" runat="server"  />
            </li>
            <li>
                <asp:Label runat="server" ID="LblError" CssClass="ErrorText" ></asp:Label>
            </li>
            <li>
                <asp:Button ID="BtnUpdate" runat="server" Text="Update" OnClick="BtnRegister_Click" />
            </li>
        </ul>
    </div>
</asp:Content>

