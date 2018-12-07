package DataBase;

import Handlers.Logger;
import Handlers.Processor;
import Handlers.RamMemory;
import Handlers.SystemOperation;
import Screens.Login;
import static Screens.Login.ID_USER;
import SlackIntegration.Message;
import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;

public class Machine {

    private int id_machine;
    Message mensagem = new Message();

    public int getId_machine() {
        return id_machine;
    }

    public void insertMachine() throws SQLException {
        Azure dataBase = new Azure();
        SystemOperation so = new SystemOperation();
        Processor processor = new Processor();
        RamMemory ramMemory = new RamMemory();

        int id_user = Login.ID_USER;
        String name_machine = so.getHostName();
        String commandSQL = "select id_machine from tb_machine where id_user = " + id_user + " "
                + "and name_machine = '" + name_machine + "'";
        try {
            this.id_machine = dataBase.executeQuery(commandSQL);
            System.out.println(this.id_machine);
            if (this.id_machine == 0) {
                dataBase.executeQuery("insert into tb_machine (name_machine, name_operation_system\n"
                        + ", architecture_operation_system, name_processor\n"
                        + ", physical_core, logical_core, ram_memory_total, id_user) values\n"
                        + "('" + name_machine + "', '" + so.getName() + " " + so.getVersion() + "',"
                        + " " + so.getArch() + ", '" + processor.getName() + "', " + processor.getPhysicalCore() + ","
                        + " " + processor.getLogicalCore() + ", " + ramMemory.getTotal() + ", " + id_user + ")");

                commandSQL = "select id_machine from tb_machine where id_user = " + id_user + " and name_machine = '" + name_machine + "'";
                this.id_machine = dataBase.executeQuery(commandSQL);
                System.out.println(this.id_machine);
                
                // usuário tal cadasgtrou a maquina 
                Logger logger=new Logger();
                logger.LogTxt("O usuário"+ID_USER+"cadastrou a maquina"+id_machine);

                dataBase.executeQuery("insert into tb_real_time_machine (processor_usage, processor_temperature"
                        + ", ram_memory_usage, ram_memory_available, id_machine) values "
                        + "(" + processor.getPercent() + ", " + processor.getTemperature() + ""
                        + ", " + ramMemory.getUsage() + ", " + ramMemory.getAvailable() + ", " + id_machine + ")");
                
            }
        } catch (Exception e) {
            System.out.println("Erro!!!");
            // Erro de conexão ao inserir a maquina
            mensagem.sendMessage(Machine.class.getName() + " | usuário " + ID_USER + "| erro na conexão ao inserir maquina");
            Logger logger= new Logger();
            try {
                logger.LogTxt("Erro de conexão ao tentar inserir a maquina do usuário"+ID_USER);
            } catch (IOException ex) {
                java.util.logging.Logger.getLogger(Machine.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }
}
