package DataBase;

import Handlers.HardDisk;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class MachineHD extends Thread {

    int id_machine = Machine.ID_MACHINE;

    public MachineHD() {
        start();
    }

    @Override
    public void run() {

        try {
            Azure dataBase = new Azure();
            HardDisk hd = new HardDisk();
            String stringConnection = "jdbc:sqlserver://pyxia.database.windows.net:1433;database=Pyxia;user=pyxia@pyxia;password=Admin@admin;encrypt=true;trustServerCertificate=false;hostNameInCertificate=*.database.windows.net;loginTimeout=30;";
            String commandSQL = "select id_machine from tb_hard_disk where id_machine = " + this.id_machine;
            Thread thread = new Thread();
            thread.sleep(10 * 1000);
            while (true) {
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
                                        + "('" + infoHD[0] + "', " + Long.parseLong(infoHD[1]) + ", " + Long.parseLong(infoHD[2]) + ", " + Long.parseLong(infoHD[3]) + ", " + this.id_machine + ")");
                            });
                        } else {
                            hd.getHardDisks().stream().map((listHD) -> {
                                String[] infoHD;
                                infoHD = listHD.split(";");
                                return infoHD;
                            }).forEachOrdered((infoHD) -> {
                                dataBase.executeQuery("update tb_hard_disk set total_free_space_hd = " + Long.parseLong(infoHD[2]) + ", total_usable_space_hd = " + Long.parseLong(infoHD[3]) + " "
                                        + "where absolut_path = '" + infoHD[0] + "' and id_machine = " + this.id_machine);
                            });
                        }
                    } catch (SQLException e) {
                        System.out.println(e.getErrorCode());
                    }
                } catch (SQLException e) {
                    System.out.println(e.getErrorCode());
                }
                thread.sleep(3 * 1000);
            }
        } catch (InterruptedException ex) {
            Logger.getLogger(MachineHD.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
