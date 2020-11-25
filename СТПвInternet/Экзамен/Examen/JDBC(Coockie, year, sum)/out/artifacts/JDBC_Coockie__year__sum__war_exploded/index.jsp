<%--
  Created by IntelliJ IDEA.
  User: asus
  Date: 23.09.2018
  Time: 14:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>$Title$</title>
  </head>
  <body>
    <%
      Cookie[] cookies = request.getCookies();
      for (Cookie cookie : cookies){
          System.out.println(cookie.getValue());
          System.out.println("<br>");
      }
    %>
    <form action="Servlet" method="get">
      <input type="text" name="year" placeholder="year"/>
      <input type="text" name="sum" placeholder="sum"/>
      <input type="submit" value="find"/>
    </form>
  </body>
</html>
