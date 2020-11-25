import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import com.mysql.jdbc.Driver;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Servlet")
public class Servlet extends HttpServlet {
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

    public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PrintWriter printWriter = resp.getWriter();
        String year = req.getParameter("year");
        String sum = req.getParameter("sum");
        boolean isOk = false;
        Cookie cookie;// = new Cookie(sum + year, resultSet.getInt(1) + " " + resultSet.getInt(2));
        //cookie.setMaxAge(60 * 60);
        //response.addCookie(cookie);

        Integer commonSum = 0;
        Integer i = 0;
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

            printWriter.println("<html>");
            ResultSet resS = makeQuary("Select sum, year from mytable");

            while (resS.next()){
                if(resS.getInt(1) == Integer.parseInt(sum) && resS.getInt(2) == Integer.parseInt(year)){
                    commonSum += resS.getInt(1);

                    cookie = new Cookie("cookie" + (++i), Integer.toString(resS.getInt(1)));
                    //cookie.setMaxAge(60 * 60);
                    resp.addCookie(cookie);

                    printWriter.println("<table>");
                    printWriter.println("<tr>");
                    printWriter.println("<td>" + resS.getInt(1) + "</td>");
                    printWriter.println("<td>" + resS.getInt(2) + "</td>");
                    printWriter.println("</tr>");
                    printWriter.println("</table>");

                }
            }
            if(commonSum > 0){
                printWriter.println("<h1>commonSum: " + commonSum + "</h1>");
            }
            else{
                resp.sendRedirect("newPage.jsp");
            }
            printWriter.println("</html>");

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
    }
}
