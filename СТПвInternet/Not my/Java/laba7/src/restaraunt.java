import java.util.concurrent.Semaphore;

public class restaraunt implements  Runnable {
     int res = 0;
    Semaphore sem;
    String name;
    restaraunt( Semaphore sem, String name){
        this.sem=sem;
        this.name=name;
    }

    public void run(){
        try{
            sem.acquire();
            for (int i = 0; i < 4; i++){
                if (res == 0)
                {
                    System.out.println(this.name + " сел за столик");
                }
                else System.out.println(this.name + ": съел " + res + " блюдо");
                res++;
                Thread.sleep(700);
            }
        }
        catch(InterruptedException e){System.out.println(e.getMessage());}
        System.out.println(name + " освобождает столик");
        sem.release();
    }
}
