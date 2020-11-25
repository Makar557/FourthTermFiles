import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import java.io.IOException;
import java.sql.*;
import com.mysql.jdbc.Driver;

@WebFilter(urlPatterns = { "/authentication" }, filterName = "FilterAuthent")
public class loginFilte implements Filter {

    private static String name;

    private Connection cn;
    public ResultSet makeQuary(String sql) throws SQLException {
        Statement st = null;
        ResultSet rs = null;
        try {
            st = cn.createStatement();
            rs = st.executeQuery(sql);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return rs;
    }


    public void destroy() {
    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        boolean isOk = false;

        //File file = new File("notes3.txt");

        //BufferedReader br = new BufferedReader(new FileReader(file));
        try {
            DriverManager.registerDriver(new Driver());
            String url = "jdbc:mysql://localhost:3306/mysql"+
                    "?verifyServerCertificate=false"+
                    "&useSSL=false"+
                    "&requireSSL=false"+
                    "&useLegacyDatetimeCode=false"+
                    "&amp"+
                    "&serverTimezone=UTC"+
                    "&allowPublicKeyRetrieval=true";

            try {
                cn = DriverManager.getConnection(url, "root", "12345");
            }
            catch (Exception ex)
            {
                resp.getWriter().println(ex.getMessage());
            }
            ResultSet resS = makeQuary("SELECT * FROM users");
            User us = new User();
            us.setName(req.getParameter("name"));

            while (resS.next()) {
                User type = new User();

                type.setName(resS.getString(2));

                type.setUserDate(resS.getDate(3));

                if(type.getName().equals(us.getName()))
                {
                    if(type.getUserDate().getYear() >= 100)
                    {
                        isOk=true;
                    }
                    else
                    {

                        req.getRequestDispatcher("welcome1.jsp").forward(req,resp);
                    }
                    break;
                }
            }
        } catch (SQLException e) {
            resp.getWriter().println(e.getMessage());
            try {
                cn.close();
            } catch (SQLException ex) {
                resp.getWriter().println(ex.getMessage());
            }
        }
        catch (Exception e)
        {
            resp.getWriter().println(e.getLocalizedMessage());
        }

        if (!isOk)
        {
            resp.getWriter().println("You were wrong.........");
        }
        else {
            chain.doFilter(req, resp);
        }

    }

    public void init(FilterConfig config) throws ServletException {
        name = config.getInitParameter("name");
    }

}
