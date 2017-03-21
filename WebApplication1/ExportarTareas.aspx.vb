Imports System.Xml
Imports System.Data.SqlClient
Imports accesoBD.GestBD
Imports System.IO
Imports Newtonsoft.Json

Public Class ExportarTareas
    Inherits System.Web.UI.Page

    Dim xml As XmlDocument
    Dim dapt As SqlDataAdapter
    Dim dst As DataSet
    Dim tbTareas As DataTable
    Dim tbTareasAsig As DataTable
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
            tbTareas = New DataTable()
            tbTareas = dst.Tables("Asignaturas")

            DropDownList1.DataSource = tbTareas
            DropDownList1.DataValueField = "codigoasig"
            DropDownList1.DataBind()
            DropDownList1.Items.Item(0).Selected = True

            '' Cargar Lista Tareas
            conectar()
            st = "SELECT codigo,descripcion,hestimadas,explotacion,tipotarea FROM TareasGenericas WHERE CodAsig='" & DropDownList1.SelectedValue & "'"
            'cojo todas las de ese profesor y luego filtro por codAsig para acceder solo una vez
            'st = "SELECT TareasGenericas.Codigo, TareasGenericas.CodAsig, TareasGenericas.Descripcion, TareasGenericas.Explotacion, TareasGenericas.HEstimadas, TareasGenericas.TipoTarea FROM ((TareasGenericas INNER JOIN GruposClase ON TareasGenericas.CodAsig=GruposClase.codigoasig) INNER JOIN ProfesoresGrupo ON GruposClase.codigo=ProfesoresGrupo.codigogrupo) WHERE ProfesoresGrupo.email='" & Session("username") & "' and CodAsig in(SELECT codigoasig FROM ((GruposClase INNER JOIN ProfesoresGrupo ON email='" & Session("username") & "'and codigogrupo=codigo)))"
            dapt = New SqlDataAdapter(st, conexion)
            Dim bldMbrs As New SqlCommandBuilder(dapt) ''Necesaqrio?
            dst = New DataSet()
            dapt.Fill(dst, "TareasGenericas") ''cargamos la tabla
            Session("dst_T2A") = dst
            tbTareas = New DataTable()
            tbTareas = dst.Tables("TareasGenericas")

            GridView1.DataSource = tbTareas
            GridView1.DataBind()
            cerrarConexion()
        Else
            tbTareas = Session("dst_T2A").Tables("TareasGenericas")

        End If

    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Session("dst_T2A").Tables("TareasGenericas").TableName = "tarea"
        Session("dst_T2A").DataSetName = "tareas"


        Try

            Session("dst_T2A").WriteXml(Server.MapPath(("./App_Data/" & DropDownList1.SelectedValue & ".xml")))
            Label1.Text = "Tareas exportadas con exito a " & DropDownList1.SelectedValue & ".xml"
        Catch ex As Exception
            Label1.Text = ex.Message
            'Label1.Text = "Error al exportar las tareas a XML"
        End Try
        Session("dst_T2A").Tables("tarea").TableName = "TareasGenericas"
    End Sub

    Protected Sub DropDownList1_SelectedIndexChanged(sender As Object, e As EventArgs) Handles DropDownList1.SelectedIndexChanged
        '' Cargar Lista Tareas
        conectar()
        Dim st = "SELECT codigo,descripcion,hestimadas,explotacion,tipotarea FROM TareasGenericas WHERE CodAsig='" & DropDownList1.SelectedValue & "'"
        dapt = New SqlDataAdapter(st, conexion)
        Dim bldMbrs As New SqlCommandBuilder(dapt) ''Necesario?
        dst = New DataSet()
        dapt.Fill(dst, "TareasGenericas") ''cargamos la tabla
        Session("dst_T2A") = dst
        tbTareas = New DataTable()
        tbTareas = dst.Tables("TareasGenericas")

        GridView1.DataSource = tbTareas
        GridView1.DataBind()
        cerrarConexion()
    End Sub

    Protected Sub Button3_Click(sender As Object, e As EventArgs) Handles Button3.Click
        Dim ds As DataSet
        Session("dst_T2A").Tables("TareasGenericas").TableName = "tarea"
        Session("dst_T2A").DataSetName = "tareas"
        Try

            Session("dst_T2A").WriteXml(Server.MapPath(("./App_Data/" & DropDownList1.SelectedValue & ".xml")))
            Label1.Text = "Tareas exportadas con exito a " & DropDownList1.SelectedValue & ".xml"
        Catch ex As Exception
            Label1.Text = "Error al exportar las tareas a XML"
        End Try
        Dim xd As XmlDocument = New XmlDocument()
        xd.Load(Server.MapPath((DropDownList1.SelectedValue & ".xml")))
        xd.DocumentElement.SetAttribute("xmlns:" & DropDownList1.SelectedValue.ToLower, "http://ji.ehu.es/" & DropDownList1.SelectedValue.ToLower)

        xd.Save((Server.MapPath(DropDownList1.SelectedValue & ".xml")))
        Session("dst_T2A").Tables("tarea").TableName = "TareasGenericas"
    End Sub

    Protected Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click
        Try
            Dim sche = JsonConvert.SerializeObject(Session("dst_T2A").Tables("TareasGenericas"))
            File.WriteAllText(Server.MapPath((DropDownList1.SelectedValue & ".json")), sche.ToString())

            Label1.Text = "Tareas exportadas con exito a " & DropDownList1.SelectedValue & ".json"
        Catch ex As Exception
            Label1.Text = "Error al exportar las tareas a JSON"
        End Try
    End Sub
End Class