<%@ Page Title="BookEdit" Language="C#" MasterPageFile="~/Site.Master" CodeBehind="Edit.aspx.cs" Inherits="CswLibrarySite.Models.Books.Edit" %>
<asp:Content runat="server" ContentPlaceHolderID="MainContent">
    <div>
		<p>&nbsp;</p>
        <asp:FormView runat="server"
            ItemType="CswLibrarySite.Models.Book" DefaultMode="Edit" DataKeyNames="BookID"
            UpdateMethod="UpdateItem" SelectMethod="GetItem"
            OnItemCommand="ItemCommand" RenderOuterTable="false">
            <EmptyDataTemplate>
                Cannot find the Book with BookID <%: Request.QueryString["BookID"] %>
            </EmptyDataTemplate>
            <EditItemTemplate>
                <fieldset class="form-horizontal">
                    <legend>Edit Book</legend>
					<asp:ValidationSummary runat="server" CssClass="alert alert-danger"  />                 
						    <asp:DynamicControl Mode="Edit" DataField="CodeBar" runat="server" />
						    <asp:DynamicControl Mode="Edit" DataField="Title" runat="server" />
						    <asp:DynamicControl Mode="Edit" DataField="Price" runat="server" />
						    <asp:DynamicControl Mode="Edit" DataField="Description" runat="server" />
						    <asp:DynamicControl Mode="Edit" DataField="Pages" runat="server" />
							<asp:DynamicControl Mode="Edit" 
								DataField="CategoryID" 
								DataTypeName="CswLibrarySite.Models.Category" 
								DataTextField="CategoryName" 
								DataValueField="CategoryID" 
								UIHint="ForeignKey" runat="server" />
							<asp:DynamicControl Mode="Edit" 
								DataField="AuthorID" 
								DataTypeName="CswLibrarySite.Models.Author" 
								DataTextField="Name" 
								DataValueField="AuthorID" 
								UIHint="ForeignKey" runat="server" />
                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-10">
							<asp:Button runat="server" ID="UpdateButton" CommandName="Update" Text="Update" CssClass="btn btn-primary" />
							<asp:Button runat="server" ID="CancelButton" CommandName="Cancel" Text="Cancel" CausesValidation="false" CssClass="btn btn-default" />
						</div>
					</div>
                </fieldset>
            </EditItemTemplate>
        </asp:FormView>
    </div>
</asp:Content>

