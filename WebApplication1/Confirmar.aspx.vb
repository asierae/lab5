Imports System.Data.SqlClient
Imports accesoBD.GestBD
Public Class Confirmar
    Inherits System.Web.UI.Page

    Public Shared conn As accesoBD.GestBD
    Private Shared comando As New SqlCommand

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If IsNothing(Request.Params("mbr")) Or IsNothing(Request.Params("mbr")) Then
            Label1.Text = "Te has perdido?"
        Else
            conectar()
            If existePeticion(Request.Params("mbr"), Int(Request.Params("numconf"))) Then

                Dim st = "UPDATE Usuarios set confirmado='" & True & "' WHERE email='" & Request.Params("mbr") & "'"
                Dim numregs As Integer
                comando = New SqlCommand(st, conexion)
                Try
                    numregs = comando.ExecuteNonQuery()
                Catch ex As Exception
                    Label1.Text = ex.Message
                End Try
                If (numregs > 0) Then
                    Label1.Text = "Tu cuenta ha sido activada! Procede a loguearte"
                Else
                    Label1.Text = "Fallo al activar tu cuenta, prueba de nuevo"
                End If
            Else
                Label1.Text = "Petición no válida o tu cuenta ya se encuentra activa, Prueba a loguearte"
            End If
        End If
        cerrarConexion()
    End Sub
    Function existePeticion(ByVal email As String, ByVal cod As Integer) As Boolean


        Dim existe As Integer
        Dim st = "SELECT count(*) FROM Usuarios WHERE email='" & email & "' and numconfir=" & cod & " and confirmado='" & False & "'"

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
        cerrarConexion()
    End Function
    Protected Sub LinkButton1_Click(sender As Object, e As EventArgs) Handles LinkButton1.Click
        Response.Redirect("/Inicio.aspx")
    End Sub
End Class