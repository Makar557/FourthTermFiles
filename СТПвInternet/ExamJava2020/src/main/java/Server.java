import java.io.*;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.Date;
import java.util.LinkedList;

public class Server {
    public static final int PORT = 8080;
    public static LinkedList<ServerThread> serverList = new LinkedList<>();

    public static void main(String[] args) throws IOException
    {
        ServerSocket server = new ServerSocket(PORT);
        System.out.println("Server started");
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
            try
            {
                while (true)
                {
                    word = in.readLine();

                    // /day
                    if(word.equals("day"))
                    {
                        for (ServerThread vr : Server.serverList)
                        {
                            Date d =new Date();
                            String sd = d.toString();
                            out.write( sd + "\n");
                            out.flush();
                        }
                    }
                    // /weather
                    if(word.equals("weather"))
                    {
                        for (ServerThread vr : Server.serverList)
                        {
                            out.write( "32C" + "\n");
                            out.flush();                        }
                    }
                    if(word.equals("help"))
                    {
                        for (ServerThread vr : Server.serverList)
                        {

                            out.write( "/day - current date" + "\n");
                            out.write( "/weather - current temp" + "\n");

                            out.flush();                        }
                    }

                    if(word.equals("stop"))
                    {
                        this.downService();
                        break;
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
