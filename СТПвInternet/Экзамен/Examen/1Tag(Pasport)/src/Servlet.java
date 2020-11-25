import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@WebServlet("/Servlet")
public class Servlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //Получаем данные, которые ты ввёл в поле
        String passport = request.getParameter("passport");

        //проверяем корректность, чтобы первые две буквы были BR и потом 7 цифр
        boolean result = passport.matches("BR\\d{7}");
        if(result == true){
            request.setAttribute("Correct", passport);
        }
        else{
            request.setAttribute("Correct", "No correct");
        }

        //Переходим на my.jsp, где вызывается пользовательский тег
        //для тега свой класс, который расположены в папке Tags
        getServletContext().getRequestDispatcher("/my.jsp").forward(request, response);
    }
}
