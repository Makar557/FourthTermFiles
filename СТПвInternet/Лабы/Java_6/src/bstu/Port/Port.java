package bstu.Port;

import bstu.Port.Ships.*;

import java.util.Objects;
import java.util.concurrent.CopyOnWriteArrayList;

import static java.lang.Thread.currentThread;
import static java.lang.Thread.sleep;

public class Port
{
    private int copacity;
    private int currentOccupancy;

    CopyOnWriteArrayList<Berth> berths;

    public Port(int copacity, int currentOccupancy, int berthsCount)
    {
        this.copacity = copacity;
        this.currentOccupancy = currentOccupancy;

        this.berths = new CopyOnWriteArrayList<Berth>();
        for (int i = 0; i < berthsCount; i++)
            this.berths.add(new Berth());

    }

    public Berth getFreeBerth() throws IndexOutOfBoundsException
    {
        return berths.get(berths.indexOf(new Berth()));
    }

    public class Berth
    {
        public boolean isFree;

        public Berth()
        {
            this.isFree = true;
        }

        @Override
        public boolean equals(Object o)
        {
            if (this == o) return true;
            if (o == null || getClass() != o.getClass()) return false;
            Berth berth = (Berth) o;
            return isFree == berth.isFree;
        }

        @Override
        public int hashCode()
        {
            return Objects.hash(isFree);
        }

        synchronized public void unloadShip(Ship ship)
        {
            this.isFree = false;
            System.out.println(currentThread().getName()  + " unloading has been started;");
            while(ship.getCurrentOccupancy() > 0 && currentOccupancy < copacity)
            {
                try
                {
                    sleep(100);
                    currentOccupancy++; ship.getOneItem();
                    System.out.println("To warehouse was added item from " + currentThread().getName() + ". Current occupancy: " + currentOccupancy);
                }
                catch (InterruptedException e)
                {
                    System.out.println(currentThread().getName() + " unloading was interrupted");
                }
            }
            this.isFree = true;
            System.out.println(currentThread().getName() + " unloading has been ended;");
        }

        synchronized public void loadShip(Ship ship)
        {
            this.isFree = false;
            System.out.println(currentThread().getName() + " loading has been started;");
            while(ship.getCurrentOccupancy() < ship.getCapacity() && currentOccupancy > 0)
            {
                try
                {
                    sleep(100);
                    currentOccupancy--; ship.addOneItem();
                    System.out.println("To ship " + currentThread().getName() + " was added item. Current occupancy: " + currentOccupancy);
                }
                catch (InterruptedException e)
                {
                    System.out.println(currentThread().getName() + " loading was interrupted");
                }
            }
            this.isFree = true;
            System.out.println(currentThread().getName() + " loading has been ended;");
        }
    }
}

