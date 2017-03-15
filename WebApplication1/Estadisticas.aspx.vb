Public Class Estadisticas_aspx
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("logged") = False Then
            Response.Redirect("/Inicio.aspx?msj=Debes esta logueado para acceder")
        End If
        If Session("role") <> "P" Then
            Response.Write("No Estas Autorizado para acceder a este reurso <a href='/Inicio.aspx'>Inicio</a>")
            Response.End()
        End If

    End Sub

End Class