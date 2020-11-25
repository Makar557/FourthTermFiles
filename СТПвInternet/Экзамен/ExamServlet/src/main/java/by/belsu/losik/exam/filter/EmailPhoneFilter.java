package by.belsu.losik.exam.filter;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import java.io.IOException;

@WebFilter("/Exam")
public class EmailPhoneFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        String phone = servletRequest.getParameter("phone");
        String email = servletRequest.getParameter("email");
        if(!phone.isEmpty() ||!email.isEmpty()){
            servletRequest.getRequestDispatcher("/WEB-INF/pages/hello.jsp").forward(servletRequest,servletResponse);
        }else{
            servletRequest.setAttribute("errorMessage","Provide phone or mail");
            servletRequest.getRequestDispatcher("/index.jsp").forward(servletRequest,servletResponse);
        }
    }

    @Override
    public void destroy() {

    }
}
