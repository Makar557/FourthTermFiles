package by.belstu.it.Chayeuski.Main;

import by.belstu.it.Chayeuski.Student.Student;

import by.belstu.it.Chayeuski.parsers.DOM;
import by.belstu.it.Chayeuski.parsers.SAX;
import by.belstu.it.Chayeuski.parsers.ValidatorXSD;

import com.google.gson.reflect.TypeToken;
import org.apache.log4j.Logger;
import org.apache.log4j.LogManager;
import org.apache.log4j.xml.DOMConfigurator;
import org.xml.sax.SAXException;

import javax.xml.parsers.ParserConfigurationException;
import javax.xml.parsers.SAXParser;
import javax.xml.parsers.SAXParserFactory;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.stream.StreamResult;
import javax.xml.transform.stream.StreamSource;
import java.beans.XMLDecoder;
import java.beans.XMLEncoder;
import java.io.File;
import java.io.*;
import java.util.*;

import com.google.gson.Gson;

public class Main {
    static {
        new DOMConfigurator().doConfigure("log/log4j.xml",
                LogManager.getLoggerRepository());
    }

    private static final Logger LOG = Logger.getLogger(Main.class);

    public static void main(String[] args) {
        //validator
        ValidatorXSD val = new ValidatorXSD();
        val.valid();

        try {
            //SAX
            System.out.println("SAX");
            SAXParserFactory factory = SAXParserFactory.newInstance();
            SAXParser parser = factory.newSAXParser();
            SAX sax = new SAX();
            parser.parse(new File("files/XML.xml"), sax);
            Student Andrew = sax.getResult();
            System.out.println(Andrew.toString());


            //DOM
            System.out.println("DOM");
            DOM dom = new DOM();
            dom.startParser("files/XML.xml");
            System.out.println(dom.students.get(0).getName());


            //XMLtoHTML
            TransformerFactory xstf = TransformerFactory.newInstance();
            Transformer transformer = null;
            transformer=xstf.newTransformer(new StreamSource("files/XSL.xsl"));
            transformer.transform(new StreamSource("files/XMLtoHTML.xml"), new StreamResult("files/info.html"));


            //serialization
            FileOutputStream out = new FileOutputStream("files/serialize.xml");
            XMLEncoder xmlEncoder = new XMLEncoder(out);
            xmlEncoder.writeObject(Andrew);
            xmlEncoder.close();


            //Deserialization
            System.out.println("Deserialize");
            FileInputStream in = new FileInputStream("files/serialize.xml");
            XMLDecoder xmlDecoder = new XMLDecoder(in);
            Student Andre = (Student) xmlDecoder.readObject();
            xmlDecoder.close();
            System.out.println(Andre.toString());


            //json
            FileWriter out_JSON = new FileWriter("files/toJSON.json");

            Collection collection = new ArrayList<Student>();
            collection.add(Andre);
            collection.add(Andre);
            Gson gson = new Gson();
            gson.toJson(collection, out_JSON);

            out_JSON.close();

            FileReader in_JSON = new FileReader("files/toJSON.json");
            ArrayList<Student> list = new Gson().fromJson(in_JSON,new TypeToken<ArrayList<Student>>(){}.getType());
            System.out.println(list.toString());
            in_JSON.close();
        } catch (ParserConfigurationException e) {
            e.printStackTrace();
        } catch (SAXException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}