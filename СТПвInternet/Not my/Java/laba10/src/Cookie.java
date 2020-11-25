import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/cookie")
public class Cookie extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        javax.servlet.http.Cookie[] cookies = request.getCookies();
        String cookieName = "cookie_name";
        javax.servlet.http.Cookie cookie = null;
        if (cookies != null) {
            for (javax.servlet.http.Cookie c : cookies) {
                if (cookieName.equals(c.getName())) {
                    cookie = c;
                    break;
                }
            }
        }
        PrintWriter out = response.getWriter();
        try {
            out.println("Name: " + cookie.getValue());
        } finally {
            out.close();
        }
    }
}

