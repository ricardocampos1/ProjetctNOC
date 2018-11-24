package Handlers;

import Interfaces.Hardware;
import oshi.software.os.OperatingSystem;
import oshi.software.os.OperatingSystemVersion;

public class SystemOperation implements Hardware{

    private final OperatingSystem os = si.getOperatingSystem();
    private String name;
    private final OperatingSystemVersion osv = os.getVersion();
    private String version;
    private int bitness;
    private String hostName;
    
    public String getName() {
        this.name = os.getFamily();
        return this.name;
    }

    public String getVersion() {
        this.version = osv.getVersion();
        return this.version;
    }

    public int getArch() {
        this.bitness = os.getBitness();
        return this.bitness;
    }
    
    public String getHostName() {
        this.hostName = os.getNetworkParams().getHostName();
        return this.hostName;
    }
}
