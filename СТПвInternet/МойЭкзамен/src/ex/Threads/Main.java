package ex.Threads;

import java.util.concurrent.Semaphore;

public class Main {

    public static void main(String[] args) {

        Integer integ =new Integer();

//        new MyThread(integ).start();
//        new MyThread(integ).start();
//        new MyThread(integ).start();

        //-----------

//        for(int z=0; z<5; z++)
//        {
//            new MyThread(integ).start();
//        }

        //------------

//        Semaphore sem = new Semaphore(1); // 1 разрешение
//        Integer res = new Integer();
//        new Thread(new MySemaphore(res, sem, "CountThread 1")).start();
//        new Thread(new MySemaphore(res, sem, "CountThread 2")).start();
//        new Thread(new MySemaphore(res, sem, "CountThread 3")).start();

        //------------

        Semaphore table =new Semaphore(2);

        Person p1=new Person();
        Person p2=new Person();
        Person p3=new Person();
        Person p4=new Person();
        Person p5=new Person();

        p1.table=table;
        p2.table=table;
        p3.table=table;
        p4.table=table;
        p5.table=table;

        p1.start();
        p2.start();
        p3.start();
        p4.start();
        p5.start();
    }
}

class Person extends Thread
{
    Semaphore table;
    @Override
    public void run()
    {
        System.out.println(this.getName() + " ждёт стол");
        try {
            table.acquire();
            System.out.println(this.getName() + " получил стол");
            Thread.sleep(500);
            System.out.println(this.getName() + " закончил и освобождает стол");
            table.release();
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }
}
