package Handlers;

import Interfaces.Hardware;

public class RamMemory implements Hardware {

    private long total;
    private long available;
    private long usage;

    public long getTotal() {
        this.total = hal.getMemory().getTotal();
        return this.total;
    }

    public long getAvailable() {
        this.available = hal.getMemory().getAvailable();
        return this.available;
    }

    public long getUsage() {
        this.usage = hal.getMemory().getTotal() - hal.getMemory().getAvailable();
        return this.usage;
    }
}
