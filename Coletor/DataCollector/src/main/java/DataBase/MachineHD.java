package DataBase;

import Handlers.HardDisk;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class MachineHD {

    public void sendHardDisk() {
        Azure dataBase = new Azure();

        HardDisk hd = new HardDisk();

        int id_machine = 1;

        String stringConnection = "jdbc:sqlserver://pyxia.database.windows.net:1433;database=Pyxia;user=pyxia@pyxia;password=Admin@admin;encrypt=true;trustServerCertificate=false;hostNameInCertificate=*.database.windows.net;loginTimeout=30;";
        String commandSQL = "select * from tb_hard_disk where id_machine = " + id_machine;
        try {
            Connection conn = DriverManager.getConnection(stringConnection);
            try (PreparedStatement preparedStatement = conn.prepareStatement(commandSQL);
                    ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next() == false) {
                    hd.getHardDisks().stream().map((listHD) -> {
                        String[] infoHD;
                        infoHD = listHD.split(";");
                        return infoHD;
                    }).forEachOrdered((infoHD) -> {
                        dataBase.executeQuery("insert into tb_hard_disk (absolut_path, total_space_hd, total_free_space_hd, total_usable_space_hd, id_machine) values "
                                + "('" + infoHD[0] + "', " + Long.parseLong(infoHD[1]) + ", " + Long.parseLong(infoHD[2]) + ", " + Long.parseLong(infoHD[3]) + ", " + id_machine + ")");
                    });
                } else {
                    hd.getHardDisks().stream().map((listHD) -> {
                        String[] infoHD;
                        infoHD = listHD.split(";");
                        return infoHD;
                    }).forEachOrdered((infoHD) -> {
                        dataBase.executeQuery("update tb_hard_disk set total_free_space_hd = " + Long.parseLong(infoHD[2]) + ", total_usable_space_hd = " + Long.parseLong(infoHD[3]) + " "
                                + "where absolut_path = '" + infoHD[0] + "'");
                    });
                }
            } catch (SQLException e) {
                System.out.println(e.getErrorCode());
            }
        } catch (SQLException e) {
            System.out.println(e.getErrorCode());
        }
    }
}
