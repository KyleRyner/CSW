<%@ Page Title="Category Details" Language="C#" MasterPageFile="~/Site.Master" CodeBehind="Details.aspx.cs" Inherits="CswLibrarySite.Models.Categories.Details" %>
<asp:Content runat="server" ContentPlaceHolderID="MainContent">
    <div>
		<p>&nbsp;</p>
      
        <asp:FormView runat="server"
            ItemType="CswLibrarySite.Models.Category" DataKeyNames="CategoryID"
            SelectMethod="GetItem"
            OnItemCommand="ItemCommand" RenderOuterTable="false">
            <EmptyDataTemplate>
                Cannot find the Category with CategoryID <%: Request.QueryString["CategoryID"] %>
            </EmptyDataTemplate>
            <ItemTemplate>
                <fieldset class="form-horizontal">
                    <legend>Category Details</legend>
							<div class="row">
								<div class="col-sm-2 text-right">
									<strong>CategoryID</strong>
								</div>
								<div class="col-sm-4">
									<asp:DynamicControl runat="server" DataField="CategoryID" ID="CategoryID" Mode="ReadOnly" />
								</div>
							</div>
							<div class="row">
								<div class="col-sm-2 text-right">
									<strong>CategoryName</strong>
								</div>
								<div class="col-sm-4">
									<asp:DynamicControl runat="server" DataField="CategoryName" ID="CategoryName" Mode="ReadOnly" />
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
					  &nbsp;
					</div>
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
							<asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Back" CssClass="btn btn-default" />
						</div>
					</div>
                </fieldset>
            </ItemTemplate>
        </asp:FormView>
    </div>
</asp:Content>

