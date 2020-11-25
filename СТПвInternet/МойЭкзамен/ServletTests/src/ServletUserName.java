import ForUser.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/ServletUserName")
public class ServletUserName extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.getWriter().write("hello. 1st servlet!");

        resp.sendRedirect("/Test1.jsp");

        //String nameF = req.getParameter("NameF");
//        PrintWriter  pw = resp.getWriter();
//
//        pw.write("<html>");
//        pw.write("<h1> name: " +  nameF + " </h1>");
//        pw.write("</html>");


//        ForUser.User user1=new ForUser.User("Liza", 19);
//        req.setAttribute("MyUser", user1);
        //req.getRequestDispatcher("/Test1.jsp").forward(req, resp);


//        HttpSession session = req.getSession();
//        User u = (User) session.getAttribute("user");
//
//        String name  = req.getParameter("name");
//        int age = Integer.parseInt(req.getParameter("age"));
//
//        if(u == null)
//        {
//            u = new User("Lii", 19) ;
//
//        }
//        session.setAttribute("user", u);
//        getServletContext().getRequestDispatcher("/Test1.jsp").forward(req, resp);

//        PrintWriter pw = resp.getWriter();
//        pw.write("<html>");
//        pw.write("<h1>" +  u + " </h1>");
//        pw.write("</html>");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }
}
