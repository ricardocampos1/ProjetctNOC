package DataBase;

import Handlers.HardDisk;

public class MachineHD extends Thread {

    private final int id_machine;

    public MachineHD(int id_machine) {
        this.id_machine = id_machine;
        start();
    }

    @Override
    public void run() {

        Azure dataBase = new Azure();
        HardDisk hd = new HardDisk();
        String commandSQL = "select id_machine from tb_hard_disk where id_machine = " + this.id_machine;
        while (true) {
            if (dataBase.executeQuery(commandSQL) == 0) {
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
        }
    }
}