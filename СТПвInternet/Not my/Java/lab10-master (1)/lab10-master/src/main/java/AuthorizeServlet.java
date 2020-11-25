import connection.ConnectionException;
import connection.UserDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.Arrays;

@WebServlet(value = "/login")
public class AuthorizeServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String login = req.getParameter("login");
        String password = req.getParameter("password");
        PrintWriter writer = resp.getWriter();
        try {
            UserDao userDao = new UserDao();
            if (userDao.checkFor(login, password)) {
                writer.println("Hello, " + login);
                writer.println("Set to cookies");
                writer.println("Last login: " + userDao.getLoginTimestamp(login));
                writer.println("Login number: " + userDao.getLoginNumber(login));
                resp.addCookie(new Cookie("last_login", userDao.getLoginTimestamp(login).toString()));
                resp.addCookie(new Cookie("login_number", Integer.toString(userDao.getLoginNumber(login))));
            } else {
                writer.println("Access denied");
            }
        } catch (SQLException | ClassNotFoundException | ConnectionException ex) {
            writer.println(Arrays.toString(ex.getStackTrace()));
        }
    }
}
