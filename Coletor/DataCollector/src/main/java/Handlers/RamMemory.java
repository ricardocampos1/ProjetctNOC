package Handlers;

import Interfaces.Hardware;

public class RamMemory implements Hardware {

    private long total;
    private long available;
    private long usage;

    public long setTotal() {
        this.total = hal.getMemory().getTotal();
        return this.total;
    }

    public long setAvailable() {
        this.available = hal.getMemory().getAvailable();
        return this.available;
    }

    public long setUsage() {
        this.usage = hal.getMemory().getTotal() - hal.getMemory().getAvailable();
        return this.usage;
    }
}
