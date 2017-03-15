<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Alumno.aspx.vb" Inherits="WebApplication1.Alumno" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
        <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <!-- Latest compiled and minified JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    <script src="js/jquery-3.1.1.min.js"></script>
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
          <a class="navbar-brand" href="/Profesor.aspx">Menu Alumno</a>
        </div>
    
        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="navbar-collapse-1">
          <ul class="nav navbar-nav navbar-right">
            <li><a href="#">Home</a></li>
            <li><a href="#">About</a></li>
            <li><a href="#">Services</a></li>
            <li><a href="#">Works</a></li>
            <li><a href="#">News</a></li>
            <li><a href="#">Contact</a></li>
            <li><a href="/LogOut.aspx">Logout</a></li>
          </ul>
          
        </div><!-- /.navbar-collapse -->
      </div><!-- /.container -->
    </nav><!-- /.navbar -->
     <div class="container">
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
            Bienvenido <asp:Label ID="Label1" runat="server" Text="alumno"></asp:Label>
        </div>
    </div>
    </form>
</body>
</html>
