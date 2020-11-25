package com.gmail.lesya.mileshko.parser;

import com.gmail.lesya.mileshko.Main;
import com.gmail.lesya.mileshko.univer.Student;
import org.apache.log4j.Logger;
import org.xml.sax.Attributes;
import org.xml.sax.SAXException;
import org.xml.sax.helpers.DefaultHandler;

public class SAX extends DefaultHandler {
    Student student = new Student();
    String thisElement = "";
    private static final Logger LOG = Logger.getLogger(Main.class);

    @Override
    public void startDocument() throws SAXException {
        LOG.info("Start parsing");
    }

    @Override
    public void startElement(String namespaceURI, String localName, String qName, Attributes atts) throws SAXException {
        thisElement = qName;
    }

    @Override
    public void endElement(String namespaceURI, String localName, String qName) throws SAXException {
        thisElement = "";
    }

    @Override
    public void endDocument() {
        LOG.info("end parsing");
    }

    public Student getResult() {
        return student;
    }

    @Override
    public void characters(char[] ch, int start, int length) throws SAXException {
        if (thisElement.equals("name")) {
            student.setName(new String(ch, start, length));
        }
        if (thisElement.equals("surname")) {
            student.setSurname(new String(ch, start, length));
        }
        if (thisElement.equals("course")) {
            student.setCourse(new Integer(new String(ch, start, length)));
        }
        if(thisElement.equals("gradebookNumber")){
            student.setGradebookNumber(new Integer(new String(ch,start,length)));
        }
    }
}
