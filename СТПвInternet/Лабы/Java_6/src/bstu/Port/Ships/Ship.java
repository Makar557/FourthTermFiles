package bstu.Port.Ships;

import bstu.Port.Port;

import static java.lang.Thread.currentThread;
import static java.lang.Thread.sleep;

public class Ship implements Runnable
{

    private metterType metter;
    private int capacity;
    private int currentOccupancy;
    private Port port;

    public metterType getMetter() { return metter; }
    public int getCapacity() { return capacity; }
    public int getCurrentOccupancy() { return currentOccupancy; }

    public Ship(metterType metter, int capacity, int currentOccupancy, Port port)
    {
        this.metter = metter;
        this.capacity = capacity;
        this.currentOccupancy = currentOccupancy;
        this.port = port;
    }

    public int getOneItem()
    {
        if(currentOccupancy>0)
            return --currentOccupancy;
        return 0;
    }

    public boolean addOneItem()
    {
        if(currentOccupancy < capacity)
        {
            currentOccupancy++;
            return true;
        }
        else
            return false;
    }

    @Override
    public void run()
    {
        boolean workIsDone = false;
        Port.Berth berth;
        while(!workIsDone)
        {
            try
            {
                berth = port.getFreeBerth();
                switch (metter)
                {
                    case load:
                        berth.loadShip(this);
                        break;
                    case unload:
                        berth.unloadShip(this);
                        break;
                }
                workIsDone = true;
            }
            catch(IndexOutOfBoundsException ex)
            {
                System.out.println("No free berth for " + currentThread().getName() +". wait...");

                try
                {
                    sleep(500);
                }
                catch (InterruptedException e)
                {
                    System.out.println(currentThread().getName() + " was interrupted.");
                }
            }
        }
    }
}
