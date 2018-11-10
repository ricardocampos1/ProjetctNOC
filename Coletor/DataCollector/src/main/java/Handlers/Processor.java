package Handlers;

import Interfaces.Hardware;
import java.text.DecimalFormat;

public class Processor implements Hardware {

    private String name;
    private double temperature;
    private int physicalCore;
    private int logicalCore;
    private double percent;

    public String setName() {
        this.name = hal.getProcessor().getName();
        return this.name;
    }

    public double setTemperature() {
        DecimalFormat df = new DecimalFormat("#.00");
        this.temperature = Double.parseDouble(df.format((hal.getSensors().getCpuTemperature() - 32) * 5 / 9).replace(",", "."));
        return this.temperature;
    }

    public int setPhysicalCore() {
        this.physicalCore = hal.getProcessor().getPhysicalProcessorCount();
        return this.physicalCore;
    }

    public int setLogicalCore() {
        this.physicalCore = hal.getProcessor().getLogicalProcessorCount();
        return this.logicalCore;
    }

    public double getPercent() {
        DecimalFormat df = new DecimalFormat("#.00");
        this.percent = Double.parseDouble(df.format(hal.getProcessor().getSystemCpuLoad() * 100).replace(",", "."));
        return this.percent;
    }
}
