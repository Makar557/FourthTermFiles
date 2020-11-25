import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

public class Servlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       // PrintWriter printWriter = resp.getWriter();
        Double y;
        String a = req.getParameter("a");
        String b = req.getParameter("b");
        String c = req.getParameter("c");
        String x = req.getParameter("x");
        if(a.equals("")||b.equals("")||c.equals("")||x.equals("")) {
            req.getRequestDispatcher("/error.jsp").forward(req, resp);
        }
        else {
            y=Double.parseDouble(a)+Double.parseDouble(b)*Double.parseDouble(x)+Double.parseDouble(x)*Double.parseDouble(x)*Double.parseDouble(c);
            req.setAttribute("y", y);
            req.getRequestDispatcher("/Result.jsp").forward(req, resp);
        }
    }
}