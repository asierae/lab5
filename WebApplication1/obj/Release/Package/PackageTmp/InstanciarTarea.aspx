<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="InstanciarTarea.aspx.vb" Inherits="WebApplication1.InstanciarTarea" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Instanciar Tarea</title>
                <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <!-- Latest compiled and minified JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    <script src="js/jquery-3.1.1.min.js"></script>
    <style type="text/css">
        .auto-style1 {
            width: 578px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <nav class="navbar navbar-default">
      <div class="container">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-collapse-1">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="/Alumno.aspx">Menu Alumno</a>
        </div>
    
        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="navbar-collapse-1">
          <ul class="nav navbar-nav navbar-right">
            <li><a href="/TareasAlumno.aspx">TareasAlumno</a></li>
            <li><a href="#">Opcionx</a></li>
            <li><a href="#">Opcion1</a></li>
            <li><a href="#">Opcion2</a></li>
            <li><a href="/LogOut.aspx">Logout</a></li>
          </ul>
          
        </div><!-- /.navbar-collapse -->
      </div><!-- /.container -->
    </nav><!-- /.navbar -->
                <div class="row">
        <div class="col-md-3">
            <ul class="nav nav-pills nav-stacked">
                <li class="active"><a href="#"><i class="fa fa-home fa-fw"></i>Home</a></li>
                <li><a href="/TareasAlumno.aspx"><i class="fa fa-file-o fa-fw"></i>Tareas Alumno</a></li>
                <li><a href="#"><i class="fa fa-file-o fa-fw"></i>Asignaturas</a></li>
                <li><a href="#"><i class="fa fa-bar-chart-o fa-fw"></i>Tareas Propias</a></li>
                <li><a href="#"><i class="fa fa-table fa-fw"></i>Grupos</a></li>
                <li><a href="#"><i class="fa fa-tasks fa-fw"></i>Etc</a></li>

            </ul>
        </div>
        <div id="contenido" class="col-md-9 well">
        <br />
        <br />
        <div id="container" style="height: 851px; width: 941px; margin-left: 40px">
            <h3>Instanciar Tarea</h3>
            <table id="tb">
                <td>
            <asp:Label ID="Label1" runat="server" Text="Usuario"></asp:Label>
            <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" Width="232px" BackColor="#99CCFF" Enabled="False"></asp:TextBox>
            <br />
            <asp:Label ID="Label2" runat="server" Text="Tarea:"></asp:Label>
            <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control" BackColor="#99CCFF" Enabled="False"></asp:TextBox>
            <br />
            <asp:Label ID="Label3" runat="server" Text="Horas Est."></asp:Label>
            <asp:TextBox ID="TextBox3" runat="server" CssClass="form-control" BackColor="#99CCFF" Enabled="False" TextMode="Number"></asp:TextBox>
            <br />
            <asp:Label ID="Label4" runat="server" Text="Horas Reales"></asp:Label>
            <asp:TextBox ID="TextBox4" runat="server" CssClass="form-control" TextMode="Number" BackColor="#CCFFFF"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox4" ErrorMessage="Introduce un número de Horas" ForeColor="Red"></asp:RequiredFieldValidator>
            <br />
            <asp:Button ID="Button1" runat="server" CssClass="btn btn-success" Text="Instanciar" />
                    &nbsp;&nbsp;&nbsp; &nbsp;</td> 
                <td class="auto-style1"></td>
                <td class="auto-style1">
                         &nbsp;<asp:Label ID="Label5" runat="server"></asp:Label>
                         <asp:GridView ID="GridView1" runat="server" CssClass="table-responsive" BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellPadding="3" CellSpacing="1" GridLines="None" Height="175px" Width="466px">
            <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
            <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
            <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
            <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
            <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#594B9C" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#33276A" />
        </asp:GridView>
                </td>
                </table>
            <br />
            <br />
            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False">Página Anterior</asp:LinkButton>
        </div>
            </div>
                    </div>
        
    </form>
</body>
</html>
