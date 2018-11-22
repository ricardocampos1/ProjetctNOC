package DataBase;

import Handlers.Processor;
import Handlers.RamMemory;
import Handlers.SystemOperation;
import Screens.Login;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Machine {

    public static int ID_MACHINE = Login.ID_USER;

    public void insertMachine() throws SQLException {
        Azure dataBase = new Azure();
        SystemOperation so = new SystemOperation();
        Processor processor = new Processor();
        RamMemory ramMemory = new RamMemory();

        String name_machine = so.getHostName();
        int id_user = Login.ID_USER;

        String stringConnection = "jdbc:sqlserver://pyxia.database.windows.net:1433;database=Pyxia;user=pyxia@pyxia;password=Admin@admin;encrypt=true;trustServerCertificate=false;hostNameInCertificate=*.database.windows.net;loginTimeout=30;";
        String commandSQL = "select * from tb_machine where id_user = " + id_user;
        try {
            Connection conn = DriverManager.getConnection(stringConnection);
            try (PreparedStatement preparedStatement = conn.prepareStatement(commandSQL);
                    ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next() == false) {
                    dataBase.executeQuery("insert into tb_machine (name_machine, hostname, name_operation_system\n"
                            + ", architecture_operation_system, name_processor\n"
                            + ", physical_core, logical_core, ram_memory_total, id_user) output inserted.id_machine values\n"
                            + "('" + name_machine + "', '" + so.getName() + " " + so.getVersion() + "',"
                            + " " + so.getArch() + ", '" + processor.getName() + "', " + processor.getPhysicalCore() + ","
                            + " " + processor.getLogicalCore() + ", " + ramMemory.getTotal() + ", " + id_user + ")");
                }
            } catch (SQLException e) {
                System.out.println(e.getErrorCode());
            }
        } catch (SQLException e) {
            System.out.println(e.getErrorCode());
        }
    }
}
