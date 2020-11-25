package com.gmail.lesya.mileshko.univer;

import java.util.ArrayList;

public class Course {
    private ArrayList<Student> course = new ArrayList<>();
    private String name;

    public void setCourse(ArrayList<Student> Course) throws NullPointerException {
        this.course = Course;
    }

    public ArrayList<Student> getCourse() {
        return course;
    }

    public void AddStudent(Student student) throws NullPointerException{
        this.course.add(student);
    }

    public Student getStudByID(int id) {
        if(id > course.size())
            throw new ArrayIndexOutOfBoundsException("Error in ID");
        return this.course.get(id);
    }

    public Course() {
    }

    public Course(String val) {
        this.name = val;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }

    public ArrayList<Student> getMyCourse() {
        return this.course;
    }

}
