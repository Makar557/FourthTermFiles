package com.gmail.lesya.mileshko;

import com.gmail.lesya.mileshko.univer.Course;
import com.gmail.lesya.mileshko.univer.Dean;
import com.gmail.lesya.mileshko.univer.Student;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.apache.log4j.xml.DOMConfigurator;

import static com.gmail.lesya.mileshko.enums.FormStudy.FullTime;
import static com.gmail.lesya.mileshko.enums.Specialty.*;

public class Main {

    static {
        new DOMConfigurator().doConfigure("log/log4j.xml",
                LogManager.getLoggerRepository());
    }

    private static final Logger LOG = Logger.getLogger(Main.class);

    public static void main(String[] args) {
        try {
            LOG.info("Starting program");
            LOG.info("Create Dean(singleton)");
            Dean dean = Dean.getInstance();
            LOG.info("Create first(Course) by FactoryMethod");
            Course students = dean.factoryMethod("All students");
            LOG.info("Create and add students to course");
            Student ivan = new Student("Ivan", "Jermakov", ISaT, 2, FullTime, 7730846);
            String ex[] = {"OOP", "MatProg", "Economy", "CGaG", "Database"};
            int ivanMarks[] = { 8, 7, 6, 10};
            ivan.setExams(ex, ivanMarks);
            Student lesya = new Student("Olesya", "Mileshko", ITS, 2, FullTime, 7764975);
            int lesyaMarks[] = {8, 8, 7, 8, 9};
            lesya.setExams(ex, lesyaMarks);
            Student dima = new Student("Dmitry", "Nichiporchik", ISaT, 2, FullTime, 7789546);
            int dimaMarks[] = {9, 8, 2, 7, 9};
            dima.setExams(ex, dimaMarks);
            Student semyon = new Student("Semyon", "Pilik", ISSfMS, 1, FullTime, 7788566);
            int semyonMarks[] = {7, 7, 6, 7, 8};
            semyon.setExams(ex, semyonMarks);
            Student vodemka = new Student("Vadim", "Dokurno", ITS, 2, FullTime, 7746860);
            int vodemkaMarks[] = {9, 8, 8, 6, 9};
            vodemka.setExams(ex, vodemkaMarks);
            Student alina = new Student("Alina", "Zhukova", DoEaWP, 1, FullTime, 7746645);
            int alinaMarks[] = {8, 8, 8, 8, 9};
            alina.setExams(ex, alinaMarks);
            students.AddStudent(ivan);
            students.AddStudent(lesya);
            students.AddStudent(dima);
            students.AddStudent(semyon);
            students.AddStudent(vodemka);
            students.AddStudent(alina);
            LOG.info("Counter of courses");
            dean.countCourses(students);

            Course second_course = dean.factoryMethod("Second course");
            dean.createCourseByNumberOfCourse(students, second_course, 2);
            System.out.println();
            System.out.println("Second course");
            for (int i = 0; i < second_course.getMyCourse().size(); i++) {
                System.out.println(i+1 + ") " + second_course.getStudByID(i).getName());
            }

            System.out.println();
            System.out.println("All students");
            for (int i = 0; i < students.getMyCourse().size(); i++) {
                System.out.println(i+1 + ") " + students.getStudByID(i).getName());
            }

            LOG.info("Sorting by name");
            dean.sortByName(students);
            System.out.println();
            System.out.println("Sorting by name");
            for (int i = 0; i < students.getMyCourse().size(); i++) {
                System.out.println(i+1 + ") " + students.getStudByID(i).getName());
            }

            dean.sortByMark(students);
            System.out.println();
            System.out.println("Sorting by mark");
            for (int i = 0; i < students.getMyCourse().size(); i++) {
                System.out.println(i+1 + ") " + students.getStudByID(i).getName());
            }
            LOG.info("End Program");
        } catch (NullPointerException e) {
            System.out.println(e.getMessage());
        } catch (ArrayIndexOutOfBoundsException e) {
            System.out.println(e.getMessage());
        }
    }

}
