Public Class Home
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Session("logged") = True Then
            Label1.Text = "Bienvenido " & Session("username") & ""
        Else
            Response.Redirect("/Inicio.aspx?msj=Acceso Restringido, logueate antes")
        End If
    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Session.Abandon()
        Response.Redirect("/Inicio.aspx?msj= Vuelve Pronto, te estaremos esperando :)")
    End Sub
End Class