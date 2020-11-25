package bstu.UnitTester;

import bstu.staff.Director;
import org.junit.Test;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;

public class DirectorAddTest
{
    @Test(timeout = 20)
    public void directorAddTest()
    {
        Director director = null;
        String name = "name";
        int age = 20;
        float salary = 2000;
        try
        {
            director = new Director(name, age, salary);
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }

        assertNotNull(director);
        assertEquals(director.getName(), name);
        assertEquals(director.getAge(), age);
        assertEquals(director.getSalary(), salary, 0.01);
    }
}
