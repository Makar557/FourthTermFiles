import java.io.FileWriter;
import java.io.IOException;

import static java.lang.Thread.sleep;

public class newthread implements  Runnable{
    public void run()
    {
        for (int i = 0; i < 10; i++) {
            try (FileWriter writer = new FileWriter("file.txt", true)) {
                writer.write("Трейтий конкурирующий поток делает "+ i + " запись"+'\n');
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
