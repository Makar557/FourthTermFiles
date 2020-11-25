package bstu.Main.Sockets;

import java.net.*;
import java.io.*;


public class Client
{
    public static String ipAddr = "localhost";
    public static int port = Server.PORT;

    public static void main(String[] args)
    {
        new ClientThread(ipAddr, port);
    }
}

class Client2 extends Client
{
    public static void main(String[] args)
    {
        new ClientThread(ipAddr, port);
    }
}

class Client3 extends Client
{
    public static void main(String[] args)
    {
        new ClientThread(ipAddr, port);
    }
}


class ClientThread
{
    private Socket socket;
    private BufferedReader in; // поток чтения из сокета
    private BufferedWriter out; // поток чтения в сокет
    private BufferedReader inputUser; // поток чтения с консоли

    private String nickname; // имя клиента

    public ClientThread(String addr, int port)
    {
        try
        {
            this.socket = new Socket(addr, port);
        }
        catch (IOException e)
        {
            System.err.println("Socket failed");
        }

        try
        {
            inputUser = new BufferedReader(new InputStreamReader(System.in));
            in = new BufferedReader(new InputStreamReader(socket.getInputStream()));
            out = new BufferedWriter(new OutputStreamWriter(socket.getOutputStream()));
            this.pressNickname();
            new ReadMsg().start();
            new WriteMsg().start();
        }
        catch (IOException e)
        {
            ClientThread.this.downService();
        }
    }

    private void pressNickname()
    {
        System.out.print("Press your nick: ");
        try
        {
            nickname = inputUser.readLine();
            out.write("Hello " + nickname + "\n");
            out.flush();
        }
        catch (IOException ex)
        {
            System.out.println(ex.getMessage());
        }

    }

    private void downService()
    {
        try
        {
            if (!socket.isClosed())
            {
                socket.close();
                in.close();
                out.close();
            }
        }
        catch (IOException ex)
        {
            System.out.println(ex.getMessage());
        }
    }

    private class ReadMsg extends Thread
    {
        @Override
        public void run()
        {

            String str;
            try
            {
                while (true)
                {
                    str = in.readLine();
//                    if (str.equals("stop"))
//                    {
//                        ClientThread.this.downService();
//                        break;
//                    }
                    System.out.println(str);
                }
            }
            catch (IOException e)
            {
                ClientThread.this.downService();
            }
        }
    }

    public class WriteMsg extends Thread
    {

        @Override
        public void run()
        {
            while (true)
            {
                String userWord;
                try
                {
                    userWord = inputUser.readLine();
                    if (userWord.equals("stop"))
                    {
                        out.write("stop" + "\n");
                        ClientThread.this.downService();
                        break;
                    }
                    else
                    {
                        out.write(nickname + ": " + userWord + "\n");
                    }
                    out.flush();
                }
                catch (IOException e)
                {
                    ClientThread.this.downService();
                }
            }
        }
    }
}