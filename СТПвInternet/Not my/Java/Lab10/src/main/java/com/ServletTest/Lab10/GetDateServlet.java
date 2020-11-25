package com.ServletTest.Lab10;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

@WebServlet(name = "get_servlet_info", urlPatterns = "/get_servlet_info")
public class GetDateServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        try (PrintWriter writer = response.getWriter()) {
            Date now = new Date();
            writer.println("<html>");
            writer.println("<body>");

            writer.println("<span>");
            writer.println("Current date: ");
            writer.println(now.toString());
            writer.println("</span><br>");

            writer.println("<span>");
            writer.println("Protocol: ");
            writer.println(request.getScheme());
            writer.println("</span><br>");

            writer.println("<span>");
            writer.println("Method: ");
            writer.println(request.getMethod());
            writer.println("</span><br>");

            writer.println("<span>");
            writer.println("Headers: ");
            writer.println(request.getHeader(""));
            writer.println("</span><br>");

            writer.println("</body>");
            writer.println("</html>");
        }
    }
}
