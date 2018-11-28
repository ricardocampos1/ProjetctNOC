package DataBase;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Azure {

    private final String connectionSQL = "jdbc:sqlserver://pyxia.database.windows.net:1433;database=Pyxia;user=pyxia@pyxia;password=Admin@admin;encrypt=true;trustServerCertificate=false;hostNameInCertificate=*.database.windows.net;loginTimeout=30;";
    private String commandSQL;

    public int executeQuery(String typeStatement) {
        int resultRow = 0;
        try (Connection conn = DriverManager.getConnection(connectionSQL)) {
            this.commandSQL = typeStatement;
            String detectType = typeStatement.substring(0, 6).toUpperCase();
            if (null == detectType) {
                conn.close();
                System.out.println("Comando SQL não identificado, conexão com o banco fechada.");
            } else {
                switch (detectType) {
                    case "SELECT":
                        resultRow = SelectCommand(conn);
                        break;
                    case "INSERT":
                        resultRow = InsertCommand(conn);
                        break;
                    case "UPDATE":
                        resultRow = UpdateCommand(conn);
                        break;
                    case "DELETE":
                        resultRow = DeleteCommand(conn);
                        break;
                    default:
                        conn.close();
                        System.out.println("Comando SQL não identificado, conexão com o banco fechada.");
                }
            }
            conn.close();
        } catch (SQLException e) {
             System.out.println("Conexão não estabelecida\n" + e.getErrorCode());
        }
        System.out.println("Comando realizado com sucesso");
        return resultRow;
    }

    private int SelectCommand(Connection conn) {
        int select_id = 0;
        try (PreparedStatement preparedStatement = conn.prepareStatement(this.commandSQL);
                ResultSet resultSet = preparedStatement.executeQuery()) {
            while (resultSet.next()) {
                select_id = resultSet.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println(e.getErrorCode());
        }
        return select_id;
    }

    private int InsertCommand(Connection conn) {
        int rowsAffected = 0;
        try (PreparedStatement preparedStatement = conn.prepareStatement(this.commandSQL)) {
            rowsAffected = preparedStatement.executeUpdate();
            System.out.println(rowsAffected + " linha(s) inserida(s)");
        } catch (SQLException e) {
            System.out.println(e.getErrorCode());
        }
        return rowsAffected;
    }

    private int UpdateCommand(Connection conn) {
        int rowsAffected = 0;
        try (PreparedStatement preparedStatement = conn.prepareStatement(this.commandSQL)) {
            rowsAffected = preparedStatement.executeUpdate();
            System.out.println(rowsAffected + " linha(s) alterada(s)");
        } catch (SQLException e) {
            System.out.println(e.getErrorCode());
        }
        return rowsAffected;
    }

    private int DeleteCommand(Connection conn) {
        int rowsAffected = 0;
        try (PreparedStatement preparedStatement = conn.prepareStatement(this.commandSQL)) {
            rowsAffected = preparedStatement.executeUpdate();
            System.out.println(rowsAffected + " linha(s) alterada(s)");
        } catch (SQLException e) {
            System.out.println(e.getErrorCode());
        }
        return rowsAffected;
    }
}
