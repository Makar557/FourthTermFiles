import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;

//@javax.servlet.annotation.WebServlet("/Servlet1")
@WebServlet("/Servlet1")
public class Servlet1 extends javax.servlet.http.HttpServlet {
    protected void doPost(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {

    }

    protected void doGet(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        PrintWriter printWriter = response.getWriter();
        String answer = request.getParameter("answer");

        Calendar calendar = Calendar.getInstance();

        int right = 0;

        if(answer.equals("yes")){
            if(calendar.getTime().getHours() > 12){
                request.setAttribute("right", right);
                request.getRequestDispatcher("/Ask2.jsp").forward(request, response);
            }
            else{
                right += 5;
                request.setAttribute("right", right);
                request.getRequestDispatcher("/Ask2.jsp").forward(request, response);
            }

        }
        else if(answer.equals("no")) {
            if(calendar.getTime().getHours() < 12){
                //++right;
                request.setAttribute("right", right);
                request.getRequestDispatcher("/Ask2.jsp").forward(request, response);
            }
            else{
                right += 5;
                request.setAttribute("right", right);
                request.getRequestDispatcher("/Ask2.jsp").forward(request, response);
            }

        }
    }
}
