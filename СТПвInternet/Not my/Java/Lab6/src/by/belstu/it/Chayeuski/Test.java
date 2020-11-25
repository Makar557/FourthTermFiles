package by.belstu.it.Chayeuski;

import by.belstu.it.Chayeuski.Student.Student;
import by.belstu.it.Chayeuski.Enum.*;
import org.testng.Assert;
import org.testng.annotations.*;


public class Test {
    private Student student = new Student(new String("Andrey"),
            2, Form.DAY, Specialization.ITS, 8.0);

    @BeforeSuite
    public void testBeforeSuite() {
        System.out.println("@BeforeSuite");
    }
    @BeforeTest
    public void testBeforeTest() {
        System.out.println("@BeforeTest");
    }
    @BeforeGroups
    public void testBeforeGroups() {
        System.out.println("@BeforeGroups");
    }
    @BeforeClass
    public void testBeforeClass() {
        System.out.println("@BeforeClass");
    }
    @BeforeMethod
    public void testBeforeMethod() {
        System.out.println("@BeforeMethod");
    }

    @AfterSuite
    public void testASuite() {
        System.out.println("@AfterSuite");
    }
    @AfterTest
    public void testATest() {
        System.out.println("@AfterTest");
    }
    @AfterGroups
    public void testAGroups() {
        System.out.println("@AfterGroups");
    }
    @AfterClass
    public void testAClass() {
        System.out.println("@AfterClass");
    }
    @AfterMethod
    public void testAMethod() {
        System.out.println("@AfterMethod");
    }

    @org.testng.annotations.Test(alwaysRun = true)
    public void testObject(){
        try{
            if(student == null)
                throw new NullPointerException();
            Assert.assertEquals(student.getName(), "Andrew");
            Assert.assertEquals(student.getCourse() , 2);
            System.out.println("@Test");
        }
        catch(NullPointerException e){
            System.out.println(e.getMessage());
        }
    }

    //4
    @org.testng.annotations.Test(enabled = false, timeOut = 100)
    public void ignoredTest(){
        System.out.println("Ignored");
    }

    //5
    @org.testng.annotations.Test(groups = {"Group"})
    public void test1Group(){
        System.out.println("Method 1 test in group");
    }
    @org.testng.annotations.Test(groups = {"Group"})
    public void test2Group(){
        System.out.println("Method 2 test in group");
    }
    @org.testng.annotations.Test(dependsOnGroups = "Group")
    public void testGroup(){
        System.out.println("Group test");
    }
}

