<%@ Page Title="BookDelete" Language="C#" MasterPageFile="~/Site.Master" CodeBehind="Delete.aspx.cs" Inherits="CswLibrarySite.Models.Books.Delete" %>
<asp:Content runat="server" ContentPlaceHolderID="MainContent">
    <div>
		<p>&nbsp;</p>
        <h3>Are you sure want to delete this Book?</h3>
        <asp:FormView runat="server"
            ItemType="CswLibrarySite.Models.Book" DataKeyNames="BookID"
            DeleteMethod="DeleteItem" SelectMethod="GetItem"
            OnItemCommand="ItemCommand" RenderOuterTable="false">
            <EmptyDataTemplate>
                Cannot find the Book with BookID <%: Request.QueryString["BookID"] %>
            </EmptyDataTemplate>
            <ItemTemplate>
                <fieldset class="form-horizontal">
                    <legend>Delete Book</legend>
							<div class="row">
								<div class="col-sm-2 text-right">
									<strong>BookID</strong>
								</div>
								<div class="col-sm-4">
									<asp:DynamicControl runat="server" DataField="BookID" ID="BookID" Mode="ReadOnly" />
								</div>
							</div>
							<div class="row">
								<div class="col-sm-2 text-right">
									<strong>CodeBar</strong>
								</div>
								<div class="col-sm-4">
									<asp:DynamicControl runat="server" DataField="CodeBar" ID="CodeBar" Mode="ReadOnly" />
								</div>
							</div>
							<div class="row">
								<div class="col-sm-2 text-right">
									<strong>Title</strong>
								</div>
								<div class="col-sm-4">
									<asp:DynamicControl runat="server" DataField="Title" ID="Title" Mode="ReadOnly" />
								</div>
							</div>
							<div class="row">
								<div class="col-sm-2 text-right">
									<strong>Price</strong>
								</div>
								<div class="col-sm-4">
									<asp:DynamicControl runat="server" DataField="Price" ID="Price" Mode="ReadOnly" />
								</div>
							</div>
							<div class="row">
								<div class="col-sm-2 text-right">
									<strong>Description</strong>
								</div>
								<div class="col-sm-4">
									<asp:DynamicControl runat="server" DataField="Description" ID="Description" Mode="ReadOnly" />
								</div>
							</div>
							<div class="row">
								<div class="col-sm-2 text-right">
									<strong>Pages</strong>
								</div>
								<div class="col-sm-4">
									<asp:DynamicControl runat="server" DataField="Pages" ID="Pages" Mode="ReadOnly" />
								</div>
							</div>
							<div class="row">
								<div class="col-sm-2 text-right">
									<strong>Category</strong>
								</div>
								<div class="col-sm-4">
									<%#: Item.Category != null ? Item.Category.CategoryName : "" %>
								</div>
							</div>
							<div class="row">
								<div class="col-sm-2 text-right">
									<strong>Author</strong>
								</div>
								<div class="col-sm-4">
									<%#: Item.Author != null ? Item.Author.Name : "" %>
								</div>
							</div>
                 	<div class="row">
					  &nbsp;
					</div>
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
							<asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" CssClass="btn btn-danger" />
							<asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" CssClass="btn btn-default" />
						</div>
					</div>
                </fieldset>
            </ItemTemplate>
        </asp:FormView>
    </div>
</asp:Content>

