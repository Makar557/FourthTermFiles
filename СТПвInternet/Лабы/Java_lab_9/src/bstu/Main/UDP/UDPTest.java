package bstu.Main.UDP;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import static org.junit.Assert.*;

public class UDPTest
{
    EchoClient client;

    @Before
    public void setup()
    {
        new EchoServer().start();
        client = new EchoClient();
    }

    @Test
    public void checkForEcho()
    {
        String echo = client.sendEcho("hello server");
        assertEquals("hello server", echo);

        echo = client.sendEcho("server is working");
        assertNotEquals("hello server", echo);
    }

    @After
    public void disconect()
    {
        client.sendEcho("end");
        client.close();
    }
}
