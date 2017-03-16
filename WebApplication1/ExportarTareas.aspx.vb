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
        Session("username") = "vadillo@ehu.es"
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
            st = "SELECT * FROM TareasGenericas WHERE CodAsig='" & DropDownList1.SelectedValue & "'"
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
        Try
            Session("dst_T2A").WriteXml(Server.MapPath((DropDownList1.SelectedValue & ".xml")))
            Label1.Text = "Tareas exportadas con exito a " & DropDownList1.SelectedValue & ".xml"
        Catch ex As Exception
            Label1.Text = "Error al exportar las tareas a XML"
        End Try

    End Sub

    Protected Sub DropDownList1_SelectedIndexChanged(sender As Object, e As EventArgs) Handles DropDownList1.SelectedIndexChanged
        '' Cargar Lista Tareas
        conectar()
        Dim st = "SELECT * FROM TareasGenericas WHERE CodAsig='" & DropDownList1.SelectedValue & "'"
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
        Dim tabla As DataTable = New DataTable(Session("dst_T2A").Table("TareasGenericas"))

        Dim settings As XmlWriterSettings = New XmlWriterSettings()
        settings.Indent = True
        ' añade sangrias al resultado
        Using writer As XmlWriter = XmlWriter.Create(Server.MapPath((DropDownList1.SelectedValue & ".xml")), settings)
            'Cabecera
            writer.WriteStartDocument()
            ''AQUI LE AÑADO EL NS
            writer.WriteStartElement("tareas", "http://ji.ehu.es/" & DropDownList1.SelectedValue.ToLower)
            'recorremos tabla
            For Each x As DataRow In tabla.Rows

            Next
        End Using
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