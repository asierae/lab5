Imports accesoBD.GestBD
Imports System.Data.SqlClient


Public Class Registro

    Inherits System.Web.UI.Page
    Public host As String = "http://hadsier.azurewebsites.net" ''http://localhost
    Public Shared conn As accesoBD.GestBD
    Private Shared comando As New SqlCommand
    Public key As Integer


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        ' MsgBox(conectar())


    End Sub

    Public Function RandomKey() As Integer
        Dim NumConf As Decimal
        Randomize()
        NumConf = CLng(Rnd() * 9000000) + 1000000
        Return NumConf
    End Function

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Dim emailer As New Email.Email
        Dim url_activar As String
        If Page.IsValid Then
            conectar()
            key = RandomKey()
            url_activar = host + "/Confirmar.aspx?mbr=" + TextBox1.Text + "&numconf=" + key.ToString

            If registrar() = "OK" Then
                emailer.enviarEmail(TextBox1.Text, "Email de Bienvenida", "Bienvenido! Activa tu cuenta desde la siguiente dirección:" + url_activar)
                Literal1.Text = "Te has registrado con exito " & TextBox2.Text.Split().GetValue(0) & "! Comprueba tu correo para activar la cuenta"
            Else
                Literal1.Text = "Error al registrar,comprueba los datos"
            End If
        End If


    End Sub

    Public Function registrar() As String

        If usuarioExiste(TextBox1.Text) Then
            Label1.Text = "El email ya se encuentra registrado"
            Return "Repetido"
        End If

        Dim array = TextBox2.Text.Split()
        Dim apellidos
        If array.Length >= 3 Then
            apellidos = array.GetValue(1) & " " & array.GetValue(2)
        Else
            apellidos = array.GetValue(1)
        End If

        Dim st = "insert into Usuarios (email,nombre,apellidos,pregunta,respuesta,dni,numconfir,confirmado,pass) values('" & TextBox1.Text & "','" & array.GetValue(0) & "','" & apellidos & "','" & TextBox6.Text & "','" & TextBox7.Text & "','" & TextBox3.Text & "'," & key & ",'" & False & "','" & TextBox4.Text & "')"

        Dim numregs As Integer
        comando = New SqlCommand(st, accesoBD.GestBD.conexion)
        Try
            numregs = comando.ExecuteNonQuery()
        Catch ex As Exception
            Return ex.Message
        End Try
        'Return (numregs & " registro(s) insertado(s) en la BD ")
        Return "OK"
    End Function

    Function usuarioExiste(ByVal email As String) As Boolean

        Dim existe As Integer
        Dim st = "SELECT count(*) FROM Usuarios WHERE email='" & email & "'"
        comando = New SqlCommand(st, conexion)
        Try
            existe = comando.ExecuteScalar()
        Catch ex As Exception
            Label1.Text = (ex.Message)
        End Try
        If existe > 0 Then
            Return True
        Else
            Return False
        End If

    End Function

    Protected Sub LinkButton1_Click(sender As Object, e As EventArgs) Handles LinkButton1.Click
        Response.Redirect("/Inicio.aspx")
    End Sub
End Class