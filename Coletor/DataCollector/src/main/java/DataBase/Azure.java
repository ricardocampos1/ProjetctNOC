package DataBase;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Azure {

    private final String connectionSQL = "jdbc:sqlserver://pyxia.database.windows.net:1433;database=Pyxia;user=pyxia@pyxia;password=Admin@admin;encrypt=true;trustServerCertificate=false;hostNameInCertificate=*.database.windows.net;loginTimeout=30;";
    private String commandSQL;

    public String executeQuery(String typeStatement) {
        try (Connection conn = DriverManager.getConnection(connectionSQL)) {
            this.commandSQL = typeStatement;
            String detectType = typeStatement.substring(0, 6).toUpperCase();
            if (null == detectType) {
                conn.close();
                return "Comando SQL não identificado, conexão com o banco fechada.";
            } else {
                switch (detectType) {
                    case "SELECT":
                        SelectCommand(conn);
                        break;
                    case "INSERT":
                        InsertCommand(conn);
                        break;
                    case "UPDATE":
                        UpdateCommand(conn);
                        break;
                    case "DELETE":
                        DeleteCommand(conn);
                        break;
                    default:
                        conn.close();
                        return "Comando SQL não identificado, conexão com o banco fechada.";
                }
            }
            conn.close();
        } catch (SQLException e) {
            return "Conexão não estabelecida\n" + e.getErrorCode();
        }
        return "Comando realizado com sucesso";
    }

    private void SelectCommand(Connection conn) {
        try (PreparedStatement preparedStatement = conn.prepareStatement(this.commandSQL);
                ResultSet resultSet = preparedStatement.executeQuery()) {
            while (resultSet.next()) {
                System.out.println(resultSet.getInt(1));
            }
        } catch (SQLException e) {
            System.out.println(e.getErrorCode());
        }
    }

    private void InsertCommand(Connection conn) {
        try (PreparedStatement preparedStatement = conn.prepareStatement(this.commandSQL)) {
            int rowsAffected = preparedStatement.executeUpdate();
            System.out.println(rowsAffected + " linha(s) inserida(s)");
        } catch (SQLException e) {
            System.out.println(e.getErrorCode());
        }
    }

    private void UpdateCommand(Connection conn) {
        try (PreparedStatement preparedStatement = conn.prepareStatement(this.commandSQL)) {
            int rowsAffected = preparedStatement.executeUpdate();
            System.out.println(rowsAffected + " linha(s) alterada(s)");
        } catch (SQLException e) {
            System.out.println(e.getErrorCode());
        }
    }

    private void DeleteCommand(Connection conn) {
        try (PreparedStatement preparedStatement = conn.prepareStatement(this.commandSQL)) {
            int rowsAffected = preparedStatement.executeUpdate();
            System.out.println(rowsAffected + " linha(s) deletada(s)");
        } catch (SQLException e) {
            System.out.println(e.getErrorCode());
        }
    }
}
