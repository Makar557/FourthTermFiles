package com.gmail.lesya.mileshko.parser;

import com.gmail.lesya.mileshko.univer.Student;
import org.apache.log4j.Logger;
import org.xml.sax.SAXException;

import javax.xml.XMLConstants;
import javax.xml.transform.Source;
import javax.xml.transform.stream.StreamSource;
import javax.xml.validation.Schema;
import javax.xml.validation.SchemaFactory;
import javax.xml.validation.Validator;
import java.io.File;
import java.io.IOException;

public class ValidatorXSD {
    private static final Logger LOG = Logger.getLogger(ValidatorXSD.class);

    public void valid() {
        String filename = "files/XML.xml";
        String schemaname = "files/XML.xsd";
        String logname = "log/log4j.xml";
        Schema schems = null;

        String language = XMLConstants.W3C_XML_SCHEMA_NS_URI;
        SchemaFactory factory = SchemaFactory.newInstance(language);
        try {
            schems = factory.newSchema(new File(schemaname));
            Validator validator = schems.newValidator();
            Source source = new StreamSource(filename);

            Student s = new Student(logname);
            validator.setErrorHandler(s);
            validator.validate(source);
            LOG.info(filename + " is valid");
        } catch (SAXException e) {
            LOG.error(filename + " SAX error " + e.getMessage());
        } catch (IOException e) {
            LOG.error(" io error " + e.getMessage());
        }

    }
}
