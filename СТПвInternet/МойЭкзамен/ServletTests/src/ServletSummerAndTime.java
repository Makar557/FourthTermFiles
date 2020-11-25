import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/ServletSummerAndTime")
public class ServletSummerAndTime extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.sendRedirect("/SummerAndTime.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getSession();

        if(req.getParameter("sumYes") != null)
        {
            req.getSession().setAttribute("summer", true);
            System.out.println("да, лето");
            doGet(req, resp);
        } else
        if(req.getParameter("sumNo") != null)
        {
            req.getSession().setAttribute("summer", false);
            System.out.println("нет, не лето");
            doGet(req, resp);
        }
        if(req.getParameter("timeYes") != null)
        {
            req.getSession().setAttribute("time", true);
            System.out.println("да, утро");
            doGet(req, resp);
        } else
        if(req.getParameter("timeNo") != null)
        {
            req.getSession().setAttribute("time", false);
            System.out.println("нет, не утро");
            doGet(req, resp);
        }
        //---
        if(req.getParameter("submit") != null)
        {
            req.setAttribute("sumResp", req.getSession().getAttribute("summer"));
            req.setAttribute("time", req.getSession().getAttribute("time"));
            getServletContext().getRequestDispatcher("/SummerResp.jsp").forward(req, resp);

        }
    }
}
