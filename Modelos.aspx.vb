Public Class Modelos
    Inherits System.Web.UI.Page
    Dim cad As String
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        cad = Session("marca")
    End Sub

    Protected Sub GridView1_SelectedIndexChanged(ByVal sender As Object, ByVal e As EventArgs) Handles gridModelos.SelectedIndexChanged
        Dim id As String
        id = gridModelos.Rows(gridModelos.SelectedIndex).Cells(0).Text
        Session("modelo") = id
        Session("marca") = cad
        Response.Redirect("Descripcion.aspx")
    End Sub

    Protected Sub btnVolverMarcas_Click(ByVal sender As Object, ByVal e As EventArgs) Handles btnVolverMarcas.Click
        Response.Redirect("Marcas.aspx")
    End Sub
End Class