package com.gmail.lesya.mileshko.univer;

import org.junit.*;

import java.util.ArrayList;

import static com.gmail.lesya.mileshko.enums.FormStudy.FullTime;
import static com.gmail.lesya.mileshko.enums.Specialty.ISaT;
import static com.gmail.lesya.mileshko.enums.Specialty.ITS;

public class CourseTest {

    private static Student ivan;
    private static Student lesya;
    private static Student dima;
    private static Course course = new Course();
    private static int count = 1;

    @BeforeClass
    public static void initCourse() {
        ivan = new Student("Ivan", "Jermakov", ISaT, 2, FullTime, 7730846);
        String ex[] = {"OOP", "MatProg", "Economy", "CGaG", "Database"};
        int ivanMarks[] = {10, 8, 7, 6, 10};
        ivan.setExams(ex, ivanMarks);
        lesya = new Student("Olesya", "Mileshko", ITS, 2, FullTime, 7764975);
        int lesyaMarks[] = {8, 8, 7, 8, 9};
        lesya.setExams(ex, lesyaMarks);
        dima = new Student("Dmitry", "Nichiporchik", ISaT, 2, FullTime, 7789546);
        int dimaMarks[] = {9, 8, 2, 7, 9};
        dima.setExams(ex, dimaMarks);
        course.AddStudent(ivan);
        course.AddStudent(lesya);
        course.AddStudent(dima);

    }

    @Test(timeout = 100)
    public void getCourse() {

        ArrayList<Student> expected = course.getCourse();
        ArrayList<Student> actual = new ArrayList<>();

        actual.add(ivan);
        actual.add(lesya);
        actual.add(dima);

        Assert.assertEquals(expected, actual);
    }

    @Test
    public void getStudByID() {

        Student expected = course.getStudByID(2);
        Student actual = dima;

        Assert.assertEquals(expected, actual);
    }

    @Ignore
    @Test
    public void course_NO_NULL() {
        Assert.assertNotNull(course);
    }

    @Test(expected = Exception.class)
    public void exception(){
        ivan = new Student("Ivan", "Jermakov", ISaT, 2, FullTime, 7730846);
        String ex[] = {"OOP", "MatProg", "Economy", "CGaG", "Database"};
        int ivanMarks[] = {6, 10};
        ivan.setExams(ex, ivanMarks);
    }

    @After
    public void afterTest() {
        System.out.println("test " + count + " passed!");
        count++;
    }

    @AfterClass
    public static void afterClass() {
        System.out.println("all tests passed!");
    }

}
