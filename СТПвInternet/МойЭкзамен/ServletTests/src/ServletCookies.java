import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/ServletCookies")
public class ServletCookies extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        Cookie[] cookie = req.getCookies();
        for(Cookie c : cookie)
        {
            System.out.println(c.getName());
            System.out.println(c.getValue());
            System.out.println(c.getMaxAge());
        }
        Cookie c = new Cookie("cookie2", "cookie2");
        resp.addCookie(c);



    }

}
