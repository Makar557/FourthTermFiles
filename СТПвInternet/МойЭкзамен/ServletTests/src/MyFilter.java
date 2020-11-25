import javax.servlet.*;
import java.io.IOException;

public class MyFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        servletResponse.getWriter().write("before   ");
        filterChain.doFilter(servletRequest, servletResponse);
        servletResponse.getWriter().write("   after");
    }

    @Override
    public void destroy() {

    }
}
