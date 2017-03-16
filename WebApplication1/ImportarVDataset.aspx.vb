Imports System.Xml
Imports System.Data.SqlClient
Imports accesoBD.GestBD
Imports System.IO
Public Class ImportarVDataset
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
            st = "Select * FROM TareasGenericas WHERE CodAsig='" & DropDownList1.SelectedValue & "'"
            dapt = New SqlDataAdapter(st, conexion)
            Dim bldMbrs As New SqlCommandBuilder(dapt) ''Necesaqrio?
            dst = New DataSet()
            dapt.Fill(dst, "TareasGenericas") ''cargamos la tabla
            Session("dapt_tg") = dapt
            Session("dst_tg") = dst
            tbTareas = New DataTable()
            tbTareas = dst.Tables("TareasGenericas")

            GridView1.DataSource = tbTareas
            GridView1.DataBind()
            cerrarConexion()

        Else
            tbTareas = Session("dst_tg").Tables("TareasGenericas")
            dst = Session("dst_tg")
            dapt = Session("dapt_tg")
        End If

    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click

        If File.Exists(Server.MapPath("App_Data/" & DropDownList1.SelectedValue & ".xml")) Then
            Label1.Text = ""
            Dim ds As New DataSet
            ds.ReadXml(Server.MapPath("App_Data/" & DropDownList1.SelectedValue & ".xml"))
            Dim temp As DataTable = New DataTable()
            Dim tmp As DataColumn = New DataColumn
            tmp.ColumnName = "CodAsig"
            tmp.DefaultValue = DropDownList1.SelectedValue
            ds.Tables(0).Columns.Add(tmp)
            ds.Tables(0).Columns("Codigo").Unique = True
            Try
                temp = Session("dst_tg").Tables("TareasGenericas").Merge(ds.Tables(0))
                GridView1.DataSource = temp
                GridView1.DataBind()
            Catch ex As Exception
                Label1.Text = "Hay tareas con el mismo codigo, no se pueden insertar"
            End Try


            Try
                Session("dapt_tg").update(Session("dst_tg"), "TareasGenericas")
                Session("dst_tg").AcceptChanges()
                Label1.Text = "Tareas Añadidas con exito :)"
            Catch ex As Exception
                Label1.Text = "Hay tareas con el mismo codigo, no se pueden insertar"
            End Try

        Else
            Label1.Text = "No hay XML(Tareas) en App_Data de esta asignatura "

        End If



    End Sub

    Protected Sub DropDownList1_SelectedIndexChanged(sender As Object, e As EventArgs) Handles DropDownList1.SelectedIndexChanged
        '' Cargar Lista Tareas
        conectar()
        Dim st = "Select * FROM TareasGenericas WHERE CodAsig='" & DropDownList1.SelectedValue & "'"
        dapt = New SqlDataAdapter(st, conexion)
        Dim bldMbrs As New SqlCommandBuilder(dapt) ''Necesaqrio?
        dst = New DataSet()
        dapt.Fill(dst, "TareasGenericas") ''cargamos la tabla
        Session("dapt_tg") = dapt
        Session("dst_tg") = dst
        tbTareas = New DataTable()
        tbTareas = dst.Tables("TareasGenericas")
        GridView1.DataSource = tbTareas
        GridView1.DataBind()
        cerrarConexion()
    End Sub
End Class