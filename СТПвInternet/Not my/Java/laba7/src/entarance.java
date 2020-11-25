import java.io.FileWriter;
import java.io.IOException;
import java.util.Scanner;

import static java.lang.Thread.sleep;

public class entarance implements  Runnable {
    public void run()        //Этот метод будет выполняться в побочном потоке
    {
        for (int i = 0; i < 10; i++) {
            try (FileWriter writer = new FileWriter("file.txt", true)) {
                writer.write("Студент вошел в универ"+'\n');
                try {
                    sleep(1000);
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }
}
