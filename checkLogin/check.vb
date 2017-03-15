Imports System.Web

Public Class Check
    Dim sess As HttpContext.Current.Session
    Public Function checkLogged() As Boolean
        If System.Web.HttpContext.CurrentSession("logged") = True Then
            Return True
        End If
        Return False

    End Function


End Class
