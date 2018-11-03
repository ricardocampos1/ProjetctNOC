package Infra;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Azure {

    private final String connectionString = "jdbc:sqlserver://pyxia.database.windows.net:1433;database=Pyxia;user=pyxia@pyxia;password=Admin@admin;encrypt=true;trustServerCertificate=false;hostNameInCertificate=*.database.windows.net;loginTimeout=30;";
    private Connection connection;

    public Connection getConnection() {
        return connection;
    }
    
    public Connection openConnection() throws SQLException {
        try (Connection conn = DriverManager.getConnection(connectionString)) {
            connection = conn;
            System.out.println("Conexão estabelecida");
            return conn;
        }
    }
    
    public void closeConnetion(Connection conn) throws SQLException{
        if (conn.isClosed()) {
            conn.close();
            System.out.println("Conexão finalizada");
        }
    }

//    private void SelectCommand(Connection conn) {
//        try (Statement statement = conn.createStatement();
//                ResultSet resultSet = statement.executeQuery(this.commandSQL)) {
//            while (resultSet.next()) {
//                System.out.println(resultSet.getInt(1));
//            }
//        } catch (SQLException e) {
//            System.out.println(e.getErrorCode());
//        }
//    }
//
//    private void InsertCommand(Connection conn) {
//        try (Statement statement = conn.createStatement()) {
//            int rowsAffected = statement.executeUpdate(this.commandSQL);
//            System.out.println(rowsAffected + " linha(s) inseridas");
//        } catch (SQLException e) {
//            System.out.println(e.getErrorCode());
//        }
//    }
}
