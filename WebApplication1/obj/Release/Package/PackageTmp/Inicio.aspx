<%@ Page Language="vb" AutoEventWireup="false" EnableViewState="true" CodeBehind="Inicio.aspx.vb" Inherits="WebApplication1.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Bienvenido</title>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <!-- Latest compiled and minified JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    <script src="js/jquery-3.1.1.min.js"></script>
</head>
<body>
    <form id="form1" runat="server" enableviewstate="true">
        <div class="container">
            <div id="loginbox" style="margin-top: 50px;" class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
                <div class="panel panel-info">
                    <div class="panel-heading">
                        <div class="panel-title">Login</div>
                        <div style="float: right; font-size: 80%; position: relative; top: -10px">
                            <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False">Cambiar Password</asp:LinkButton></div>
                    </div>

                    <div style="padding-top: 30px" class="panel-body">

                        <div style="display: none" id="login-alert" class="alert alert-danger col-sm-12"></div>

                        <form id="loginform" class="form-horizontal" role="form">
                            <div class="input-group" style="margin-bottom: 35px" >
                                <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" Width="250px" placeholder="Tu email" BorderColor="#99CCFF" ViewStateMode="Enabled"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox1" ErrorMessage="Introduce un email" ForeColor="Red"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="Introduce un Email válido" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                            </div>

                            <br />
                            <div class="input-group">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                                <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control" Width="250px" placeholder="Password" BorderColor="#99CCFF" TextMode="Password"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox2" ErrorMessage="Introduce un Password" ForeColor="Red"></asp:RequiredFieldValidator>
                            </div>
                            <asp:Literal ID="Literal1" runat="server"></asp:Literal>
                            <br />
                            &nbsp;&nbsp;<asp:Label ID="Label1" runat="server"></asp:Label>
                            <br />


                            <asp:Button ID="Button1" runat="server" CssClass="btn btn-primary" Text="Login" Width="114px" Height="48px" ViewStateMode="Enabled" />



                            <div class="form-group">
                                <div class="col-md-12 control">
                                    <br >
                                    <div style="border-top: 1px solid#888; padding-top: 15px; font-size: 85%">
                                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False">Registrarse</asp:LinkButton>
                                    </div>
                                </div>
                            </div>
                        </form>



                    </div>
                </div>
            </div>
    </form>
    </div>
                    </div>

     
            

        </div>


    </form>


</body>
</html>
