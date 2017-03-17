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
        If Session("logged") = False Then
            Response.Redirect("Inicio.aspx?msj= Debes estar logueado para acceder")
        ElseIf Session("role") = "A" Then
            Response.Write("No Estas Autorizado para acceder a este reurso <a href='/Inicio.aspx'>Inicio</a>")
            Response.End()
        End If
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

            If File.Exists(Server.MapPath("App_Data/" & DropDownList1.SelectedValue & ".xml")) Then
                Label1.Text = ""
                Xml1.DocumentSource = Server.MapPath("App_Data/" & DropDownList1.SelectedValue & ".xml")
                Xml1.TransformSource = Server.MapPath("App_Data/XSLTFile.xsl")
            Else
                Label1.Text = "No hay XML(Tareas) en App_Data de esta asignatura "


            End If
        Else
            tbTareas = Session("dst_tg").Tables("TareasGenericas")
            dst = Session("dst_tg")
            dapt = Session("dapt_tg")
        End If


    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click

        If File.Exists(Server.MapPath("App_Data/" & DropDownList1.SelectedValue & ".xml")) Then
            Label1.Text = ""
            Xml1.DocumentSource = Server.MapPath("App_Data/" & DropDownList1.SelectedValue & ".xml")
            Xml1.TransformSource = Server.MapPath("App_Data/XSLTFile.xsl")
   

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
            Label1.Text = "Hay tareas repetidas con el mismo codigo"
            End If
        Else
            Label1.Text = "No hay XML(Tareas) en App_Data de esta asignatura "


        End If

    End Sub

    
    Protected Sub LinkButton1_Click(sender As Object, e As EventArgs) Handles LinkButton1.Click

        If File.Exists(Server.MapPath("App_Data/" & DropDownList1.SelectedValue & ".xml")) Then
            Label1.ForeColor = Drawing.Color.Black
            Xml1.DocumentSource = Server.MapPath("App_Data/" & DropDownList1.SelectedValue & ".xml")
            Xml1.TransformSource = Server.MapPath("App_Data/OrdenarCodigo.xsl")
            Label1.Text = "Tabla ordenada por codigo"
        End If

    End Sub

    Protected Sub LinkButton3_Click(sender As Object, e As EventArgs) Handles LinkButton3.Click
        If File.Exists(Server.MapPath("App_Data/" & DropDownList1.SelectedValue & ".xml")) Then
            Label1.ForeColor = Drawing.Color.Black
            Xml1.DocumentSource = Server.MapPath("App_Data/" & DropDownList1.SelectedValue & ".xml")
            Xml1.TransformSource = Server.MapPath("App_Data/OrdenarHestimadas.xsl")
            Label1.Text = "Tabla ordenada por HEstimadas"
        End If
    End Sub

    Protected Sub LinkButton4_Click(sender As Object, e As EventArgs) Handles LinkButton4.Click
        If File.Exists(Server.MapPath("App_Data/" & DropDownList1.SelectedValue & ".xml")) Then
            Label1.ForeColor = Drawing.Color.Black
            Xml1.DocumentSource = Server.MapPath("App_Data/" & DropDownList1.SelectedValue & ".xml")
            Xml1.TransformSource = Server.MapPath("App_Data/OrdenarDescripcion.xsl")
            Label1.Text = "Tabla ordenada por Descripción"
        End If

    End Sub

    Protected Sub DropDownList1_SelectedIndexChanged(sender As Object, e As EventArgs) Handles DropDownList1.SelectedIndexChanged
        If File.Exists(Server.MapPath("App_Data/" & DropDownList1.SelectedValue & ".xml")) Then
            Label1.Text = ""
            Xml1.DocumentSource = Server.MapPath("App_Data/" & DropDownList1.SelectedValue & ".xml")
            Xml1.TransformSource = Server.MapPath("App_Data/XSLTFile.xsl")
        Else
            Label1.Text = "No hay XML(Tareas) en App_Data de esta asignatura "


        End If
    End Sub
End Class