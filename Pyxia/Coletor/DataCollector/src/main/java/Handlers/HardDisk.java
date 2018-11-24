package Handlers;

import Interfaces.Hardware;
import java.util.ArrayList;
import java.util.List;
import oshi.hardware.HWDiskStore;
import oshi.util.FormatUtil;

public class HardDisk implements Hardware {

    private List<String> hds = new ArrayList<>();

    public String setModelSize() {
        HWDiskStore[] disks = hal.getDiskStores();
        for (HWDiskStore disk : disks) {
            hds.add("Marca: " + disk.getModel() + "\n Tamanho: " + FormatUtil.formatBytes(disk.getSize()));
        }
        return hds.toString();
    }

}
