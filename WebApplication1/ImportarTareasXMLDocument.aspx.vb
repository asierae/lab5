Imports System.Xml
Imports System.Data.SqlClient
Imports accesoBD.GestBD
Imports System.IO

Public Class ImportarTareasXMLDocument
    Inherits System.Web.UI.Page

    Dim xml As XmlDocument
    Dim dapt As SqlDataAdapter
    Dim dst As DataSet
    Dim tbAsig As DataTable
    Dim tbTareas As DataTable

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Session("username") = "vadillo@ehu.es"
        If Not IsPostBack Then

            '' Cargar Lista Asignaturas, con el procedimiento almacenado no porque tarda y falla el selectedvalue
            conectar()
            Dim st = "SELECT codigoasig FROM ((GruposClase INNER JOIN ProfesoresGrupo ON email='" & Session("username") & "'and codigogrupo=codigo))"
            dapt = New SqlDataAdapter(st, conexion)
            dst = New DataSet()
            dapt.Fill(dst, "Asignaturas") ''cargamos la tabla
            tbAsig = New DataTable()
            tbAsig = dst.Tables("Asignaturas")

            DropDownList1.DataSource = tbAsig
            DropDownList1.DataValueField = "codigoasig"
            DropDownList1.DataBind()
            DropDownList1.Items.Item(0).Selected = True ''Mostramos los datos de la primera asignatura al cargar


            '' Cargar Lista Tareas
            conectar()
            st = "Select * FROM TareasGenericas"
            dapt = New SqlDataAdapter(st, conexion)
            Dim bldMbrs As New SqlCommandBuilder(dapt) ''Necesaqrio?
            dst = New DataSet()
            dapt.Fill(dst, "TareasGenericas") ''cargamos la tabla
            Session("dapt_tg") = dapt
            Session("dst_tg") = dst
            tbTareas = New DataTable()
            tbTareas = dst.Tables("TareasGenericas")
            cerrarConexion()

        Else
            tbTareas = Session("dst_tg").Tables("TareasGenericas")
            dst = Session("dst_tg")
            dapt = Session("dapt_tg")
        End If

        If File.Exists(Server.MapPath("App_Data/" & DropDownList1.SelectedValue & ".xml")) Then
            Label1.Text = ""
            Xml1.DocumentSource = Server.MapPath("App_Data/" & DropDownList1.SelectedValue & ".xml")
            Xml1.TransformSource = Server.MapPath("App_Data/XSLTFile.xsl")
        Else
            Label1.Text = "No hay XML(Tareas) en App_Data de esta asignatura "


        End If
    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Dim repetidas = False
        tbTareas.Columns("Codigo").Unique = True

        xml = New XmlDocument
        xml.Load(Server.MapPath("App_Data/" & DropDownList1.SelectedValue & ".xml"))
        Dim lasAsignaturas As XmlNodeList
        lasAsignaturas = xml.GetElementsByTagName("tarea")
        For Each node As XmlNode In lasAsignaturas

            Dim tmp = tbTareas.NewRow

            tmp.Item("Codigo") = node.ChildNodes(0).ChildNodes(0).Value
            tmp.Item("Descripcion") = node.ChildNodes(1).ChildNodes(0).Value
            tmp.Item("CodAsig") = DropDownList1.SelectedValue
            tmp.Item("HEstimadas") = node.ChildNodes(2).ChildNodes(0).Value
            tmp.Item("Explotacion") = node.ChildNodes(3).ChildNodes(0).Value
            tmp.Item("TipoTarea") = node.ChildNodes(4).ChildNodes(0).Value
            Try
                tbTareas.Rows.Add(tmp)
            Catch ex As ConstraintException
                repetidas = True
                Label1.Text = "Hay tareas repetidas, se insertaran sólo las nuevas"
            End Try
        Next

        Session("dapt_tg").update(Session("dst_tg"), "TareasGenericas")
        Session("dst_tg").acceptChanges()
        If Not repetidas Then
            Label1.Text = "Tareas Insertadas en La BD"
        Else
            Label1.ForeColor = Drawing.Color.Red
            Label1.Text = "Hay tareas repetidas, se han insertado sólo las nuevas"
        End If

    End Sub

    
End Class