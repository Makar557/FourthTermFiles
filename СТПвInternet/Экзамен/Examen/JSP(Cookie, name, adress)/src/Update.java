import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/Update")
public class Update extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Cookie[] cookies = request.getCookies();
        request.setAttribute("name", cookies[cookies.length - 1].getName());
        request.setAttribute("address", cookies[cookies.length - 1].getValue());

        String name = request.getParameter("name");
        String address = request.getParameter("address");

        Cookie cookie = new Cookie(name, address);
        response.addCookie(cookie);

        request.getRequestDispatcher("/index.jsp").forward(request, response);
    }
}
