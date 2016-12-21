<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Modelos.aspx.vb" Inherits="Deber_ArgotiA_NietoA_SubiaC.Modelos" Debug="true"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:GridView ID="gridModelos" runat="server" AllowPaging="True" 
            AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource1" 
            EmptyDataText="No hay registros de datos para mostrar." ForeColor="#333333" 
            GridLines="None" DataKeyNames="id">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" 
                    ReadOnly="True" SortExpression="id" />
                <asp:BoundField DataField="nombre" HeaderText="nombre" 
                    SortExpression="nombre" />
                <asp:BoundField DataField="fechalanz" HeaderText="fechalanz" 
                    SortExpression="fechalanz" />
                <asp:BoundField DataField="valorcomercial" HeaderText="valorcomercial" 
                    SortExpression="valorcomercial" />
                <asp:CommandField ShowSelectButton="True" />
                <asp:CommandField ShowEditButton="True" />
                <asp:CommandField ShowDeleteButton="True" />
            </Columns>
            <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#E9E7E2" />
            <SortedAscendingHeaderStyle BackColor="#506C8C" />
            <SortedDescendingCellStyle BackColor="#FFFDF8" />
            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:CarrosConnectionString1 %>" 
            ProviderName="<%$ ConnectionStrings:CarrosConnectionString1.ProviderName %>" 
            
            SelectCommand="SELECT [nombre], [fechalanz], [valorcomercial], [id] FROM [Modelo] WHERE ([marca] = @marca)">
            <SelectParameters>
                <asp:SessionParameter Name="marca" SessionField="marca" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    
        <br />
    
    </div>
    <asp:Button ID="btnVolverMarcas" runat="server" Text="Volver a Marcas" />
    </form>
</body>
</html>
