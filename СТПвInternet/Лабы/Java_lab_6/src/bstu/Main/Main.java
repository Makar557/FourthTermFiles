package bstu.Main;

import bstu.MacDonalds.Consumer;
import bstu.MacDonalds.Manager;
import bstu.MacDonalds.Office;
import bstu.Port.Port;
import bstu.Port.ships.Ship;
import bstu.Port.ships.metterType;

import java.util.ArrayList;


public class Main
{

    public static void main(String[] args)
    {
        /*Port port = new Port(100, 30, 5);

        Thread ship1 = new Thread(new Ship(metterType.load,      20, 0, port),  "ship1");     ship1.start();
        Thread ship2 = new Thread(new Ship(metterType.unload,    30, 10, port), "ship2");    ship2.start();
        Thread ship3 = new Thread(new Ship(metterType.load,      40, 0, port),  "ship3");     ship3.start();
        Thread ship4 = new Thread(new Ship(metterType.unload,    50, 50, port), "ship4");    ship4.start();
        Thread ship5 = new Thread(new Ship(metterType.load,      20, 15, port), "ship5");    ship5.start();
        Thread ship6 = new Thread(new Ship(metterType.unload,    30, 30, port), "ship6");    ship6.start();
        Thread ship7 = new Thread(new Ship(metterType.unload,    70, 60, port), "ship7");    ship7.start();
        Thread ship8 = new Thread(new Ship(metterType.load,      10, 0, port),  "ship8");     ship8.start();*/

        ArrayList<Office> offices = new ArrayList<>();
        for (int i = 1; i <= 4; ++i)
            offices.add(new Office(100, "office" + i));

        ArrayList<Consumer> consumers = new ArrayList<>();
        ArrayList<Thread> consumersThreads = new ArrayList<>();
        for (int i = 0, startOffice = 0; i < 20; ++i)
        {
            consumers.add(new Consumer((int) (Math.random() * 2000 + 1000), offices.get(startOffice)));
            consumersThreads.add(new Thread(consumers.get(i)));
            offices.get(startOffice).addConsumer(consumers.get(i));

            consumersThreads.get(i).start();
        }

        Thread manager = new Thread(new Manager(offices));
        manager.start();
    }
}
