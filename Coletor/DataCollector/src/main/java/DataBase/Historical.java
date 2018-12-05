package DataBase;

import Handlers.Processor;
import Handlers.RamMemory;
import java.time.ZonedDateTime;
import java.time.format.DateTimeFormatter;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Historical extends Thread {

    private final int id_machine;

    public Historical(int id_machine) {
        this.id_machine = id_machine;
        start();
    }

    @Override
    public void run() {
        Azure dataBase = new Azure();
        Processor processor = new Processor();
        RamMemory ramMemory = new RamMemory();

        Thread thread = new Thread();
        try {
            while (true) {
                ZonedDateTime dateTime = ZonedDateTime.now();
                System.out.println(this.id_machine);
                dataBase.executeQuery("insert into tb_historical "
                        + "(processor_usage, processor_temperature, ram_memory_usage"
                        + ", ram_memory_available, current_dt, id_machine) "
                        + "values (" + processor.getPercent() + ", " + processor.getTemperature() + ""
                        + ", " + ramMemory.getUsage() + ", " + ramMemory.getAvailable() + ""
                        + ", '" + dateTime.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss")) + "', " + id_machine + ")");
                thread.sleep(180 * 1000);
            }
        } catch (InterruptedException ex) {
            Logger.getLogger(MachineRealTime.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
