package bstu.Main;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.MalformedURLException;
import java.net.URL;

public class Main
{
    public static void main(String[] args)
    {
        readSiteDOM("http://hardstonegame.com");
    }

    static void readSiteDOM(String urlString)
    {
        URL hs = null;
        try
        {
            hs = new URL(urlString);
        }
        catch (MalformedURLException e)
        {
            e.printStackTrace();
        }

        if(hs == null)
        {
            throw new RuntimeException();
        }
        try(BufferedReader d = new BufferedReader(new InputStreamReader(hs.openStream())))
        {
            String line = "";
            while ((line = d.readLine()) != null)
            {
                System.out.println(line);
            }
        }
        catch(IOException e)
        {
            e.printStackTrace();
        }
    }
}
