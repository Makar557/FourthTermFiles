import com.sun.corba.se.spi.protocol.RequestDispatcherRegistry;
import com.sun.xml.internal.ws.api.policy.PolicyResolver;
import sun.rmi.server.Dispatcher;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
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
        String year = request.getParameter("year");
        String sum = request.getParameter("sum");
        Integer commonSum = 0;
        try {
            Class.forName("org.sqlite.JDBC");
            Connection connection = DriverManager.getConnection("jdbc:sqlite:D:/University/Java/Examen/JDBC(table, year, sum)/MyBase");
            Statement statement = connection.createStatement();
            printWriter.println("<html>");
            ResultSet resultSet = statement.executeQuery("Select sum, year from myTable");
            while (resultSet.next()){
                if(resultSet.getInt(1) > Integer.parseInt(sum) && resultSet.getInt(2) == Integer.parseInt(year)){
                    commonSum += resultSet.getInt(1);

                    printWriter.println("<table border=2>");
                    printWriter.println("<tr>");
                    printWriter.println("<td>" + resultSet.getInt(1) + "</td>");
                    printWriter.println("<td>" + resultSet.getInt(2) + "</td>");
                    printWriter.println("</tr>");
                    printWriter.println("</table>");

                }
            }
            if(commonSum > 0){
                printWriter.println("<h1>commonSum: " + commonSum + "</h1>");
            }
            else{
                response.sendRedirect("newPage.jsp");
            }
            printWriter.println("</html>");
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }


        //getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
    }
}
