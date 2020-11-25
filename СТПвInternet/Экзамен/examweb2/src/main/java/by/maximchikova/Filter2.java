package by.maximchikova;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.Date;

@WebFilter(filterName = "Filter2", urlPatterns = "/Servlet")
public class Filter2 implements Filter {
    public void destroy() {
    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        if(req.getParameter("email").isEmpty() && req.getParameter("phone").isEmpty()) {
            req.setAttribute("message", "error");
            resp.getWriter().println("Error");
        }
        else {
            req.getRequestDispatcher("/page.jsp").forward(req, resp);
        }
        chain.doFilter(req, resp);
    }

    public void init(FilterConfig config) throws ServletException {

    }

}
