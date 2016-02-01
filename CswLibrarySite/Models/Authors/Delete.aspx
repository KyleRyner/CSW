<%@ Page Title="AuthorDelete" Language="C#" MasterPageFile="~/Site.Master" CodeBehind="Delete.aspx.cs" Inherits="CswLibrarySite.Models.Authors.Delete" %>
<asp:Content runat="server" ContentPlaceHolderID="MainContent">
    <div>
		<p>&nbsp;</p>
        <h3>Are you sure want to delete this Author?</h3>
        <asp:FormView runat="server"
            ItemType="CswLibrarySite.Models.Author" DataKeyNames="AuthorID"
            DeleteMethod="DeleteItem" SelectMethod="GetItem"
            OnItemCommand="ItemCommand" RenderOuterTable="false">
            <EmptyDataTemplate>
                Cannot find the Author with AuthorID <%: Request.QueryString["AuthorID"] %>
            </EmptyDataTemplate>
            <ItemTemplate>
                <fieldset class="form-horizontal">
                    <legend>Delete Author</legend>
							<div class="row">
								<div class="col-sm-2 text-right">
									<strong>AuthorID</strong>
								</div>
								<div class="col-sm-4">
									<asp:DynamicControl runat="server" DataField="AuthorID" ID="AuthorID" Mode="ReadOnly" />
								</div>
							</div>
							<div class="row">
								<div class="col-sm-2 text-right">
									<strong>Name</strong>
								</div>
								<div class="col-sm-4">
									<asp:DynamicControl runat="server" DataField="Name" ID="Name" Mode="ReadOnly" />
								</div>
							</div>
							<div class="row">
								<div class="col-sm-2 text-right">
									<strong>Bio</strong>
								</div>
								<div class="col-sm-4">
									<asp:DynamicControl runat="server" DataField="Bio" ID="Bio" Mode="ReadOnly" />
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

