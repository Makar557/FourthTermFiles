<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 18.06.2020
  Time: 21:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Summer and Time</title>
</head>
<body>
<form action="/ServletSummerAndTime" method="post">
    <p>Is summer now?</p>
    <input type="submit" value="Da" name="sumYes">
    <input type="submit" value="Net" name="sumNo">
    <p>Is time now?</p>
    <input type="submit" value="Da" name="timeYes">
    <input type="submit" value="Net" name="timeNo">
    <br/>

    <input type="submit" value="submit" name="submit">
</form>
</body>
</html>
