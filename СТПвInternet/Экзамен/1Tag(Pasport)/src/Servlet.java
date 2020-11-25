import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@WebServlet("/Servlet")
public class Servlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String passport = request.getParameter("passport");


        boolean resultAdmin = passport.matches("Admin");
        boolean resultUser = passport.matches("User");
        HttpSession session = request.getSession();
        if(resultAdmin == true){
            Date date = new Date();
            int id = 0 + (int) (Math.random() * 10);
            request.setAttribute("Correct", passport);
            request.setAttribute("Date", date);
            request.setAttribute("Id", id);
        }
        else{
            request.setAttribute("Correct", "You are not register");
        }
        if(resultUser == true) {
            Date date = new Date();
            int id = 0 + (int) (Math.random() * 10);
            request.setAttribute("Correct", passport);
            request.setAttribute("Date", date);
            request.setAttribute("Id", id);
        }

        getServletContext().getRequestDispatcher("/my.jsp").forward(request, response);
    }
}
