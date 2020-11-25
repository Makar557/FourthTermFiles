import java.sql.*;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.apache.log4j.xml.DOMConfigurator;

public class Main {

    public static void main(String[] args)  {
        try {
            //connection to database
            Connection myConn = DriverManager.getConnection("jdbc:mysql://localhost:8889/demo", "root", "root");

            //create statement
            Statement myStmt = myConn.createStatement();

            //execute sql query
            ResultSet myRs = myStmt.executeQuery("select * from employees");

            //results set
            while (myRs.next()) {
                System.out.println(myRs.getString("last name")+ " , "+myRs.getString("first name")+ " , "+myRs.getString("email"));
            }
        }
        catch (Exception exc) {
            exc.printStackTrace();
        }
    }
}
