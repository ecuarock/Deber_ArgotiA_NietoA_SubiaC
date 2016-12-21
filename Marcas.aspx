<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Marcas.aspx.vb" Inherits="Deber_ArgotiA_NietoA_SubiaC.Marcas" Debug="true"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        MARCAS<br />
    
        <asp:GridView ID="gridMarcas" runat="server" AllowPaging="True" 
            AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
            DataKeyNames="id" DataSourceID="SqlDataSource1" 
            EmptyDataText="No hay registros de datos para mostrar." ForeColor="#333333" 
            GridLines="None">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:BoundField DataField="id" HeaderText="id" ReadOnly="True" 
                    SortExpression="id" />
                <asp:BoundField DataField="nombre" HeaderText="nombre" 
                    SortExpression="nombre" />
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" 
                    SelectText="Modelos" ShowSelectButton="True" HeaderText="comandos" />
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
            DeleteCommand="DELETE FROM [Marca] WHERE [id] = @id" 
            InsertCommand="INSERT INTO [Marca] ([nombre]) VALUES (@nombre)" 
            ProviderName="<%$ ConnectionStrings:CarrosConnectionString1.ProviderName %>" 
            SelectCommand="SELECT [id], [nombre] FROM [Marca]" 
            UpdateCommand="UPDATE [Marca] SET [nombre] = @nombre WHERE [id] = @id">
            <DeleteParameters>
                <asp:Parameter Name="id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="nombre" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="nombre" Type="String" />
                <asp:Parameter Name="id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <br />
        <asp:FormView ID="FormView1" runat="server" DataKeyNames="id" 
            DataSourceID="SqlDataSource1" DefaultMode="Insert">
            <EditItemTemplate>
                id:
                <asp:Label ID="idLabel1" runat="server" Text='<%# Eval("id") %>' />
                <br />
                nombre:
                <asp:TextBox ID="nombreTextBox" runat="server" Text='<%# Bind("nombre") %>' />
                <br />
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                    CommandName="Update" Text="Actualizar" />
                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                    CausesValidation="False" CommandName="Cancel" Text="Cancelar" />
            </EditItemTemplate>
            <InsertItemTemplate>
                nombre:
                <asp:TextBox ID="nombreTextBox" runat="server" Text='<%# Bind("nombre") %>' />
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" BorderColor="Silver" 
                    BorderStyle="Outset" CausesValidation="True" CommandName="Insert" 
                    Text="Insertar" />
                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" BorderColor="#CCCCCC" 
                    BorderStyle="Outset" CausesValidation="False" CommandName="Cancel" 
                    Text="Cancelar" Visible="False" />
            </InsertItemTemplate>
            <ItemTemplate>
                id:
                <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
                <br />
                nombre:
                <asp:Label ID="nombreLabel" runat="server" Text='<%# Bind("nombre") %>' />
                <br />
                <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" 
                    CommandName="Edit" Text="Editar" />
                &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" 
                    CommandName="Delete" Text="Eliminar" />
                &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" 
                    CommandName="New" Text="Nuevo" />
            </ItemTemplate>
        </asp:FormView>
        <asp:Button ID="btnSalir" runat="server" PostBackUrl="~/Login.aspx" 
            Text="Salir" />
    
        <asp:Label ID="lblprueba" runat="server"></asp:Label>
    
    </div>
    </form>
</body>
</html>
