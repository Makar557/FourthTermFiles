package bstu.Main.Sockets;

import java.io.*;
import java.net.*;
import java.util.LinkedList;

public class Server
{

    public static final int PORT = 8080;
    public static LinkedList<ServerThread> serverList = new LinkedList<>();
    public static Story story;

    public static void main(String[] args) throws IOException
    {
        ServerSocket server = new ServerSocket(PORT);
        story = new Story();
        System.out.println("Server Started");
        try
        {
            while(true)
            {
                Socket socket = server.accept();
                try
                {
                    serverList.add(new ServerThread(socket));
                }
                catch (IOException e)
                {
                    socket.close();
                }
            }
        }
        finally
        {
            server.close();
        }
    }
}

class ServerThread extends Thread
{
    private Socket socket;
    private BufferedReader in;
    private BufferedWriter out;

    public ServerThread(Socket socket) throws IOException
    {
        this.socket = socket;

        in = new BufferedReader(new InputStreamReader(socket.getInputStream()));
        out = new BufferedWriter(new OutputStreamWriter(socket.getOutputStream()));
        start();
    }
    @Override
    public void run()
    {
        String word;
        try
        {
            // первое сообщение отправленное сюда - это никнейм
            word = in.readLine();
            try
            {
                out.write(word + "\n");
                out.flush();
            }
            catch (IOException ex)
            {
                System.out.println(ex.getMessage());
            }
            try
            {
                while (true)
                {
                    word = in.readLine();
                    if(word.equals("stop"))
                    {
                        this.downService();
                        break;
                    }
                    System.out.println("Echoing: " + word);
                    Server.story.addStoryEl(word);
                    for (ServerThread vr : Server.serverList)
                    {
                        vr.send(word);
                    }
                }
            }
            catch (NullPointerException ex)
            {
                System.out.println(ex.getMessage());
            }
        }
        catch (IOException ex)
        {
            System.out.println(ex.getMessage());
        }
    }

    private void send(String msg)
    {
        try
        {
            out.write(msg + "\n");
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
            if(!socket.isClosed())
            {
                socket.close();
                in.close();
                out.close();
                for (ServerThread vr : Server.serverList)
                {
                    if(vr.equals(this)) vr.interrupt();
                    Server.serverList.remove(this);
                }
            }
        }
        catch (IOException ex)
        {
            System.out.println(ex.getMessage());
        }
    }
}

class Story
{
    private LinkedList<String> story = new LinkedList<>();

    public void addStoryEl(String el)
    {
        if (story.size() >= 10)
        {
            story.removeFirst();
        }
            story.add(el);
    }
}

