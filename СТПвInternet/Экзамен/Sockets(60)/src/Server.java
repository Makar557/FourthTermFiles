import java.io.*;
import java.net.InetAddress;
import java.net.ServerSocket;
import java.net.Socket;

public class Server {
    public static void main(String[] args) throws IOException {
        //Сервер с портом 6666
        ServerSocket serverSocket = new ServerSocket(6666);
        Socket socket = null;
        int id = 0;
        System.out.println("wait...");
        while (true) {
            ++id;
            //ждёт подключение клиента к серверу с помощью метода accept()
            socket = serverSocket.accept();
            //если клиент подключился выводится это сообщение
            System.out.println("Client connected");

            //т.к. работа с несколькими клиентами и одним сервером, то нужно создать поток
            //в конструктор которого передаём сокет клиента
            //этот сокет даёт понять какой клиент подключился к серверу
            ThreadServer threadServer = new ThreadServer(socket, id);
            threadServer.start();
        }

    }
}
