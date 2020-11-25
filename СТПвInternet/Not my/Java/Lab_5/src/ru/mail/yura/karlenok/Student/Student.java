package ru.mail.yura.karlenok.Student;

import ru.mail.yura.karlenok.Enum.Form;
import ru.mail.yura.karlenok.Enum.Specialization;
import ru.mail.yura.karlenok.Interfaces.Action;
import ru.mail.yura.karlenok.Enum.*;

import org.xml.sax.ErrorHandler;
import org.xml.sax.SAXException;
import org.xml.sax.SAXParseException;

public class Student implements Action, ErrorHandler {
    public Student(String pName, int pCourse, Form pForm, Specialization pSpecialization, double pMark) {
        this.name = pName;
        this.course = pCourse;
        this.form = pForm;
        this.specialization = pSpecialization;
    }

    public Student(int pnumzach, String psname, String pname, int pcourse)
    {
        this.numOfZach = pnumzach;
        this.surname = psname;
        this.name = pname;
        this.course = pcourse;
    }
    int numOfZach;

    public void setNumOfZach(int val) {
        this.numOfZach = val;
    }

    public int getNumOfZach() {return this.numOfZach;}

    String surname;

    public void setSurname(String val) {
        this.surname = val;
    }

    public String getSurname() {
        return this.surname;
    }

    String name;

    public Student() {
    }
    public Student(String logname) {
    }
    @Override
    public String toString() {
        return this.name + " " + this.surname + " " + this.course + " " + this.numOfZach;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    int course;

    public int getCourse() {
        return course;
    }

    public void setCourse(int course) {
        this.course = course;
    }

    Form form;

    public Form getForm() {
        return form;
    }

    public void setForm(Form form) {
        this.form = form;
    }

    Specialization specialization;

    public Specialization getSpec() {
        return specialization;
    }

    public void setSpec(Specialization spec) {
        this.specialization = spec;
    }

    @Override
    public void GoWalk() {
        System.out.println("Go walk");
    }

    @Override
    public void MissLesson() {
        System.out.println("Miss");
    }

    @Override
    public void PlayGames() {
        System.out.println("Play");
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
}