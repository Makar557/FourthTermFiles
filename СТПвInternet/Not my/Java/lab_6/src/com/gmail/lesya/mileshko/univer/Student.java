package com.gmail.lesya.mileshko.univer;

import com.gmail.lesya.mileshko.enums.FormStudy;
import com.gmail.lesya.mileshko.enums.Specialty;
import org.xml.sax.ErrorHandler;
import org.xml.sax.SAXException;
import org.xml.sax.SAXParseException;

public class Student implements Actions, ErrorHandler {

    private String name;
    private String surname;
    private Specialty specialty;
    private Integer course;
    private FormStudy formStudy;
    public ExamResult[] exams;
    private Integer gradebookNumber;
    public Integer average = 0;

    public Student(Integer gradebookNumber) {
        this.gradebookNumber = gradebookNumber;
    }

    private class ExamResult {

        private String name;
        private Integer mark;
        private Boolean passed;

        public ExamResult(String name) {

            this.name = name;

            passed = false;

        }

        public void passExam() {

            passed = true;

        }


        public void setMark(int mark) {

            this.mark = mark;

        }

        public int getMark() {

            return mark;

        }

        public int getPassedMark() {

            final int PASSED_MARK = 4;

            return PASSED_MARK;

        }

        public String getName() {

            return name;

        }

        public boolean isPassed() {

            return passed;

        }

        public ExamResult() {
        }
    }

    public void setExams(String[] name, int[] marks) {

        if (name.length != marks.length)

            throw new IllegalArgumentException();

        exams = new ExamResult[name.length];

        for (int i = 0; i < name.length; i++) {

            exams[i] = new ExamResult(name[i]);

            exams[i].setMark(marks[i]);

            if (exams[i].getMark() >= exams[i].getPassedMark())

                exams[i].passExam();

        }

        for (int i = 0; i < marks.length; i++) {
            average += marks[i];
        }
        average/=marks.length;

    }




    public Student(String logname) {
    }

    @Override
    public String toString() {
        return this.name + " " + this.surname + " " + this.course + " " + this.gradebookNumber;
    }

    @Override
    public void warning(SAXParseException exception) throws SAXException {

    }

    @Override
    public void error(SAXParseException exception) throws SAXException {

    }

    @Override
    public void fatalError(SAXParseException exception) throws SAXException {

    }

    @Override
    public void goWalk() {
        System.out.println("Sun! I'll go for a walk.");
    }

    @Override
    public void goToClass() {
        System.out.println("Again to study :( ");
    }

    @Override
    public void playGames() {
        System.out.println("Heroes of Might and Magic III!!!");
    }

    @Override
    public void writeCode() {
        System.out.println("Coffee -> Code -> Repeat -> ...");
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSurname() {
        return surname;
    }

    public void setSurname(String surname) {
        this.surname = surname;
    }

    public Specialty getSpecialty() {
        return specialty;
    }

    public void setSpecialty(Specialty specialty) {
        this.specialty = specialty;
    }

    public Integer getCourse() {
        return course;
    }

    public void setCourse(Integer course) {
        this.course = course;
    }

    public FormStudy getFormStudy() {
        return formStudy;
    }

    public void setFormStudy(FormStudy formStudy) {
        this.formStudy = formStudy;
    }

    public Integer getGradebookNumber() {
        return gradebookNumber;
    }

    public void setGradebookNumber(Integer gradebookNumber) {
        this.gradebookNumber = gradebookNumber;
    }

    public Student() {
    }

    public Student(String name, String surname, Specialty specialty, Integer course, FormStudy formStudy, Integer gradebookNumber) {
        this.name = name;
        this.surname = surname;
        this.specialty = specialty;
        this.course = course;
        this.formStudy = formStudy;
        this.gradebookNumber = gradebookNumber;
        ExamResult examResult = new ExamResult();
    }


}
