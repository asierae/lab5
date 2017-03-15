<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="InsertarTarea.aspx.vb" Inherits="WebApplication1.InsertarTarea" %>

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
    <form id="form1" class="form-control" runat="server">
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
          <a class="navbar-brand" href="/Profesor.aspx">Menu Profesor</a>
        </div>
    
        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="navbar-collapse-1">
          <ul class="nav navbar-nav navbar-right">
            <li><a href="#">Home</a></li>
            <li><a href="#">About</a></li>
            <li><a href="#">Works</a></li>
            <li><a href="/LogOut.aspx">Logout</a></li>
          </ul>
          
        </div><!-- /.navbar-collapse -->
      </div><!-- /.container -->
    </nav><!-- /.navbar -->
        <div class="row">
        <div class="col-md-3">
            <ul class="nav nav-pills nav-stacked">
                <li class="active"><a href="/Profesor.aspx"><i class="fa fa-home fa-fw"></i>Home</a></li>
         
                <li><a href="/TareasProfesor.aspx"><i class="fa fa-file-o fa-fw"></i>VerTareas</a></li>
                <li><a href="/Estadisticas.aspx"><i class="fa fa-table fa-fw"></i>Estadisticas</a></li>
                <li><a href="/InsertarTarea.aspx"><i class="fa fa-tasks fa-fw"></i>Insertar tarea</a></li>
                <li><a href="#"><i class="fa fa-calendar fa-fw"></i>Importar</a></li>
                <li><a href="#"><i class="fa fa-book fa-fw"></i>Exportar</a></li>
                <li><a href="#"><i class="fa fa-pencil fa-fw"></i>Opcion1</a></li>
                <li><a href="#"><i class="fa fa-cogs fa-fw"></i>Opcion2</a></li>
            </ul>
        </div>
        <div id="contenido" class="col-md-9 well">
          
       
            <h4>Inserción de Tareas Genéricas</h4>
            <br />
          
       
            <asp:Label ID="LabelError" runat="server" ForeColor="Black"></asp:Label>
            <br />
       
        Codigo:
        <asp:TextBox ID="TextBox1" CssClass="form-control" Width="100px" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="Rellena el codigo de la Tarea" ForeColor="Red"></asp:RequiredFieldValidator>
        <br />
        Descripcion:
        <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control" Width="402px" TextMode="MultiLine" Height="64px" ></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2" ErrorMessage="Rellena algun Detalle de la Tarea" ForeColor="Red"></asp:RequiredFieldValidator>
        <br />
        Asignatura:
        <asp:DropDownList ID="DropDownList1" runat="server" Width="200px" CssClass="form-control" DataSourceID="SqlDataSource1" DataTextField="codigoAsig" DataValueField="codigoAsig"></asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:hads14ConnectionString %>" SelectCommand="getAsignaturasProfesor" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:SessionParameter Name="profesor" SessionField="username" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
        Horas Estimadas:
        <asp:TextBox ID="TextBox3" runat="server" CssClass="form-control" TextMode="Number" Width="76px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox3" ErrorMessage="Asigna las horas estimadas de la Tarea" ForeColor="Red"></asp:RequiredFieldValidator>
        <br />
        Tipo de tarea:
        <asp:DropDownList ID="DropDownList2" CssClass="form-control" Width="200px" runat="server">
            <asp:ListItem Selected="True">Laboratorio</asp:ListItem>
            <asp:ListItem>Examen</asp:ListItem>
            <asp:ListItem>Trabajo</asp:ListItem>
            <asp:ListItem>Ejercicio</asp:ListItem>
            <asp:ListItem>Otros</asp:ListItem>
            </asp:DropDownList>
        <br />
        <asp:Button ID="Button1" runat="server" CssClass="btn btn-default" Text="Añadir" />
      
    </div>
            </div>
    </form>
</body>
</html>
