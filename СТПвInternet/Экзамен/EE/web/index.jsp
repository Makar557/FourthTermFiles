<%--
  Created by IntelliJ IDEA.
  User: кирилл
  Date: 23.06.2019
  Time: 23:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>User Form</title>
</head>
<body>
<form action="hello" method="POST">
    <input type="text" placeholder="login" name="login" value="${login}"/>

    <input type="submit" value="Submit" />
</form>
</body>
</html>
