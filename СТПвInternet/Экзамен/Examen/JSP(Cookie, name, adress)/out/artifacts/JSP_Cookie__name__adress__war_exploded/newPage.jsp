<%--
  Created by IntelliJ IDEA.
  User: asus
  Date: 24.09.2018
  Time: 13:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <form action="Update" method="get">
        <input type="text" placeholder="name" name="name" value="${name}"/>
        <input type="text" placeholder="address" name="address" value="${address}"/>
        <input type="submit"/>
    </form>
</body>
</html>
