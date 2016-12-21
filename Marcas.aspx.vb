Public Class Marcas
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub GridView1_SelectedIndexChanged(ByVal sender As Object, ByVal e As EventArgs) Handles gridMarcas.SelectedIndexChanged
        Dim id As String
        id = gridMarcas.Rows(gridMarcas.SelectedIndex).Cells(0).Text
        lblprueba.Text = id
        Session("marca") = id
        Response.Redirect("Modelos.aspx")

        Dim comparador As String
        comparador = gridMarcas.Rows(gridMarcas.SelectedIndex).Cells(0).Text



    End Sub
End Class