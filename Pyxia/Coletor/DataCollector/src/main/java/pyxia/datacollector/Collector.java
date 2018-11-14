package pyxia.datacollector;

import Handlers.HardDisk;
import Handlers.Processor;
import Handlers.RamMemory;
import java.text.DecimalFormat;
import oshi.util.FormatUtil;

public class Collector {

    public static void main(String[] args) {
        DecimalFormat df = new DecimalFormat("#.00");
        System.out.println("Informações da sua Maquina");
        System.out.println("|----------------------------------------|");

        Processor cpu = new Processor();
        System.out.println("----------------Processor-----------------");
        System.out.println("Nome: " + cpu.setName());
        System.out.println("Temperatura: " + df.format(cpu.setTemperature()) + "Cº");
        System.out.println("Núcleos Físico: " + cpu.setPhysicalCore());
        System.out.println("Núcleos Lógicos: " + cpu.setLogicalCore());
        System.out.println("------------------------------------------");

        System.out.println("\n");

        RamMemory ram = new RamMemory();
        System.out.println("--------------Memoria Ram-----------------");
        System.out.println("Total: " + FormatUtil.formatBytes(ram.setTotal()));
        System.out.println("Disponivel: " + FormatUtil.formatBytes(ram.setAvailable()));
        System.out.println("Em uso: " + FormatUtil.formatBytes(ram.setTotal()));
        System.out.println("------------------------------------------");

        System.out.println("\n");

        HardDisk hd = new HardDisk();
        System.out.println("--------------Disco Rígido----------------");
        System.out.println("Lista de discos");
        System.out.println(hd.setModelSize());
        System.out.println("------------------------------------------");

        System.out.println("|----------------------------------------|");
    }
}
