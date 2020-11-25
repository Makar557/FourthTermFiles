package by.belstu.it.Chayeuski.parsers;

import by.belstu.it.Chayeuski.Student.Student;
import org.xml.sax.helpers.DefaultHandler;
import org.xml.sax.*;

public class SAX extends DefaultHandler {
    Student stud = new Student();
    String thisElement = "";

    @Override
    public void startDocument() throws SAXException {
        System.out.println("Start parsing");
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
        System.out.println("end parsing");
    }

    public Student getResult() {
        return stud;
    }

    @Override
    public void characters(char[] ch, int start, int length) throws SAXException {
        if (thisElement.equals("name")) {
            stud.setName(new String(ch, start, length));
        }
        if (thisElement.equals("surname")) {
            stud.setSurname(new String(ch, start, length));
        }
        if (thisElement.equals("course")) {
            stud.setCourse(new Integer(new String(ch, start, length)));
        }
        if(thisElement.equals("numOfZach")){
            stud.setNumOfZach(new Integer(new String(ch,start,length)));
        }
    }
}