package Handlers;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

public class HardDisk {

    private final List<String> hds = new ArrayList<>();

    public List<String> getHardDisks() {
        File[] files = File.listRoots();
        for (File file : files) {
            //adicionando informações do hd no formato
            //letra do hd;espaço total;espaço livre;espaço usado
            hds.add(file.getAbsoluteFile() + ";" + file.getTotalSpace() + ";" + file.getFreeSpace() + ";" + (file.getTotalSpace() - file.getUsableSpace()));
        }
        return hds;
    }

}
