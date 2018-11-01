package Handlers;

import Interfaces.Hardware;
import java.util.ArrayList;
import java.util.List;
import oshi.hardware.HWDiskStore;
import java.io.*;
import oshi.SystemInfo;
import oshi.software.os.OSFileStore;
import oshi.util.FormatUtil;

public class HardDisk implements Hardware {

    private List<String> hds = new ArrayList<>();
    OSFileStore[] hardDisks = new SystemInfo().getOperatingSystem().getFileSystem().getFileStores();
    private String disco;
    private String letraLocal[];
    private Long usingSpace[];
    private Long freeSpace[];
    private Long totalSpace[];

    public String setModelSize() {
        HWDiskStore[] disks = hal.getDiskStores();
        for (HWDiskStore disk : disks) {
            hds.add("Marca: " + disk.getModel() + "\n Tamanho: " + FormatUtil.formatBytes(disk.getSize()));
        }
        return hds.toString();
    }

    public String[] setLocalLetter() {

        letraLocal = new String[hardDisks.length];

        for (int i = 0; i < letraLocal.length; i++) {
            letraLocal[i] = hardDisks[i].getMount();
        }
        return letraLocal;
    }

    public Long[] setFreeSpace() {
        freeSpace = new Long[hardDisks.length];
        for (int count = 0; count < this.hardDisks.length; count++) {
        disco = letraLocal[count];
            File file = new File(disco);
            freeSpace[count] = file.getFreeSpace(); //== 0 ? 0 : file.getFreeSpace() / (1024.0 * 1024.0 * 1024.0);
            
        }
        return freeSpace;
    }

    public Long[] setTotalSpace() {
        totalSpace = new Long[hardDisks.length];
        for (int count = 0; count < this.letraLocal.length; count++) {
        disco = letraLocal[count];
            File file = new File (disco);
            totalSpace[count] = file.getTotalSpace();
            //Double.parseDouble(FormatUtil.formatBytes(hardDisks[count].getTotalSpace()).split(" ")[0].replace(",", "."));
        }
        return totalSpace;
    }
        
    public Long [] setUsingSpace (){
        usingSpace = new Long [hardDisks.length];
        for (int count = 0; count < this.letraLocal.length; count++){
            usingSpace[count] = totalSpace[count] - freeSpace[count];
        }
        return usingSpace;
    }
}
