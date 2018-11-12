package Handlers;

import oshi.SystemInfo;
import oshi.software.os.OperatingSystem;
import oshi.software.os.OperatingSystemVersion;

public class SystemOperation {

    private final SystemInfo si = new SystemInfo();
    private final OperatingSystem os = si.getOperatingSystem();
    private String name;
    private final OperatingSystemVersion osv = os.getVersion();
    private String version;
    private int bitness;

    public String getName() {
        this.name = os.getFamily();
        return this.name;
    }

    public String getVersion() {
        this.version = osv.getVersion();
        return version;
    }

    public int getArch() {
        bitness = os.getBitness();
        return bitness;
    }
}
