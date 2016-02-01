<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="CswLibrarySite.Models.Books.Default" %>
<%@ Register TagPrefix="FriendlyUrls" Namespace="Microsoft.AspNet.FriendlyUrls" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <h2 class="text-center">BOOKS</h2>
<hr>
<div class="container">
<!-- -->


<asp:ListView id="ListView1" runat="server"
            DataKeyNames="BookID" 
			ItemType="CswLibrarySite.Models.Book"
            SelectMethod="GetData">
            <EmptyDataTemplate>
                There are no entries found for Books
            </EmptyDataTemplate>
            <LayoutTemplate>

                <div class="row text-center" runat="server" id="itemPlaceholder">

                </div>
				<p>&nbsp;</p>
                <asp:DataPager PageSize="5"  runat="server">
					<Fields>
                        <asp:NextPreviousPagerField ShowLastPageButton="False" ShowNextPageButton="False" ButtonType="Button" ButtonCssClass="btn" />
                        <asp:NumericPagerField ButtonType="Button"  NumericButtonCssClass="btn" CurrentPageLabelCssClass="btn disabled" NextPreviousButtonCssClass="btn" />
                        <asp:NextPreviousPagerField ShowFirstPageButton="False" ShowPreviousPageButton="False" ButtonType="Button" ButtonCssClass="btn" />
                    </Fields>
				</asp:DataPager>
            </LayoutTemplate>
            <ItemTemplate>
                <div class="col-sm-4 col-md-4 col-lg-4 col-xs-6">
                  <div class="thumbnail"> 
                      <img src="<%#: System.IO.File.Exists(Server.MapPath("/Content/images/covers/") + Item.CodeBar + ".jpg") ? "/Content/images/covers/" + Item.CodeBar + ".jpg" : "/Content/images/assets/400X400.gif" %>" 
                          alt="<%# Item.Title %>" class="img-responsive">
                    <div class="caption">
                      <h3><asp:DynamicControl runat="server" DataField="Title" ID="DynamicControl1" Mode="ReadOnly" /></h3>
                        <p>By: <strong><%#: Item.Author != null ? Item.Author.Name : "" %></strong></p>
                        <p>Category: <strong><%#: Item.Category != null ? Item.Category.CategoryName : "" %></strong></p>
                        <p><asp:DynamicControl runat="server" DataField="Description" ID="DynamicControl2" Mode="ReadOnly" /></p>
                      <p><a href="javascript:alert('<%# Item.Title %> was added to your cart!');" class="btn btn-primary" role="button"><span class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></span> Add to Cart</a></p>
                    </div>
                  </div>
                </div>

            </ItemTemplate>
        </asp:ListView>
<!-- -->
 

</div>
<hr>

</asp:Content>
