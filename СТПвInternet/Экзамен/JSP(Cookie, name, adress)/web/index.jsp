<%--
  Created by IntelliJ IDEA.
  User: asus
  Date: 24.09.2018
  Time: 10:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>$Title$</title>
  </head>
  <body>
    <form action="Servlet" method="get">
      <input type="text" placeholder="name" name="login" value="${login}"/>
      <input type="text" placeholder="password" name="password" value="${password}"/>
      <input type="submit"/>
    </form>
  </body>
</html>
