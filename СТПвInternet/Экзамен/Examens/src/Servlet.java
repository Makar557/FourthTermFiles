import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

@WebServlet("/Servlet")
public class Servlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter printWriter = response.getWriter();
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/exam?useSSL=false","root", "");
            Statement statement = connection.createStatement();
            printWriter.println("<html>");
            ResultSet resultSet = statement.executeQuery("Select names, phone from examen");
            printWriter.println("<table border=2>");
            printWriter.println("<tr>" + "<th>NAME</th>" + "<th>PHONE</th>" + "</tr>");
            while (resultSet.next()){
                    printWriter.println("<tr>" + "<th>"+resultSet.getString(1) + "</th>");
                    printWriter.println("<th>" + resultSet.getString(2) + "</th>" + "</tr>");
            }
            printWriter.println("</table>");
            printWriter.println("</html>");
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
}
