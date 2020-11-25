import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

@WebServlet("/Servlet1")
public class Servlet1 extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter printWriter = response.getWriter();

        Connection connection = null;
        Statement statement = null;

        try {
            Class.forName("org.sqlite.JDBC");
            connection = DriverManager.getConnection("jdbc:sqlite:D:/University/Java/Examen/JDBC(Students, List)/MyBase");
            statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery("select * from Users" );

            printWriter.println("<html>");
            printWriter.println("<table border=2>");
            while (resultSet.next()){
                printWriter.println("<tr>");
                printWriter.println("<td>" + resultSet.getInt("id") + "</td>");
                printWriter.println("<td>" + resultSet.getString("name") + "</td>");
                printWriter.println("<td>" + resultSet.getString("age") + "</td>");
                printWriter.println("</tr>");
            }
            printWriter.println("</table>");

            printWriter.println("<bt>");

            printWriter.println("<form action=Servlet2 method=get>");
            printWriter.println("<input type=text name=\"txbId\" placeholder=\"enter the id\"/>");
            printWriter.println("<input type=submit value=click>");
            printWriter.println("</form>");

            printWriter.println("</html>");



        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } finally {
            if(connection != null){
                try {
                    connection.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if(statement != null){
                try {
                    statement.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}
