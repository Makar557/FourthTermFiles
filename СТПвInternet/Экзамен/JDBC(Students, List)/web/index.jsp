<%--
  Created by IntelliJ IDEA.
  User: asus
  Date: 28.09.2018
  Time: 10:26
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
    for (Cookie cookie : cookies) {
      out.println(cookie.getValue());
      out.println("<br>");
    }
  %>
  <form action="Servlet1" method="get">
    <br>
    <input type="submit" value="GET"/>
  </form>
  <form action="Servlet1" method="post">
    <br>
    <input type="submit" value="PUT"/>
  </form>
  </body>
</html>
