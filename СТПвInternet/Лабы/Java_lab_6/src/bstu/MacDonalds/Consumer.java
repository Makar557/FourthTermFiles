package bstu.MacDonalds;

public class Consumer implements Runnable
{
    public int serviceTime;
    public Office currentOffice;

    public Consumer(int serviceTime, Office currentOffice)
    {
        this.serviceTime = serviceTime;
        this.currentOffice = currentOffice;
    }

    @Override
    public void run()
    {
        currentOffice.service();
    }
}
