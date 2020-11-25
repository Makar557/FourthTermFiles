import connection.ConnectionException;
import connection.UserDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.Arrays;

@WebServlet(value="/register")
public class RegistrationServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String login = req.getParameter("login");
        String password = req.getParameter("password");
        PrintWriter writer = resp.getWriter();
        writer.println(login);
        try {
            UserDao userDao = new UserDao();
            if (userDao.isExists(login)) {
                writer.println("This account already exists");
            } else {
                userDao.addUser(login, password);
                writer.println("Registration complete");
            }
        } catch( SQLException | ClassNotFoundException | ConnectionException ex) {
            writer.println(Arrays.toString(ex.getStackTrace()));
        }
    }
}
