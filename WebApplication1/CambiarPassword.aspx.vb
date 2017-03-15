Imports System.Data.SqlClient
Imports accesoBD.GestBD
Public Class CambiarPassword
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        divCambiarPass.Visible = False
        divObtenerPregunta.Visible = False


        conectar()
    End Sub

    Protected Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click
        If comprobarRespuesta(TextBox2.Text) Then
            Label2.Text = ""
            divCambiarPass.Visible = True
        Else
            Label2.Text = "Respuesta Incorrecta"
        End If
    End Sub

    Public Function comprobarRespuesta(ByVal resp As String) As Boolean
        ''Comprobar si la respuesta es la correcta en la BD
        Dim existe As Integer
        Dim st = "SELECT count(*) FROM Usuarios WHERE email='" & TextBox5.Text & "' and respuesta='" & TextBox2.Text & "'"
        Dim comando = New SqlCommand(st, conexion)
        Try
            existe = comando.ExecuteScalar()
        Catch ex As Exception
            Label2.Text = (ex.Message)
        End Try
        If existe > 0 Then
            Me.ViewState("username") = TextBox5.Text
            MsgBox(Me.ViewState("username"))
            Return True
        Else
            Return False
        End If
    End Function

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        ''Cambiar Password
        Dim newpass = TextBox3.Text
        Dim st = "UPDATE Usuarios set pass='" & TextBox3.Text & "' WHERE email='" & Me.ViewState("username") & "' and respuesta='" & TextBox2.Text & "'"

            Dim numregs As Integer
            Dim comando = New SqlCommand(st, conexion)
            Try
            numregs = comando.ExecuteNonQuery()

            Catch ex As Exception
            Label2.Text = ex.Message
        End Try
        If (numregs > 0) Then
            Label2.Text = "Has cambiado tu Contraseña con exito, apuntala bien!"
        Else
            Label2.Text = "Comprueba los datos introducidos"
        End If

        cerrarConexion()

    End Sub


    Protected Sub Button3_Click(sender As Object, e As EventArgs) Handles Button3.Click
        ''Obtener y rellenar Pregunta

        Dim resp
        Dim st = "SELECT * FROM Usuarios WHERE email='" & TextBox5.Text & "' "

        Dim comando = New SqlCommand(st, conexion)
        Try
            resp = comando.ExecuteReader()
        Catch ex As Exception
            Label2.Text = (ex.Message)
        End Try
        If Not resp.Read() Then
            Label2.Text = "No estas registrado con este email"
        Else

            Label2.Text = ""
            TextBox1.Text = resp.Item("pregunta")
            divObtenerPregunta.Visible = True
        End If

        resp.dispose()
    End Sub

    Protected Sub LinkButton1_Click(sender As Object, e As EventArgs) Handles LinkButton1.Click
        Response.Redirect("/Inicio.aspx")


    End Sub
End Class