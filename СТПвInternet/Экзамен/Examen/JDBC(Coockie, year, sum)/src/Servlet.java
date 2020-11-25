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
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter printWriter = response.getWriter();
        String year = request.getParameter("year");
        String sum = request.getParameter("sum");

        Cookie cookie;// = new Cookie(sum + year, resultSet.getInt(1) + " " + resultSet.getInt(2));
        //cookie.setMaxAge(60 * 60);
        //response.addCookie(cookie);

        Integer commonSum = 0;
        Integer i = 0;
        try {
            Class.forName("org.sqlite.JDBC");
            Connection connection = DriverManager.getConnection("jdbc:sqlite:D:/2 курс, 4 семестр/java/Экзамен/Examen/JDBC(Coockie, year, sum)/MyBase");
            Statement statement = connection.createStatement();
            printWriter.println("<html>");
            ResultSet resultSet = statement.executeQuery("Select sum, year from myTable");
            while (resultSet.next()){
                if(resultSet.getInt(1) > Integer.parseInt(sum) && resultSet.getInt(2) == Integer.parseInt(year)){
                    commonSum += resultSet.getInt(1);

                    cookie = new Cookie("cookie" + (++i), Integer.toString(resultSet.getInt(1)));
                    cookie.setMaxAge(60 * 60);
                    response.addCookie(cookie);

                    printWriter.println("<table>");
                    printWriter.println("<tr>");
                    printWriter.println("<td>" + resultSet.getInt(1) + "</td>");
                    printWriter.println("<td>" + resultSet.getInt(2) + "</td>");
                    printWriter.println("</tr>");
                    printWriter.println("</table>");

                }
            }
           // if(commonSum > 0){
           //     printWriter.println("<h1>commonSum: " + commonSum + "</h1>");
          //  }
          //  else{
                response.sendRedirect("newPage.jsp");
          //  }
            printWriter.println("</html>");
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

    }
}
