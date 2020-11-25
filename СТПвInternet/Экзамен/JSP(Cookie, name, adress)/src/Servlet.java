import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;



@javax.servlet.annotation.WebServlet("/Servlet")
public class Servlet extends javax.servlet.http.HttpServlet {
    protected void doPost(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {

    }

    protected void doGet(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        String result = "";
        String sessionId ="";
        long sessionTime;
        String error = "";


        HttpSession session = request.getSession();
        sessionId = session.getId();
        sessionTime = session.getCreationTime();

        String login = request.getParameter("login");
        String password = request.getParameter("password");

        System.out.println(login + password);

        if(login.equals("admin") && password.equals("admin")){
            result = "Вы админ";
            request.setAttribute("result", result);
            request.setAttribute("time", sessionTime);
            request.setAttribute("id", sessionId);
            session.setMaxInactiveInterval(6000);

            try(FileWriter writer = new FileWriter("text.txt", false)){
                writer.write(result);
            }

            request.getRequestDispatcher("/newPage.jsp").forward(request, response);

        } else if(login.equals("user") && password.equals("user")){
            result = "Вы пользователь";
            request.setAttribute("result", result);
            request.setAttribute("id", sessionId);
            request.setAttribute("time", sessionTime);

            try(FileWriter writer = new FileWriter("G:/Examen/JSP(Cookie, name, adress)/text.txt", false)){
                writer.write(result);
            }

            session.setMaxInactiveInterval(3000);
            request.getRequestDispatcher("/newPage.jsp").forward(request, response);
        } else{
            error = "Введите корректные данные";
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("/index.jsp");
            requestDispatcher.forward(request,response);
        }


    }
}


