package DataBase;

import Handlers.Processor;
import Handlers.RamMemory;
import java.util.logging.Level;
import java.util.logging.Logger;

public class MachineRealTime extends Thread {

    private final int id_machine;

    public MachineRealTime(int id_machine) {
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
            thread.sleep(10 * 1000);
            while (true) {
                System.out.println(this.id_machine);
                dataBase.executeQuery("update tb_real_time_machine set processor_usage = " + processor.getPercent() + ""
                        + ", processor_temperature = " + processor.getTemperature() + ""
                        + ", ram_memory_usage = " + ramMemory.getUsage() + ""
                        + ", ram_memory_available = " + ramMemory.getAvailable() + ""
                        + " where id_machine = " + id_machine);
                thread.sleep(3 * 1000);
            }
        } catch (InterruptedException ex) {
            Logger.getLogger(MachineRealTime.class.getName()).log(Level.SEVERE, null, ex);
        }

    }
}
