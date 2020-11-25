import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

@WebServlet("/Servlet2")
public class Servlet2 extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter printWriter = response.getWriter();
        String userId = request.getParameter("txbId");

        Connection connection = null;
        Statement statement = null;

        try {
            Class.forName("org.sqlite.JDBC");
            connection = DriverManager.getConnection("jdbc:sqlite:D:/University/Java/Examen/JDBC(Students, List)/MyBase");
            statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery("select * from Users" );

            boolean flagUser = false;

            printWriter.println("<html>");
            while (resultSet.next()){
                if(Integer.parseInt(userId) == (resultSet.getInt("id"))){
                    flagUser = true;
                    printWriter.println(resultSet.getString("name") + " " + resultSet.getString("age"));
                }
            }

            if(!flagUser){
                printWriter.println("So user not found");
            }

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
