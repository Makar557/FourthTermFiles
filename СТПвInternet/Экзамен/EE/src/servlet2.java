import java.io.PrintWriter;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/servlet2")
public class servlet2 extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");

        int id = (int)request.getAttribute("id");
        id++;
        /*request.setAttribute("id", id++);
        getServletContext().getRequestDispatcher("/Hello").forward(request,response);*/
        PrintWriter writer = response.getWriter();
        writer.println("<p>Name: " + id + "</p>");
        writer.close();
    }
}