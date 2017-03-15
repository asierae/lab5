<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="CambiarPassword.aspx.vb" Inherits="WebApplication1.CambiarPassword" %>

<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Cambiar Password</title>
     <!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
		<script src="js/jquery-3.1.1.min.js"></script>
</head>
<html xmlns="http://www.w3.org/1999/xhtml">
<body>
    <h1>Cambiar Password</h1>
    <form id="form1" runat="server" style="margin-left: 40px">
    <p>
        &nbsp;</p>
        <div ID="divEmail" runat="server" style="height: 192px"  >
            <asp:Label ID="Label1" runat="server" Text="Email:" style="font-weight: 700"></asp:Label>
            <asp:TextBox ID="TextBox5" CssClass="form-control" runat="server" Width="300px"></asp:TextBox>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ControlToValidate="TextBox5" ErrorMessage="Introduce un Email válido" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
            <br />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="TextBox5" ErrorMessage="Introduce un Email" ForeColor="Red"></asp:RequiredFieldValidator>
            <br />
            <h3>
                <asp:Label ID="Label2" runat="server"></asp:Label>
            </h3>
            <asp:Button ID="Button3" runat="server" CssClass="btn btn-success" Text="Solicitar Cambio" />
            &nbsp;&nbsp;&nbsp;
            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False">Volver a Inicio</asp:LinkButton>
            </div>

        <div ID="divObtenerPregunta" runat="server" style="height: 192px">
        <h5><strong>Pregunta Secreta:</strong><asp:TextBox ID="TextBox1" runat="server"  CssClass="form-control"   ForeColor="Black" Width="432px" BackColor="#CCCCCC" ReadOnly="True">¿Cual es tu película favorita?</asp:TextBox>
        </h5>
        <h5><strong>Respuesta:<asp:TextBox ID="TextBox2" runat="server"  CssClass="form-control"   ForeColor="Black" Width="432px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="TextBox2" ErrorMessage="Introduce la respuesta aa tu pregunta" ForeColor="Red"></asp:RequiredFieldValidator>
            </strong></h5>
        <p>&nbsp;</p>
        <p>
            <asp:Button ID="Button2" runat="server" CssClass="btn btn-success" OnClick="Button2_Click" Text="Responder" />
        </p>
    </div> 
    
        <div ID="divCambiarPass" runat="server" style="height: 192px"  >
            
            <strong>Nuevos Password:</strong><asp:TextBox ID="TextBox3" runat="server"  CssClass="form-control" Width="200px"  ForeColor="Black" TextMode="Password"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="TextBox3" ErrorMessage="Introduce un password" ForeColor="Red"></asp:RequiredFieldValidator>
            <br />
            <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="TextBox3" ErrorMessage="El Password debe tener 1 Mayúscula,1 dígito, 1 caracter epecial y entre 6 y 12 de longitud" ForeColor="Red" ValidationExpression="(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[$@$!%*#?&amp;]).{6,12}"></asp:RegularExpressionValidator>
            <strong>
            <br />
            Repite Password:</strong><asp:TextBox ID="TextBox4" runat="server"  CssClass="form-control" Width="200px"  ForeColor="Black" TextMode="Password"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="TextBox4" ErrorMessage="Introduce un Password" ForeColor="Red"></asp:RequiredFieldValidator>
            <br />
            <asp:CompareValidator ID="CompareValidator2" runat="server" ControlToCompare="TextBox3" ControlToValidate="TextBox4" ErrorMessage="El password debe ser igual" ForeColor="Red"></asp:CompareValidator>
            <br />
            <asp:Button ID="Button1" runat="server" CssClass="btn btn-warning" Text="Cambiar Password" Width="166px" Height="40px" />
        </div>
    
    </form>
</body>
</html>
