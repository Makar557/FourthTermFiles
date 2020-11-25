import javax.xml.crypto.Data;
import java.io.*;
import java.net.Socket;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class ThreadServer extends Thread{
    //для чего сокет - описал в классе Server
    Socket socket;
    int id;
    ThreadServer(Socket socket, int id){
        this.socket = socket;
        this.id = id;
    }

    @Override
    public void run() {
        try {
            System.out.println(id);
            //эти 2 класса для того, чтобы получить сообщение от клиента
            InputStream inputStream = socket.getInputStream();
            DataInputStream dataInputStream = new DataInputStream(inputStream);

            //эти 2 класса для того, чтобы отправить сообщение клиенту
            OutputStream outputStream = socket.getOutputStream();
            DataOutputStream dataOutputStream = new DataOutputStream(outputStream);

            //while(true) -> бесконечный цикл, для того, чтобы получать от клиента бесконечно много сообщений
            while (true) {

            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
