<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Registro.aspx.vb" Inherits="WebApplication1.Registro" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Registro de Usuarios</title>
     <!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
		<script src="js/jquery-3.1.1.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div style="height: 851px; width: 941px; margin-left: 40px">
    
        <h1><strong>Registro</strong></h1>
        <strong>
            <asp:Label ID="Label1" runat="server" Font-Size="X-Small"></asp:Label>

        </strong>
        <table><td>
        <h5><strong>Email:&nbsp;(*)</strong><asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" Width="200px" ForeColor="Black"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox1" ErrorMessage="Introduce un email" ForeColor="Red"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="Introduce un email válido" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
        </h5>
        <h5><strong>Nombre y Apellidos:&nbsp;(*)&nbsp;</strong><asp:TextBox ID="TextBox2" runat="server"  CssClass="form-control" Width="200px" ForeColor="Black"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox2" ErrorMessage="Introduce tu nombre y apellido" ForeColor="Red"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="TextBox2" ErrorMessage="Introduce nombre y apellidos" ForeColor="Red" ValidationExpression="([a-zA-Z]+)\s([a-zA-Z]+)\s{0,1}([a-zA-Z]*)"></asp:RegularExpressionValidator>
        </h5>
        <h5><strong>DNI:(*)</strong><asp:TextBox ID="TextBox3" runat="server"  CssClass="form-control" Width="200px"  ForeColor="Black"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TextBox3" ErrorMessage="Introduce tu DNI" ForeColor="Red"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="TextBox3" ErrorMessage="Introduce un DNI válido" ForeColor="Red" ValidationExpression="\d{8}[a-zA-Z]{1}"></asp:RegularExpressionValidator>
        </h5>
        <h5><strong>Password:(*)</strong><asp:TextBox ID="TextBox4" runat="server" CssClass="form-control" Width="200px" ForeColor="Black" TextMode="Password"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="TextBox4" ErrorMessage="Introduce un password" ForeColor="Red"></asp:RequiredFieldValidator>
        </h5>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="TextBox4" ErrorMessage="El Password debe tener 1 Mayúscula,1 dígito, 1 caracter epecial y entre 6 y 12 de longitud" ForeColor="Red" ValidationExpression="(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[$@$!%*#?&amp;]).{6,12}"></asp:RegularExpressionValidator>
        <br />
        <h5><strong>Repetir Password:&nbsp;&nbsp;&nbsp;</strong><asp:TextBox ID="TextBox5" runat="server"  CssClass="form-control" Width="200px"  ForeColor="Black" TextMode="Password"></asp:TextBox>
        </h5>
        <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="TextBox4" ControlToValidate="TextBox5" ErrorMessage="El Password debe ser el mismo" ForeColor="Red"></asp:CompareValidator>

        <h5><strong>Pregunta Secreta:(*)</strong><asp:TextBox ID="TextBox6" runat="server"  CssClass="form-control"   ForeColor="Black" Width="432px"></asp:TextBox>
        </h5>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox6" ErrorMessage="Introduce una Pregunta" ForeColor="Red"></asp:RequiredFieldValidator>

        <h5><strong>Respuesta:(*)<asp:TextBox ID="TextBox7" runat="server"  CssClass="form-control"   ForeColor="Black" Width="432px"></asp:TextBox>
            </strong></h5>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox7" ErrorMessage="Introduce una Respuesta" ForeColor="Red"></asp:RequiredFieldValidator>
        <br />
        <br />
        <asp:Button ID="Button1" runat="server" Height="52px" CssClass="btn btn-success" Text="Registrar" Width="118px" />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False">Volver a inicio</asp:LinkButton>
        <br />
        </td><td>
            <h3><asp:Literal ID="Literal1" runat="server"></asp:Literal></h3>
             </td>
            </table> 
    </div>
    </form>
</body>
</html>
