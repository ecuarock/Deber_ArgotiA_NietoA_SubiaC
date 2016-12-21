Imports System.Data.SqlClient
Public Class Descripcion
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim id As String
        Dim Cad As String = ""
        Dim Sql As String
        id = Session("modelo")
        Sql = "SELECT nombre,fechalanz,valorcomercial FROM Modelo WHERE id = '" & id & "'"

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
                While (Lector.Read()) 'se lee fila por fila hasta que no hayan mas
                    Cad &= Lector.Item(0).ToString() & "<br/><br/><br/>Fecha de lanzamiento: "
                    Cad &= Lector.Item(1).ToString() & "<br />Valor Comercial: "
                    Cad &= Lector.Item(2).ToString() & "<br/>"
                End While
            End If
            Lector.Close()
            Comando.Dispose()
            Conexion.Close()
            Conexion.Dispose()
        Catch ex As Exception
            LblError.Text = "Error: " & ex.Message
        End Try
        lblDescripcion.Text = Cad & verTipo(id)
    End Sub

    Protected Function verTipo(ByVal idModelo As String) As String
        Dim Cad As String = ""
        Dim Sql As String
        Sql = "SELECT nombre FROM Tipo WHERE modelo = '" & idModelo & "'"

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
            If Lector.HasRows Then
                Cad &= "Tipo: "
                While (Lector.Read()) 'se lee fila por fila hasta que no hayan mas
                    Cad &= Lector.Item(0).ToString() & "<br/>"
                End While
            End If
            Lector.Close()
            Comando.Dispose()
            Conexion.Close()
            Conexion.Dispose()
        Catch ex As Exception
            lblError.Text = "Error: " & ex.Message
        End Try
        verTipo = Cad
    End Function

    Protected Sub btnVolverModelos_Click(ByVal sender As Object, ByVal e As EventArgs) Handles btnVolverModelos.Click
        Dim marca As String
        marca = Session("marca")
        Response.Redirect("Modelos.aspx")
    End Sub
End Class