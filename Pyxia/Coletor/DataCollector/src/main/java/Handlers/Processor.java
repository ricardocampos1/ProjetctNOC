package Handlers;

import Interfaces.Hardware;

public class Processor implements Hardware {

    private String name;
    private double temperature;
    private int physicalCore;
    private int logicalCore;
    private long frequency;

    public String setName() {
        this.name = hal.getProcessor().getName();
        return this.name;
    }

    public double setTemperature() {
        this.temperature = (hal.getSensors().getCpuTemperature() - 32) * 5 / 9;
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

    public long setFrequency() {
        this.frequency = hal.getProcessor().getVendorFreq();
        return this.frequency;
    }
}
