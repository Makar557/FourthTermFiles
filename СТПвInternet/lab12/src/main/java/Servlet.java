import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.LinkedList;
import java.util.List;

@WebServlet("/3")
public class Servlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Integer> objects = new LinkedList<>();
        objects.add(1);
        objects.add(2);
        objects.add(3);
        objects.add(4);
        req.setAttribute("list",objects);
        req.setAttribute("size",4);
        req.getRequestDispatcher("/task3.jsp").forward(req,resp);
    }


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String value = req.getParameter("myName");
        req.setAttribute("name",value);
        req.getRequestDispatcher("/task3.jsp").forward(req,resp);
    }
}
