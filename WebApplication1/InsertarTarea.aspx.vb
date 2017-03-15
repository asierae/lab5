Imports System.Data.SqlClient
Imports accesoBD.GestBD
Public Class InsertarTarea
    Inherits System.Web.UI.Page

    Dim dapt As SqlDataAdapter
    Dim dst As DataSet
    Dim tbTareas As DataTable

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("logged") = False Then
            Response.Redirect("/Inicio.aspx")
        End If
        If Session("role") <> "P" Then
            Response.Write("No Estas Autorizado para acceder a este reurso <a href='/Inicio.aspx'>Inicio</a>")
            Response.End()
        End If
    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        conectar()
        Dim st = "SELECT * FROM TareasGenericas"
        dapt = New SqlDataAdapter(st, conexion)
        Dim bldMbrs As New SqlCommandBuilder(dapt)
        dst = New DataSet()
        dapt.Fill(dst, "TareasGenericas") ''cargamos la tabla
        tbTareas = New DataTable()
        tbTareas = dst.Tables("TareasGenericas")

        tbTareas.Columns("Codigo").Unique = True ''inserta en la tabla solo una vez cada tarea gracias

        Try
            Dim tmp = tbTareas.NewRow()
            tmp("Codigo") = TextBox1.Text
            tmp("Descripcion") = TextBox2.Text
            tmp("CodAsig") = DropDownList1.SelectedValue
            tmp("HEstimadas") = TextBox3.Text
            tmp("Explotacion") = True ''Por defecto True, no dice nada al respecto
            tmp("TipoTarea") = DropDownList2.SelectedValue

            tbTareas.Rows.InsertAt(tmp, tbTareas.Rows.Count + 1)

            dapt.Update(dst, "TareasGenericas") 'commit
            dst.AcceptChanges()
            LabelError.Text = "Tarea insertada con éxito, cambios guardados en la BD"
        Catch ex As ConstraintException
            LabelError.ForeColor = Drawing.Color.Red
            LabelError.Text = "Otra Tarea ya contiene ese código"
        Catch x As Exception
            LabelError.Text = x.Message
        End Try
        cerrarConexion()
    End Sub
End Class