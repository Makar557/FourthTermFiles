package bstu.Main.UDP;

import java.net.DatagramPacket;
import java.net.DatagramSocket;
import java.net.InetAddress;
import java.net.SocketException;

public class EchoClient
{
    private DatagramSocket socket;
    private InetAddress address;
    private byte[] buf;

    public EchoClient()
    {
        try
        {
            socket = new DatagramSocket();
            address = InetAddress.getByName("localhost");
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
    }

    public String sendEcho(String msg)
    {
        String received = new String("");
        try
        {
            buf = msg.getBytes();
            DatagramPacket packet= new DatagramPacket(buf, buf.length, address, EchoServer.PORT);
            socket.send(packet);
            packet = new DatagramPacket(buf, buf.length);
            socket.receive(packet);
            received = new String(packet.getData(), 0, packet.getLength());

        }
        catch (Exception e)
        {
            e.printStackTrace();
        }

        return received;
    }

    public void close()
    {
        socket.close();
    }
}
