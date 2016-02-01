<%@ Page Title="BookInsert" Language="C#" MasterPageFile="~/Site.Master" CodeBehind="Insert.aspx.cs" Inherits="CswLibrarySite.Models.Books.Insert" %>
<asp:Content runat="server" ContentPlaceHolderID="MainContent">
    <div>
		<p>&nbsp;</p>
        <asp:FormView runat="server"
            ItemType="CswLibrarySite.Models.Book" DefaultMode="Insert"
            InsertItemPosition="FirstItem" InsertMethod="InsertItem"
            OnItemCommand="ItemCommand" RenderOuterTable="false">
            <InsertItemTemplate>
                <fieldset class="form-horizontal">
				<legend>Insert Book</legend>
		        <asp:ValidationSummary runat="server" CssClass="alert alert-danger" />
						    <asp:DynamicControl Mode="Insert" DataField="CodeBar" runat="server" />
						    <asp:DynamicControl Mode="Insert" DataField="Title" runat="server" />
						    <asp:DynamicControl Mode="Insert" DataField="Price" runat="server" />
						    <asp:DynamicControl Mode="Insert" DataField="Description" runat="server" />
						    <asp:DynamicControl Mode="Insert" DataField="Pages" runat="server" />
							<asp:DynamicControl Mode="Insert" 
								DataField="CategoryID" 
								DataTypeName="CswLibrarySite.Models.Category" 
								DataTextField="CategoryName" 
								DataValueField="CategoryID" 
								UIHint="ForeignKey" runat="server" />
							<asp:DynamicControl Mode="Insert" 
								DataField="AuthorID" 
								DataTypeName="CswLibrarySite.Models.Author" 
								DataTextField="Name" 
								DataValueField="AuthorID" 
								UIHint="ForeignKey" runat="server" />
                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-10">
                            <asp:Button runat="server" ID="InsertButton" CommandName="Insert" Text="Insert" CssClass="btn btn-primary" />
                            <asp:Button runat="server" ID="CancelButton" CommandName="Cancel" Text="Cancel" CausesValidation="false" CssClass="btn btn-default" />
                        </div>
					</div>
                </fieldset>
            </InsertItemTemplate>
        </asp:FormView>
    </div>
</asp:Content>
