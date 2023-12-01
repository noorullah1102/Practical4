<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PRACTICAL4E1.aspx.cs" Inherits="Practical4.PRACTICAL4E1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Category:
            <asp:DropDownList ID="ddlCategory" runat="server" DataSourceID="sdsCategory" DataTextField="CategoryName" DataValueField="CategoryID">
            </asp:DropDownList>
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Button" />
            <br />
            Product List:<asp:Label ID="lblResult" runat="server" Text="[lblResult]"></asp:Label>
            <br />
            <br />
            <asp:Repeater ID="RepeaterProducts" runat="server" DatasourceID="sdsProduct">
                <HeaderTemplate>
                    <table>
                        <tr>
                            <td>No.</td>
                            <td>Product ID</td>
                            <td>Product Name</td>
                            <td>Unit Price</td>
                        </tr>
                </HeaderTemplate>
                <ItemTemplate>
                        <tr>
                            <td><%# Container.ItemIndex+1 %></td>
                            <td><%# Eval("ProductID") %></td>
                            <td><%# Eval("ProductName") %></td>
                            <td><%# String.Format("{0:C}", Eval("UnitPrice")) %></td>
                        </tr>
                </ItemTemplate>
                <FooterTemplate>
                        </table>
                </FooterTemplate>
            </asp:Repeater>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="ProductID" DataSourceID="sdsProduct" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                <Columns>
                    <asp:BoundField DataField="ProductName" HeaderText="ProductName" SortExpression="ProductName" />
                    <asp:BoundField DataField="UnitPrice" HeaderText="UnitPrice" SortExpression="UnitPrice" />
                    <asp:BoundField DataField="ProductID" HeaderText="ProductID" InsertVisible="False" ReadOnly="True" SortExpression="ProductID" />
                    <asp:BoundField DataField="CategoryID" HeaderText="CategoryID" SortExpression="CategoryID" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="sdsCategory" runat="server" ConnectionString="<%$ ConnectionStrings:NORTHWNDConnectionString %>" SelectCommand="SELECT [CategoryName], [CategoryID] FROM [Categories]"></asp:SqlDataSource>
            <asp:SqlDataSource ID="sdsProduct" runat="server" ConnectionString="<%$ ConnectionStrings:NORTHWNDConnectionString %>" SelectCommand="SELECT [ProductName], [UnitPrice], [ProductID], [CategoryID] FROM [Products] WHERE ([CategoryID] = @CategoryID)" OnSelected="sdsProduct_Selected">
                <SelectParameters>
                    <asp:ControlParameter ControlID="ddlCategory" Name="CategoryID" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
