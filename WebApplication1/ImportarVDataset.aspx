<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="ImportarVDataset.aspx.vb" Inherits="WebApplication1.ImportarVDataset" %>

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
                <li><a href="ImportarTareasXMLDocument.aspx"><i class="fa fa-calendar fa-fw"></i>Importar Tareas(XMLDocument)</a></li>
                <li><a href="/ImportarVDataset.aspx">ImportarTareas(DataSet)</a></li>
                <li><a href="ExportarTareas.aspx"><i class="fa fa-book fa-fw"></i>Exportar Tareas</a></li>
                <li><a href="#">OpcionFuture</a></li>
            </ul>
        </div>
        <div id="contenido" class="col-md-9 well">
            </table>
            <td class="auto-style1">
            <h4>Importar Asignaturas</h4>
            <br />
            Asignaturas
            <br />
            <asp:DropDownList ID="DropDownList1" CssClass="form-control" Width="240px" runat="server" AutoPostBack="True">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:hads14ConnectionString %>" SelectCommand="getAsignaturasProfesor" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:SessionParameter Name="profesor" SessionField="username" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
             <br />
  
            &nbsp;
                </td>
            
             <td class="auto-style1">
            <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" Width="451px">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
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
            <br /></td>
        <td class="auto-style1">
            <br />
   <asp:Label ID="Label1" runat="server"></asp:Label>
            <br />
            <br />
             <asp:Button ID="Button1" CssClass="btn btn-default" runat="server" Text="Importar Tareas XML" />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;      
        </td>
        </table>
        
        </div>
              </div>
     
    </form>
    <p>
        &nbsp;</p>
</body>
</html>
