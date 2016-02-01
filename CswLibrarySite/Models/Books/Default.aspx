<%@ Page Title="BookList" Language="C#" MasterPageFile="~/Site.Master" CodeBehind="Default.aspx.cs" Inherits="CswLibrarySite.Models.Books.Default" %>
<%@ Register TagPrefix="FriendlyUrls" Namespace="Microsoft.AspNet.FriendlyUrls" %>
<asp:Content runat="server" ContentPlaceHolderID="MainContent">
    <h2>Books List</h2>
    <p>
        <asp:HyperLink runat="server" NavigateUrl="Insert" Text="Create new" />
    </p>
    <div>
        <asp:ListView id="ListView1" runat="server"
            DataKeyNames="BookID" 
			ItemType="CswLibrarySite.Models.Book"
            SelectMethod="GetData">
            <EmptyDataTemplate>
                There are no entries found for Books
            </EmptyDataTemplate>
            <LayoutTemplate>
                <table class="table">
                    <thead>
                        <tr>
                            <th>
								<asp:LinkButton Text="BookID" CommandName="Sort" CommandArgument="BookID" runat="Server" />
							</th>
                            <th>
								<asp:LinkButton Text="CodeBar" CommandName="Sort" CommandArgument="CodeBar" runat="Server" />
							</th>
                            <th>
								<asp:LinkButton Text="Title" CommandName="Sort" CommandArgument="Title" runat="Server" />
							</th>
                            <th>
								<asp:LinkButton Text="Price" CommandName="Sort" CommandArgument="Price" runat="Server" />
							</th>
                            <th>
								<asp:LinkButton Text="Description" CommandName="Sort" CommandArgument="Description" runat="Server" />
							</th>
                            <th>
								<asp:LinkButton Text="Pages" CommandName="Sort" CommandArgument="Pages" runat="Server" />
							</th>
                            <th>
								<asp:LinkButton Text="Category" CommandName="Sort" CommandArgument="CategoryID" runat="Server" />
							</th>
                            <th>
								<asp:LinkButton Text="Author" CommandName="Sort" CommandArgument="AuthorID" runat="Server" />
							</th>
                            <th>&nbsp;</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr runat="server" id="itemPlaceholder" />
                    </tbody>
                </table>
				<asp:DataPager PageSize="5"  runat="server">
					<Fields>
                        <asp:NextPreviousPagerField ShowLastPageButton="False" ShowNextPageButton="False" ButtonType="Button" ButtonCssClass="btn" />
                        <asp:NumericPagerField ButtonType="Button"  NumericButtonCssClass="btn" CurrentPageLabelCssClass="btn disabled" NextPreviousButtonCssClass="btn" />
                        <asp:NextPreviousPagerField ShowFirstPageButton="False" ShowPreviousPageButton="False" ButtonType="Button" ButtonCssClass="btn" />
                    </Fields>
				</asp:DataPager>
            </LayoutTemplate>
            <ItemTemplate>
                <tr>
							<td>
								<asp:DynamicControl runat="server" DataField="BookID" ID="BookID" Mode="ReadOnly" />
							</td>
							<td>
								<asp:DynamicControl runat="server" DataField="CodeBar" ID="CodeBar" Mode="ReadOnly" />
							</td>
							<td>
								<asp:DynamicControl runat="server" DataField="Title" ID="Title" Mode="ReadOnly" />
							</td>
							<td>
								<asp:DynamicControl runat="server" DataField="Price" ID="Price" Mode="ReadOnly" />
							</td>
							<td>
								<asp:DynamicControl runat="server" DataField="Description" ID="Description" Mode="ReadOnly" />
							</td>
							<td>
								<asp:DynamicControl runat="server" DataField="Pages" ID="Pages" Mode="ReadOnly" />
							</td>
							<td>
								<%#: Item.Category != null ? Item.Category.CategoryName : "" %>
							</td>
							<td>
								<%#: Item.Author != null ? Item.Author.Name : "" %>
							</td>
                    <td>
					    <asp:HyperLink runat="server" NavigateUrl='<%# FriendlyUrl.Href("~/Models/Books/Details", Item.BookID) %>' Text="Details" /> | 
					    <asp:HyperLink runat="server" NavigateUrl='<%# FriendlyUrl.Href("~/Models/Books/Edit", Item.BookID) %>' Text="Edit" /> | 
                        <asp:HyperLink runat="server" NavigateUrl='<%# FriendlyUrl.Href("~/Models/Books/Delete", Item.BookID) %>' Text="Delete" />
                    </td>
                </tr>
            </ItemTemplate>
        </asp:ListView>
    </div>
</asp:Content>

