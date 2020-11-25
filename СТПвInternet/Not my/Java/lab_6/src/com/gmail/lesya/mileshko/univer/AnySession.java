package com.gmail.lesya.mileshko.univer;

import static com.gmail.lesya.mileshko.enums.FormStudy.*;
import static com.gmail.lesya.mileshko.enums.Specialty.*;

public class AnySession {
    public static void main(String[] args) {

        Student stud = new Student("Ivan", "Jermakov", ISaT, 2,FullTime, 7730846);

        String ex[] = {"OOP", "MatProg", "Economy", "CGaG", "Database"};

        int marks[] = {10, 8, 2, 6, 10};

        stud.setExams(ex, marks);

        System.out.println(stud);

        stud.writeCode();

    }
}
