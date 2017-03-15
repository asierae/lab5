Imports System.Data.SqlClient
Imports accesoBD.GestBD
Public Class InstanciarTarea
    Inherits System.Web.UI.Page

    Dim dapt As SqlDataAdapter
    Dim dst As DataSet
    Dim tbTareas As DataTable

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        ''Control Accesp
        If Session("logged") = False Then
            Response.Redirect("Inicio.aspx?msj= Debes estar logueado para acceder")
        End If
        If Session("role") <> "A" Then
            Response.Write("No Estas Autorizado para acceder a este reurso <a href='/Inicio.aspx'>Inicio</a>")
            Response.End()
        End If
        TextBox1.Text = Session("username")
        TextBox2.Text = Request.Params("cod")
        TextBox3.Text = Request.Params("h")
        If Not IsPostBack Then
            '' Cargar Lista Asignaturas
            conectar()
            Dim st = "Select * FROM EstudiantesTareas WHERE Email='" & Session("username") & "'"
            dapt = New SqlDataAdapter(st, conexion)
            Dim bldMbrs As New SqlCommandBuilder(dapt) ''Necesaqrio?
            dst = New DataSet()
            dapt.Fill(dst, "EstudiantesTareas") ''cargamos la tabla
            Session("dapt_E2T") = dapt
            Session("dst_E2T") = dst
            tbTareas = New DataTable()
            tbTareas = dst.Tables("EstudiantesTareas")
            
            GridView1.DataSource = tbTareas

            GridView1.DataBind()
        Else
            tbTareas = Session("dst_E2T").Tables("EstudiantesTareas")
            dst = Session("dst_E2T")
        End If

    End Sub



    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click

        tbTareas.Columns("CodTarea").Unique = True ''inserta en la tabla solo una vez cada tarea gracias

        Try
            Dim tmp = tbTareas.NewRow()
            tmp("Email") = Session("username")
            tmp("CodTarea") = TextBox2.Text
            tmp("HEstimadas") = TextBox3.Text
            tmp("HReales") = TextBox4.Text

            ''tbTareas.Rows.Add(tmp)''
            tbTareas.Rows.InsertAt(tmp, tbTareas.Rows.Count + 1)

            GridView1.DataSource = tbTareas
            GridView1.DataBind()
            Session("dapt_E2T").Update(dst, "EstudiantesTareas") 'commit
            dst.AcceptChanges()
            Label5.Text = "Tarea Instanciada con éxito, cambios guardados en la BD"
        Catch ex As ConstraintException
            Label5.ForeColor = Drawing.Color.Red
            Label5.Text = "Esta Tarea ya está Instanciada"
        Catch x As Exception
            Label5.Text = x.Message
        End Try

    End Sub

    Protected Sub LinkButton1_Click(sender As Object, e As EventArgs) Handles LinkButton1.Click
        Response.Redirect("/TareasAlumno.aspx")
    End Sub
End Class