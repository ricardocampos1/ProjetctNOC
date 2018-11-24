package Interfaces;

import oshi.SystemInfo;
import oshi.hardware.HardwareAbstractionLayer;

public interface Hardware {

    SystemInfo si = new SystemInfo();

    /**
     * Pega as informações de Hardware do computador
     */
    HardwareAbstractionLayer hal = si.getHardware();
}
