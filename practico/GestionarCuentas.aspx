<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GestionarCuentas.aspx.cs" Inherits="practico.GestionarCuentas" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="Label1" runat="server" Text="Cuentas"></asp:Label>
            <br />
            <asp:TextBox ID="TextBox1" runat="server" OnTextChanged="TextBox1_TextChanged"></asp:TextBox>
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Agregar" />
            <asp:Label ID="Label2" runat="server"></asp:Label>
        </div>
        <asp:Label ID="Label3" runat="server"></asp:Label>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CADENA1 %>" DeleteCommand="DELETE FROM [Cuentas] WHERE [idCuenta] = @idCuenta" InsertCommand="INSERT INTO [Cuentas] ([descripcion]) VALUES (@descripcion)" SelectCommand="SELECT * FROM [Cuentas]" UpdateCommand="UPDATE [Cuentas] SET [descripcion] = @descripcion WHERE [idCuenta] = @idCuenta">
            <DeleteParameters>
                <asp:ControlParameter ControlID="ListBox1" Name="idCuenta" PropertyName="SelectedValue" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:ControlParameter ControlID="TextBox1" Name="descripcion" PropertyName="Text" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="descripcion" Type="String" />
                <asp:Parameter Name="idCuenta" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:ListBox ID="ListBox1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="descripcion" DataValueField="idCuenta" Height="98px" OnSelectedIndexChanged="ListBox1_SelectedIndexChanged" Width="168px"></asp:ListBox>
        <p>
            <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
        </p>
        <p>
            <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Eliminar" />
            <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="Modificar" />
        </p>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:CADENA1 %>" SelectCommand="SELECT * FROM [Cuentas] WHERE ([idCuenta] = @idCuenta)">
            <SelectParameters>
                <asp:ControlParameter ControlID="ListBox1" Name="idCuenta" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
