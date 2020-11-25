package com.gmail.lesya.mileshko.univer;

import java.util.Comparator;

public class Dean extends Admin {

    private static Dean instance;
    public static Dean getInstance() {
        if (instance == null)
            instance = new Dean();
        return instance;
    }

    @Override
    public Course factoryMethod(String val) {
        return new Course(val);
    }

    public void countCourses(Course val) {
        int first = 0;
        int second = 0;
        int third = 0;
        int fourth = 0;
        for (int i = 0; i < val.getMyCourse().size(); i++) {
            if (val.getStudByID(i).getCourse() == 1)
                first++;
            if (val.getStudByID(i).getCourse() == 2)
                second++;
            if (val.getStudByID(i).getCourse() == 3)
                third++;
            if (val.getStudByID(i).getCourse() == 4)
                fourth++;
        }
        System.out.println("Stud on first coutse: " + first);
        System.out.println("Stud on second coutse: " + second);
        System.out.println("Stud on third coutse: " + third);
        System.out.println("Stud on fourth coutse: " + fourth);
    }

    public void createCourseByNumberOfCourse(Course course, Course newCourse, int courseNum) {
        if (course == null || newCourse == null)
            throw new NullPointerException("Null pointer");
        for (int i = 0; i < course.getMyCourse().size(); i++) {
            if (course.getStudByID(i).getCourse() == courseNum)
                newCourse.getMyCourse().add(course.getStudByID(i));
        }
    }

    public void sortByName(Course val) throws NullPointerException {
        val.getMyCourse().sort(new Comparator<Student>() {
            @Override
            public int compare(Student a, Student b) {
                return a.getName().compareTo(b.getName());
            }
        });
    }

    public void sortByMark(Course val) throws NullPointerException {
        val.getMyCourse().sort(new Comparator<Student>() {
            @Override
            public int compare(Student a, Student b) {
                return (int)(b.average - a.average);
            }
        });
    }


}
