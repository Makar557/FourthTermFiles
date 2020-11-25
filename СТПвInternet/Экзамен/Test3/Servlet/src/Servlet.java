import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;


@WebServlet("/Servlet")
public class Servlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        exec2(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        exec(request, response);
    }

    public void exec(HttpServletRequest request, HttpServletResponse response) throws IOException {
        PrintWriter writer = response.getWriter();
        response.setContentType("text/html");

        ServletContext sc = this.getServletContext();
        PrintWriter out = response.getWriter();

        out.println("<p>Access Method - " + request.getMethod() + "</p>");
        out.println("<p>Protocol - " + request.getProtocol() + "</p>");
        out.println("<p>Client name - " + request.getRemoteHost() + "<br><br> MIME - " + request.getContentType() + "</p>");
        Cookie cookie;
        cookie = new Cookie("cookie", request.getMethod() );
        cookie.setMaxAge(60 * 60);
        response.addCookie(cookie);
    }

    public void exec2(HttpServletRequest request, HttpServletResponse response) throws IOException {
        PrintWriter writer = response.getWriter();
        response.setContentType("text/html");

        ServletContext sc = this.getServletContext();


        Enumeration<String> names = request.getHeaderNames();
        while (names.hasMoreElements()) {
            String name = names.nextElement();
            String value = request.getHeader(name);

            writer.println(name + " " + value + "<br>");
        }
        Cookie cookie;
        cookie = new Cookie("cookie", request.getMethod() );
        cookie.setMaxAge(60 * 60);
        response.addCookie(cookie);
    }
}