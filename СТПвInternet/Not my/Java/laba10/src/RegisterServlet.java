import java.io.PrintWriter;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.DateTimeException;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            response.setContentType("text/html");
            PrintWriter writer = response.getWriter();
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String retry = request.getParameter("retry");

            if (username != "" && password != "" && retry.equals(password)) {
            Class.forName("com.mysql.jdbc.Driver");
            Connection connection = DriverManager.getConnection(LoginServlet.url, LoginServlet.name, LoginServlet.password);
            Statement statement =  connection.createStatement();
            String sqlCommand = "insert into login_tools VALUES('"+username+"', '"+password+"')";
            statement.executeUpdate(sqlCommand);
            request.getRequestDispatcher("/Login.jsp").forward(request, response);
            } else {
                writer.println("Error of registration");
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}