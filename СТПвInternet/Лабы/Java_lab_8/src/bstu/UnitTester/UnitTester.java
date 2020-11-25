package bstu.UnitTester;

import bstu.staff.Engineer;
import bstu.staff.Programmer;
import bstu.staff.SysAdmin;
import org.junit.*;
import org.junit.runners.MethodSorters;

import static org.junit.Assert.*;

@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class UnitTester
{
    @BeforeClass
    public static void beforeclassInit()
    {
        System.out.println("@BeforeClass");
    }

    @Before
    public void beforeInit()
    {
        System.out.println("@Before");
    }

    @Test(timeout = 100)
    public void calls()
    {
        engineerAddTest();
        sysAdminAddTest();
        programmerAddTest();
    }

    //@Test(timeout = 15)
    public void engineerAddTest()
    {
        System.out.println("@Test engeneer");
        Engineer engineer = null;
        String name = "name";
        int age = 35;
        float salary = 2000;
        try
        {
            engineer = new Engineer(name, age, salary);
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }

        assertNotNull(engineer);
        assertEquals(engineer.getName(), name);
        assertEquals(engineer.getAge(), age);
        assertEquals(engineer.getSalary(), salary, 0.01);
    }

    //@Test(timeout = 18)
    public void sysAdminAddTest()
    {
        System.out.println("@Test sysAdmin");
        SysAdmin sysAdmin = null;
        String name = "name";
        int age = 47;
        float salary = 1600;
        try
        {
            sysAdmin = new SysAdmin(name, age, salary);
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }

        assertNotNull(sysAdmin);
        assertEquals(sysAdmin.getName(), name);
        assertEquals(sysAdmin.getAge(), age);
        assertEquals(sysAdmin.getSalary(), salary, 0.01);
    }

    //@Test(timeout = 20)
    public void programmerAddTest()
    {
        System.out.println("@Test programmer");
        Programmer programmer = null;
        String name = "name";
        int age = 47;
        float salary = 1600;
        Programmer.Qualification qualification = Programmer.Qualification.senior;

        try
        {
            programmer = new Programmer(name, age, salary, qualification);
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }

        assertNotNull(programmer);
        assertEquals(programmer.getName(), name);
        assertEquals(programmer.getAge(), age);
        assertEquals(programmer.getSalary(), salary, 0.01);
        assertEquals(programmer.getQualification(), qualification);
    }

    @After
    public void afterInit()
    {
        System.out.println("@After");
    }

    @AfterClass
    public static void afterclassInit()
    {
        System.out.println("@AfterClass");
    }
}

