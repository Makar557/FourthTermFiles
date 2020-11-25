import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.io.PrintWriter;

@javax.servlet.annotation.WebServlet("/Servlet")
public class Servlet extends javax.servlet.http.HttpServlet {
    protected void doPost(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {

    }

    protected void doGet(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        Cookie[] cookies = request.getCookies();
        request.setAttribute("name", cookies[cookies.length - 1].getName());
        request.setAttribute("address", cookies[cookies.length - 1].getValue());

        String name = request.getParameter("name");
        String address = request.getParameter("address");

        Cookie cookie = new Cookie(name, address);
        response.addCookie(cookie);

        request.getRequestDispatcher("/newPage.jsp").forward(request, response);
    }
}
