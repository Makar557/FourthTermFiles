import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
@WebServlet("/Exam")
public class Servlet extends HttpServlet {
    public static int i = 0;
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String name = req.getParameter("name");
        String email = req.getParameter("email");
        if(!name.isEmpty() ||!email.isEmpty() || i==0){
            req.getRequestDispatcher("/hello.jsp").forward(req,resp);
            Cookie cookie;
            cookie = new Cookie("cookie", req.getMethod() );
            cookie.setMaxAge(60 * 60);
            resp.addCookie(cookie);
            i++;
            cookie.getValue();
            if (cookie.getValue() == name || i>0) {
                req.getRequestDispatcher("/hello.jsp").forward(req,resp);
            }
        }else{
            req.setAttribute("errorMessage","Provide name or mail");
            req.getRequestDispatcher("/index.jsp").forward(req,resp);
        }

    }
}
