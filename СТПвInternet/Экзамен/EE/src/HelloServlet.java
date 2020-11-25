import java.io.File;
import java.io.FileWriter;
import java.io.PrintWriter;
import java.io.IOException;
import java.util.Date;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/hello")
public class HelloServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");
        Date date = new Date();
        Logger log = Logger.getLogger(HelloServlet.class.getName());
        // Вывод текущей даты и времени с использованием toString()
        String login = request.getParameter("login");
        if(login.equals("Admin")){
            HttpSession session = request.getSession();
            PrintWriter writer = response.getWriter();
            writer.println("<p>Admin</p>");
            writer.println("<p>"+session.getId()+"</p>");
            writer.println("<p>"+date.toString()+"</p>");
            writer.println("<a href=\"index.jsp\">Text</a>");
            writer.close();
            log.info("<p>Admin</p>");
            log.info("<p>"+session.getId()+"</p>");
            log.info("<p>"+date.toString()+"</p>");
            session.setMaxInactiveInterval(60);   // 1 день
            session.setMaxInactiveInterval(-1);
        }
        else if(login.equals("User")){
            HttpSession session = request.getSession();
            PrintWriter writer = response.getWriter();
            writer.println("<p>User</p>");
            writer.println("<p>"+session.getId()+"</p>");
            writer.println("<p>"+date.toString()+"</p>");
            writer.println("<a href=\"index.jsp\">Text</a>");
            writer.close();
            session.setMaxInactiveInterval(30);
            session.setMaxInactiveInterval(-1);
            log.info("<p>User</p>");
            log.info("<p>"+session.getId()+"</p>");
            log.info("<p>"+date.toString()+"</p>");

        }
        else{
            PrintWriter writer = response.getWriter();
            writer.println("<p>error</p>");
            writer.println("<p>"+login+"</p>");
            writer.close();
        }

        /*int id =0;
        request.setAttribute("id", id++);
        getServletContext().getRequestDispatcher("/servlet2").forward(request,response);*/
        /*try {
            writer.println("<p>Name: " + request.getAttribute("id") + "</p>");

        } finally {
            writer.close();
        }*/


    }
}
