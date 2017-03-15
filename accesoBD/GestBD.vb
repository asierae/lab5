Imports System.Data.SqlClient

Public Class GestBD
    '' Establecer y abrir una conexión a una BD Sql

    Public Shared conexion As New SqlConnection
    Private Shared comando As New SqlCommand
    Public Shared Function conectar() As String
        Try
            ''EHU
            ''conexion.ConnectionString = "Data Source=158.227.106.20;Initial Catalog=hads14_Usuarios;Persist Security Info=True;User ID=HADS14;Password=canguro"
            ''AZURE
            ''conexion.ConnectionString = "Server=tcp:hadsierae.database.windows.net,1433;Initial Catalog=hadsi14_Usuarios;Persist Security Info=False;User ID=hads14@hadsierae;Password=$uperPass13;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;"
            ''AZURE 2
            conexion.ConnectionString = "Data Source=asierae.database.windows.net;Initial Catalog=hads14;User ID=hads@asierae;Password=$uperPass13"

            conexion.Open()
        Catch ex As Exception
            Return "ERROR DE CONEXIÓN" + ex.Message
        End Try
        Return "CONEXION OK"
    End Function

    Public Shared Function cerrarConexion() As Boolean
        conexion.Close()
        Return True
    End Function


End Class
