<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ByAuthor.aspx.cs" MasterPageFile="~/Site.Master" Inherits="CswLibrarySite.Models.Authors.ByAuthor" %>


<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div>

        <asp:GridView ID="dataGridView" runat="server" AutoGenerateColumns="True" 
            Width="211px">

        </asp:GridView>
    </div>
</asp:Content>
