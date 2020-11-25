import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;

@WebServlet("/Servlet2")
public class Servlet2 extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter printWriter = response.getWriter();
        String answer = request.getParameter("answer");

        Integer right = Integer.parseInt(request.getParameter("right"));

        Calendar calendar = Calendar.getInstance();



        if(answer.equals("yes")){
            right += 5;
            request.setAttribute("right", right);
            request.getRequestDispatcher("/Result.jsp").forward(request, response);
        }
        else if(answer.equals("no")){
            request.setAttribute("right", right);
            request.getRequestDispatcher("/Result.jsp").forward(request, response);
        }

    }
}
