Imports System.Data.SqlClient
Public Class Login1
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub btnLogin_Click(ByVal sender As Object, ByVal e As EventArgs) Handles btnLogin.Click
        Dim usuario As String = ""
        Dim contrasenia As String = ""
        Dim Sql As String
        usuario = usuarioTxt.Text
        contrasenia = contraseniaTxt.Text
        Sql = "SELECT usuario, contrasenia FROM Usuarios WHERE usuario='" & usuario & "' and contrasenia='" & contrasenia & "'"

        Try
            Dim Conexion As New SqlConnection()
            Dim Comando As New SqlCommand()
            Dim Lector As SqlDataReader
            Conexion.ConnectionString = "Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\Carros.mdf;Integrated Security=True;User Instance=True"
            Comando.Connection = Conexion
            Comando.CommandType = CommandType.Text
            Comando.CommandText = Sql
            Conexion.Open()
            Lector = Comando.ExecuteReader(CommandBehavior.CloseConnection)
            If Lector.HasRows Then 'Existe un usuario con ese nick
                Lector.Read()
                Session("Registrado") = "ok" 'Cualquier contenido de esta variable funcionará, pues en la página p2.aspx solo se verifica que no sea vacío: ""
                Lector.Close()
                Comando.Dispose()
                Conexion.Close()
                Conexion.Dispose()
                Response.Redirect("Marcas.aspx") 'Se va a la segunda página
            Else
            lblError.Text = "Error: Usuario no encontrado"
            End If
            Lector.Close()
            Comando.Dispose()
            Conexion.Close()
            Conexion.Dispose()
        Catch ex As Exception
            lblError.Text = "Error: " & ex.Message
        End Try
    End Sub
End Class