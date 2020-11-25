package bstu.MacDonalds;

import java.util.ArrayList;
import java.util.Queue;
import java.util.concurrent.locks.ReentrantLock;

import static java.lang.Thread.sleep;

public class Office implements Comparable<Office>
{
    private ArrayList<Consumer> queue;
    public int maxCountOfConsumers;
    private ReentrantLock locker;
    private String officeName;

    public Office(int maxCountOfConsumers, String officeName)
    {
        this.maxCountOfConsumers = maxCountOfConsumers;
        this.locker = new ReentrantLock();
        this.officeName = officeName;
        queue = new ArrayList<>();
    }

    public void service()
    {
        locker.lock();

        if(queue.size() != 0)
        {
            try
            {
                sleep(queue.get(0).serviceTime);
                queue.remove(0);
            }
            catch (InterruptedException e)
            {
               System.out.println("Shit happened");
            }
        }

        locker.unlock();
    }

    public void addConsumer(Consumer consumer)
    {
        if(getCurrentCountOfConsumers() < maxCountOfConsumers)
        {
            queue.add(consumer);
        }
    }

    public Consumer popConsumerFromEnd()
    {
        return queue.remove(queue.size()-1);
    }

    public int getCurrentCountOfConsumers()
    {
        return queue.size();
    }

    @Override
    public String toString()
    {
        String queueString = "";

        for (Consumer consumer : queue)
        {
            queueString = queueString + " (" + consumer.serviceTime + ") ";
        }


        return officeName + " : " + queueString;
    }

    @Override
    public int compareTo(Office o)
    {
        if(queue.size() > o.queue.size())
            return -1;

        if(queue.size() < o.queue.size())
            return 1;

        return 0;
    }
}
