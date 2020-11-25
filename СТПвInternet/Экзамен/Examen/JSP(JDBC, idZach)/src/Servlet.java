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
        String id = request.getParameter("id");

        PrintWriter printWriter = response.getWriter();
        try {
            Class.forName("org.sqlite.JDBC");
            Connection connection = DriverManager.getConnection("jdbc:sqlite:D:/University/Java/Examen/JSP(JDBC, idZach)/Olya");
            Statement statement = connection.createStatement();

            boolean isTrue = false;
            ResultSet resultSet = statement.executeQuery("select id, name, surname from Users");
            while (resultSet.next()){
                if(Integer.parseInt(id) == resultSet.getInt(1)){
                    isTrue = true;
                    request.setAttribute("name", resultSet.getString(2));
                    request.setAttribute("surname", resultSet.getString(3));
                    request.getRequestDispatcher("/Person.jsp").forward(request, response);
                }
            }

            if(!isTrue){
                response.sendRedirect("/Error.jsp");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
}
