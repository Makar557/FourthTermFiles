package com.ServletTest.Lab10;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import javax.servlet.ServletException;


@WebServlet(urlPatterns = "/test")
public class Test extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        try (PrintWriter toUser = response.getWriter()) {
            toUser.println("<html>");
            toUser.println("<body>");
            toUser.println("Hello servlet!");
            toUser.println("</body>");
            toUser.println("</html>");
        }
    }

    @Override
    public void init(ServletConfig config) throws ServletException {
        super.init(config);
        System.out.println("Server init\n");
    }

    @Override
    public void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        super.service(req, res);
        System.out.println("Processes....\n");
    }

    @Override
    public void destroy() {
        super.destroy();
        System.out.println("Server ends its work");
    }
}
