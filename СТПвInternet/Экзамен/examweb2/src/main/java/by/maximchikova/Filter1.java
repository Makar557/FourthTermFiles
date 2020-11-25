package by.maximchikova;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import java.io.IOException;
import java.util.Date;

@WebFilter(filterName = "Filter1", urlPatterns = "/Servlet")
public class Filter1 implements Filter {
    public void destroy() {
    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        req.getServletContext().log("LOGGGGGGG");
        req.getServletContext().log(new Date().toString());
        req.getServletContext().log(req.getRemoteAddr());
        chain.doFilter(req, resp);
    }

    public void init(FilterConfig config) throws ServletException {

    }

}
