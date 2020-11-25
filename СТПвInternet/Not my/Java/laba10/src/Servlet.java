import java.io.PrintWriter;
import java.io.IOException;
import java.time.DateTimeException;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/hello")
public class Servlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter writer = response.getWriter();
        Cookie cookie = new Cookie("cookie_name", "COOKIE");
        response.addCookie(cookie);
        try
        {
            writer.println("<p>Time: " + new Date() + "</p>");
            writer.println("<p>Info about header of request:  "+ request.getHeaderNames().nextElement() + "</p>");
            writer.println("<form action=\"cookie\" method=\"POST\">\n" +
                    "  <input type=\"submit\" value=\"Submit\" />\n" +
                    "</form>");
        }
        finally
        {
            writer.close();
        }
    }
}