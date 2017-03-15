Public Class LogOut_aspx
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Session.Abandon()
        Response.Redirect("/Inicio.aspx?msj= Vuelve Pronto :)")
    End Sub

End Class