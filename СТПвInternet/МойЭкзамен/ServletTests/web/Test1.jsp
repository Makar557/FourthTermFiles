
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>

<%@page import="ForUser.User" %>

<html>
<head>
    <title>Title</title>
</head>
<body>
    <form action="/ServletUserName" method="get">
        <input type="text" name="NameF">
        <input type="text" name="AgeF">
        <input type="submit" name="Submit">
    </form>
</body>
</html>
