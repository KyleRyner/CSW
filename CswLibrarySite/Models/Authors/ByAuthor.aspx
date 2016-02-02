<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ByAuthor.aspx.cs" MasterPageFile="~/Site.Master" Inherits="CswLibrarySite.Models.Authors.ByAuthor" %>


<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div>
                <div class="row text-center" runat="server">
            <asp:DropDownList ID="ddlTheme" runat="server" AutoPostBack="true">
                <asp:ListItem Value="" Text=" -- Select Author -- "></asp:ListItem>
                <asp:ListItem Value="GreySuitsYouSir" Text="GreySuitsYouSir"></asp:ListItem>
                <asp:ListItem Value="MediaGroove" Text="MediaGroove"></asp:ListItem>
                <asp:ListItem Value="SeaGlass" Text="SeaGlass"></asp:ListItem>
                <asp:ListItem Value="UVGreen" Text="UVGreen"></asp:ListItem>
                <asp:ListItem Value="WinterBlue" Text="WinterBlue"></asp:ListItem>
            </asp:DropDownList>
                    <p>&nbsp;</p>
                </div>


        <asp:ListView ID="ListViewBooks" runat="server" >
                <LayoutTemplate>
                <div class="row text-center" runat="server" id="itemPlaceholder">

                </div>
                </LayoutTemplate>
                <ItemTemplate>
                <div class="col-sm-4 col-md-4 col-lg-4 col-xs-6">
                  <div class="thumbnail">
                    <div class="caption">
                      <img src="<%#: System.IO.File.Exists(Server.MapPath("/Content/images/covers/") + Eval("CodeBar") + ".jpg") ? "/Content/images/covers/" + Eval("CodeBar") + ".jpg" : "/Content/images/assets/400X400.gif" %>" 
                          alt="<%#Eval("Title")%>" class="img-responsive">
                      
                      <div class="caption">
                      <h3><%#Eval("Title")%></h3>
                        <p>By: <strong><%#Eval("Name") %></strong></p>
                        <p>Category: <strong><%#Eval("CategoryName") %></strong></p>
                        <p><%#Eval("Description")%></p>
                      <p><a href="javascript:alert('<%# Eval("Title") %> was added to your cart!');" class="btn btn-primary" role="button"><span class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></span> Add to Cart</a></p>
                      </div>
                    </div>
                  </div>
                </div>

                </ItemTemplate>

            </asp:ListView>

        <asp:GridView ID="dataGridView" runat="server" AutoGenerateColumns="True" 
            Width="211px">

        </asp:GridView>
    </div>
</asp:Content>
