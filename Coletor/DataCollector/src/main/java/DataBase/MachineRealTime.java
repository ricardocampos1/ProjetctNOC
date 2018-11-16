package DataBase;

import Handlers.Processor;
import Handlers.RamMemory;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class MachineRealTime extends Thread {

    int id_machine = 1;

    public MachineRealTime() {
        start();
    }

    @Override
    public void run() {
        try {
            Thread thread = new Thread();
            Azure dataBase = new Azure();
            String stringConnection = "jdbc:sqlserver://pyxia.database.windows.net:1433;database=Pyxia;user=pyxia@pyxia;password=Admin@admin;encrypt=true;trustServerCertificate=false;hostNameInCertificate=*.database.windows.net;loginTimeout=30;";
            String commandSQL = "select * from tb_real_time_machine where id_machine = " + this.id_machine;
            Processor processor = new Processor();
            RamMemory ramMemory = new RamMemory();
            thread.sleep(10 * 1000);
            while (true) {
                try {
                    Connection conn = DriverManager.getConnection(stringConnection);
                    try (PreparedStatement preparedStatement = conn.prepareStatement(commandSQL);
                            ResultSet resultSet = preparedStatement.executeQuery()) {
                        if (resultSet.next() == false) {
                            dataBase.executeQuery("insert into tb_real_time_machine (processor_usage, processor_temperature"
                                    + ", ram_memory_usage, ram_memory_available, id_machine) values "
                                    + "(" + processor.getPercent() + ", " + processor.getTemperature() + ""
                                    + ", " + ramMemory.getUsage() + ", " + ramMemory.getAvailable() + ", " + this.id_machine + ")");
                        } else {
                            dataBase.executeQuery("update tb_real_time_machine set processor_usage = " + processor.getPercent() + ""
                                    + ", processor_temperature = " + processor.getTemperature() + ""
                                    + ", ram_memory_usage = " + ramMemory.getUsage() + ""
                                    + ", ram_memory_available = " + ramMemory.getAvailable() + ""
                                    + ", id_machine = " + this.id_machine);
                        }
                    }
                } catch (SQLException ex) {
                    Logger.getLogger(MachineRealTime.class.getName()).log(Level.SEVERE, null, ex);
                }
                thread.sleep(3 * 1000);
            }
        } catch (InterruptedException ex) {
            Logger.getLogger(MachineRealTime.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
