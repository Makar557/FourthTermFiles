package ex.Threads;

import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;

public class MyThread extends Thread {

    static public int count = 0;

    Integer temp;

    public MyThread(Integer t) {
        count++;
        countt = count;

        temp=t;
    }

    int countt;

    //-------------
//    public void run()
//    {
//
//        System.out.println(countt +  " thread is starts");
//        try {
//            Thread.sleep(1000);
//        } catch (InterruptedException e) {
//            e.printStackTrace();
//        }
//        System.out.println(count +  "thread was finished");
//    }

    //-----------------
    public void run()
    {
        synchronized (temp)
        {
            temp.i++;
            try {
                Thread.sleep(100);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
            System.out.println("Thread " + countt + "  " + temp.i);
        }
        Lock lock =new ReentrantLock();
        lock.lock();
        // код для синхронзации
        lock.unlock();
        //даёт гибкость коду
    }
    //-------------
}
