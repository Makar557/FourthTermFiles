package ex.Threads;

import java.util.concurrent.Semaphore;

public class MySemaphore implements Runnable{

    Integer res;
    Semaphore sem;
    String name;
    MySemaphore(Integer res, Semaphore sem, String name){
        this.res=res;
        this.sem=sem;
        this.name=name;
    }

    public void run(){

        try{
            System.out.println(name + " ожидает разрешение");
            sem.acquire();
            res.i=1;
            for (int i = 1; i < 5; i++){
                System.out.println(this.name + ": " + res.i);
                res.i++;
                Thread.sleep(100);
            }
        }
        catch(InterruptedException e){System.out.println(e.getMessage());}
        System.out.println(name + " освобождает разрешение");
        sem.release();
    }
}
