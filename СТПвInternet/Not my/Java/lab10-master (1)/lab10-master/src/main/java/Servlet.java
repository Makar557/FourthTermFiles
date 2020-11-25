import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

@WebServlet(value="/getTime")
public class Servlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter writer = response.getWriter();
        Date date = new Date();
        String info = "Protocol: " + request.getProtocol()
                + "\nRequestURI: " + request.getRequestURI()
                + "\nMethod: " + request.getMethod()
                + "\nRemoteHost: " + request.getRemoteHost()
                + "\nHeaderNames: " + request.getHeaderNames();
        writer.println(date);
        writer.print(info);
    }
}