package by.belstu.it.Chayeuski.Course;
import by.belstu.it.Chayeuski.Student.Student;

import java.util.ArrayList;

public class Course {
    ArrayList<Student> myCourse = new ArrayList<>();

    public void setMyCourse(ArrayList<Student> pMyCourse) {
        if (pMyCourse == null)
            throw new NullPointerException("Null pointer");
        this.myCourse = pMyCourse;
    }

    public ArrayList<Student> getMyCourse() {
        return myCourse;
    }

    public void AddStudent(Student pStud) {
        if (pStud == null)
            throw new NullPointerException("Null pointer");
        this.myCourse.add(pStud);
    }

    public Student GetStudByID(int id) {
        if(id>myCourse.size())
            throw new ArrayIndexOutOfBoundsException("Error in ID");
        return this.myCourse.get(id);
    }

    String name;

    public Course(String val) {
        this.name = val;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }

    public ArrayList<Student> GetMyCourse() {
        return this.myCourse;
    }

}
