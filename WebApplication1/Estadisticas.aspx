<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Estadisticas.aspx.vb" Inherits="WebApplication1.Estadisticas_aspx" %>

<%@ Register assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI.DataVisualization.Charting" tagprefix="asp" %>

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
    <div>
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
                <li><a href="#"><i class="fa fa-tasks fa-fw"></i>Alumnos</a></li>
                <li><a href="#"><i class="fa fa-calendar fa-fw"></i>Importar</a></li>
                <li><a href="#"><i class="fa fa-book fa-fw"></i>Exportar</a></li>
                <li><a href="#"><i class="fa fa-pencil fa-fw"></i>Opcion1</a></li>
                <li><a href="#"><i class="fa fa-cogs fa-fw"></i>Opcion2</a></li>
            </ul>
        </div>
            <div id="contenido" class="col-md-9 well">
                <br />
                Asignaturas que impartes:<asp:DropDownList ID="DropDownList1" CssClass="form-control" AutoPostBack="true" runat="server" DataSourceID="SqlDataSource2" Width="300px" DataTextField="codigoAsig" DataValueField="codigoAsig">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:hads14ConnectionString %>" SelectCommand="getAsignaturasProfesor" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:SessionParameter Name="profesor" SessionField="username" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <br />
                Alumnos de la Asignatura:<asp:DropDownList ID="DropDownList2" CssClass="form-control" AutoPostBack="true" runat="server" Width="300px" DataSourceID="SqlDataSource3" DataTextField="Email" DataValueField="Email">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:hads14ConnectionString %>" SelectCommand="getAlumnosAsignatura" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownList1" Name="asignatura" PropertyName="SelectedValue" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <br />
                <h4>Tiempo Dedicado A cada Tarea de La Asignatura del Profesor seleccionada del Alumno elegido</h4>
                <br />
        <asp:Chart ID="Chart1" runat="server" DataSourceID="SqlDataSource1">
            <series>
                <asp:Series ChartType="Pie" Name="Series1" XValueMember="CodTarea" YValueMembers="HReales" YValuesPerPoint="6">
                </asp:Series>
            </series>
            <chartareas>
                <asp:ChartArea Name="ChartArea1">
                </asp:ChartArea>
            </chartareas>
        </asp:Chart>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:hads14ConnectionString %>" SelectCommand="getHorasTareasAlumno" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList2" Name="alumno" PropertyName="SelectedValue" Type="String" />
                <asp:ControlParameter ControlID="DropDownList1" DefaultValue="HAS" Name="asignatura" PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
    
                <h4>&nbsp;</h4>
                <h4>Tiempo Estimado de cada Tarea Vs Tiempo Realizado en la Tarea por el Alumno seleccionado</h4>
                <br />
                <asp:Chart ID="Chart2" runat="server" DataSourceID="SqlDataSource1">
                    <Series>
                        <asp:Series ChartType="Bar" Name="Series1" XValueMember="HEstimadas" YValueMembers="HReales">
                        </asp:Series>
                    </Series>
                    <ChartAreas>
                        <asp:ChartArea Name="ChartArea1">
                        </asp:ChartArea>
                    </ChartAreas>
                </asp:Chart>
                <br />
                <br />
                <h4>Todas las Tareas de la asignatura que más horas se le han dedicado de todos los alumnos de la asignatura</h4>
                <br />
                <asp:Chart ID="Chart3" runat="server" DataSourceID="SqlDataSource4">
                    <Series>
                        <asp:Series ChartType="Doughnut" Name="Series1" XValueMember="CodTarea" YValueMembers="Column1" YValuesPerPoint="6">
                        </asp:Series>
                    </Series>
                    <ChartAreas>
                        <asp:ChartArea Name="ChartArea1">
                        </asp:ChartArea>
                    </ChartAreas>
                </asp:Chart>
                <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:hads14ConnectionString %>" SelectCommand="getHorasTotalesTareasAsignatura" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownList1" Name="asignatura" PropertyName="SelectedValue" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
    
    </div> 
    </div>
    </form>
    <p>
        &nbsp;</p>
</body>
</html>
