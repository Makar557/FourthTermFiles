import javax.xml.crypto.Data;
import java.io.*;
import java.net.InetAddress;
import java.net.Socket;
import java.net.UnknownHostException;
import java.util.Date;

public class Client{
    public static void main(String[] args) throws IOException, InterruptedException {
        //создаём сокет, который будет подключаться к серверу по порту 6666
        Socket socket = new Socket(InetAddress.getLocalHost(), 8080);

        //эти 2 класса для того, чтобы отправить сообщение серверу
        OutputStream outputStream = socket.getOutputStream();
        DataOutputStream dataOutputStream = new DataOutputStream(outputStream);

        //эти 2 класса для того, чтобы получить сообщения с сервера
        InputStream inputStream = socket.getInputStream();
        DataInputStream dataInputStream = new DataInputStream(inputStream);

        //наша задача отправить число серверу <60
        //BufferReader как раз для того, чтобы отправить число на сервер
        String line = null;
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

        //ещё наша задача, это отправить серверу время, спустя которое сервер кинет ответ клиенту
        String time = null;

        //клиент может кидать данные серверу сколько угодно раз, т.к. цикл while(true) -> бесконечный
        while (true){

        }
    }
}
