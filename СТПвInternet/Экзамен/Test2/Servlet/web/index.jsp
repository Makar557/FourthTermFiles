<%--
  Created by IntelliJ IDEA.
  User: elis_
  Date: 28.06.2019
  Time: 15:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
  <head>
    <title>Title</title>
  </head>
  <body>
  <form action="Exam" method="post">
    name
    <input type="text" name="name">
    email
    <input type="text" name="email">
    <button type="submit">Submit</button>
  </form>

  <c:if test="${errorMessage ne null}">
    <h2>${errorMessage}</h2>
  </c:if>
  </body>
</html>
