package bstu.MacDonalds;

import org.w3c.dom.ls.LSOutput;

import java.util.ArrayList;

import static java.lang.Thread.sleep;

public class Manager implements Runnable
{
    public ArrayList<Office> offices;

    public Manager(ArrayList<Office> offices)
    {
        this.offices = offices;
    }

    @Override
    public void run()
    {
        while(true)
        {
            do
            {
                offices.sort(Office::compareTo);

                System.out.println("\n--------------");
                for (Office office: offices)
                    System.out.println(office.toString());
                System.out.println("--------------\n");

                offices.get(offices.size()-1).addConsumer(offices.get(0).popConsumerFromEnd());

                try
                {
                    sleep(100);
                }
                catch (InterruptedException e)
                {
                    System.out.println("Shit happend");
                }

                if(offices.get(0).getCurrentCountOfConsumers() - 1  != offices.get(offices.size()-1).getCurrentCountOfConsumers())
                    break;

            } while(offices.get(0).getCurrentCountOfConsumers() != offices.get(offices.size()-1).getCurrentCountOfConsumers());


            try
            {
                sleep(500);
            }
            catch (InterruptedException e)
            {
                System.out.println("Shit happend");
            }

        }
    }
}

