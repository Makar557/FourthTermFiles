package bstu.kubik.Main;

import bstu.kubik.Employee.Employee;
import bstu.kubik.staff.*;

import java.io.*;
import java.util.logging.Logger;
import java.util.stream.Stream;

import javax.xml.XMLConstants;
import javax.xml.parsers.SAXParser;
import javax.xml.parsers.SAXParserFactory;
import javax.xml.stream.XMLInputFactory;
import javax.xml.stream.XMLStreamConstants;
import javax.xml.stream.XMLStreamReader;
import javax.xml.validation.Schema;
import javax.xml.validation.SchemaFactory;

import com.fasterxml.jackson.databind.ObjectMapper;

public class Main {
    private static final Logger logger = Logger.getLogger(Main.class.getName());

    public static void main(String[] args) {
        try {
            logger.info("Creating instance of type Director");
            Director director = new Director("Petr", 45, 3500);
            collectionInit(director);

            validateXML();

            xmlParse();

            jsonSerialize(director);
            director = jsonDeserialize(director);

            Stream<Employee> streamXML = director.getStaff().stream();
            streamXML.forEach(e ->
            {
                if (e.getAge() > 20)
                    System.out.println(e.getName() + " is older then 20. His age is " + e.getAge());
            });
        } catch (Exception ex) {
            logger.warning("Shit happened: " + ex.getMessage());
            System.out.println(ex.getMessage());
        }
    }

    private static Director xmlParse() throws Exception {
        Director tempDirector = new Director();
        XMLInputFactory xmlInputFactory = XMLInputFactory.newInstance();
        XMLStreamReader parser = xmlInputFactory.createXMLStreamReader(new FileInputStream("D:\\Университет\\4sem\\СТПвInternet\\Лабы\\Java_3_4\\files\\xmlFile.xml"));
        while (parser.hasNext()) {
            if (parser.next() == XMLStreamConstants.START_ELEMENT) {
                switch (parser.getName().toString()) {
                    case "employee":
                        tempDirector.getStaff().add(new Employee());
                        break;
                    case "name":
                        tempDirector.getStaff().get(tempDirector.getStaff().size() - 1).setName(parser.getElementText());
                        break;
                    case "age":
                        tempDirector.getStaff().get(tempDirector.getStaff().size() - 1).setAge(Integer.parseInt(parser.getElementText()));
                        break;
                    case "salary":
                        tempDirector.getStaff().get(tempDirector.getStaff().size() - 1).setSalary(Float.parseFloat(parser.getElementText()));
                        break;
                    default:
                        break;
                }
            }
        }

        return tempDirector;
    }

    private static void validateXML() {
        try {
            String xmlFile_path = "D:\\Университет\\4sem\\СТПвInternet\\Лабы\\Java_3_4\\files\\xmlFile.xml";
            String xsdFile_path = "D:\\Университет\\4sem\\СТПвInternet\\Лабы\\Java_3_4\\files\\xmlSchema.xsd";
            Schema schema = null;
            SchemaFactory factory = SchemaFactory.newInstance(XMLConstants.W3C_XML_SCHEMA_NS_URI);
            // установка проверки с использованием XSD
            schema = factory.newSchema(new File(xsdFile_path));
            SAXParserFactory spf = SAXParserFactory.newInstance();
            spf.setSchema(schema);
            // создание объекта-парсера
            SAXParser parser = spf.newSAXParser();
            System.out.println("XML File is valid");
        } catch (Exception ex) {
            logger.warning("Xml file is not valid");
        }
    }

    private static void collectionInit(Director director) throws Exception {
        logger.info("Adding 3 instances of type Engineer to the staff.");
        director.getStaff().add(new Engineer("Petya", 25, 700));

        logger.info("Adding 2 instances of type SysAdmin to the staff.");
        director.getStaff().add(new SysAdmin("Vanya", 32, 1900));

        logger.info("Adding 5 instances of type Programmer to the staff(2 juniors, 1 middle, 2 senior).");
        director.getStaff().add(new Programmer("Ilya", 22, 550, Programmer.Qualification.junior));
        director.getStaff().add(new Programmer("Vitalya", 23, 600, Programmer.Qualification.middle));
        director.getStaff().add(new Programmer("Artem", 30, 2700, Programmer.Qualification.senior));

        logger.info("Call to the method 'director.countStaff()'");
        System.out.println("Count of staff: " + director.countStaff());

        logger.info("Call to the method 'director.sortStaffBySalary()' and iterating over returned elems in foreach");
        for (Employee el : director.sortStaffBySalary())
            System.out.println(el.toString());

        System.out.println("-----------------------------------------------------");
        logger.info("Call to the method 'director.getStaffWithSkill(staffSkills.Programmer_junior)' and iterating over returned elems in foreach");
        for (Employee el : director.getStaffWithSkill(staffSkills.Programmer_junior))
            System.out.println(el.toString());
    }

    private static void jsonSerialize(Director director) throws IOException {
        FileWriter fileWriter = new FileWriter("D:\\Университет\\4sem\\СТПвInternet\\Лабы\\Java_3_4\\files\\jsonFile.json", false);
        ObjectMapper mapper = new ObjectMapper();
        fileWriter.write(mapper.writeValueAsString(director));
        fileWriter.close();
    }

    private static Director jsonDeserialize(Director director) throws Exception {
        FileReader fileReader = new FileReader("D:\\Университет\\4sem\\СТПвInternet\\Лабы\\Java_3_4\\files\\jsonFile.json");
        ObjectMapper mapper = new ObjectMapper();
        return mapper.readValue(fileReader, Director.class);
    }
}