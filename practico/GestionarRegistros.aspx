<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GestionarRegistros.aspx.cs" Inherits="practico.GestionarRegistros" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="Label1" runat="server" Text="Registros Contables"></asp:Label>
        </div>
        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="descripcion" DataValueField="idCuenta">
        </asp:DropDownList>
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Agregar" />
        <asp:Label ID="Label2" runat="server"></asp:Label>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CADENA1 %>" SelectCommand="SELECT * FROM [Cuentas]"></asp:SqlDataSource>
        <asp:Label ID="Label3" runat="server"></asp:Label>
        <br />
        <asp:ListBox ID="ListBox1" runat="server" DataSourceID="SqlDataSource1" DataTextField="descripcion" DataValueField="idCuenta" Height="127px" OnSelectedIndexChanged="ListBox1_SelectedIndexChanged" Width="229px"></asp:ListBox>
        <br />
        <br />
        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
        <br />
        <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Eliminar" />
        <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="Modificar" />
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:CADENA1 %>" DeleteCommand="DELETE FROM [Registros] WHERE [id] = @id" InsertCommand="INSERT INTO [Registros] ([idCuenta], [monto]) VALUES (@idCuenta, @monto)" SelectCommand="SELECT * FROM [Registros]" UpdateCommand="UPDATE [Registros] SET [idCuenta] = @idCuenta, [monto] = @monto WHERE [id] = @id">
            <DeleteParameters>
                <asp:ControlParameter ControlID="ListBox1" Name="id" PropertyName="SelectedValue" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:ControlParameter ControlID="DropDownList1" Name="idCuenta" PropertyName="SelectedValue" Type="Int32" />
                <asp:ControlParameter ControlID="TextBox1" Name="monto" PropertyName="Text" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:ControlParameter ControlID="DropDownList1" Name="idCuenta" PropertyName="SelectedValue" Type="Int32" />
                <asp:ControlParameter ControlID="TextBox1" Name="monto" PropertyName="Text" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
&nbsp;<asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:CADENA1 %>" SelectCommand="SELECT * FROM [Cuentas] WHERE ([idCuenta] = @idCuenta)">
            <SelectParameters>
                <asp:ControlParameter ControlID="ListBox1" Name="idCuenta" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
