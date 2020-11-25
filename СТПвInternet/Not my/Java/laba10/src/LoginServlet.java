import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.Date;

@WebServlet("/sign")
public class LoginServlet extends HttpServlet {

    public static  String url = "jdbc:mysql://localhost:3306/laba10";
    public   static  String name ="root";
    public  static  String password = "1234";
    private boolean flag = false;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException  {

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection connection = DriverManager.getConnection(url, name, password);
            Statement statement =  connection.createStatement();
            ResultSet resultSet = statement.executeQuery("SELECT * FROM laba10.login_tools");

            response.setContentType("text/html");
            PrintWriter writer = response.getWriter();
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            while (resultSet.next())
            {
                if (resultSet.getString(1).equals(username) && resultSet.getString(2).equals(password))
                {
                    flag = true;
                }
                else flag = false;
            }

            if (!username.isEmpty() && !password.isEmpty() && flag) {
                request.setAttribute("newusername", username);
                request.setAttribute("date", new Date());
                this.getServletContext().getRequestDispatcher("/WEB-INF/MainWindow.jsp").forward(request, response);
                try
                {
                    writer.println("<p>Hello dear: " + username + "  Now time on server:  "+ new Date() +"</p>");
                }
                finally
                {
                    writer.close();
                }
            }
            else
                {
                 request.getRequestDispatcher("Register.jsp").forward(request,response);
                }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}