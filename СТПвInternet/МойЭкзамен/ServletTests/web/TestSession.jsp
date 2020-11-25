<%@ page import="ForUser.User" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>

<%@page import="ForUser.User" %><html>
<head>
    <title>Session</title>
</head>
<body>
<% User user = (User)session.getAttribute("user"); %>
<p> Имя: <%= user.getName()%></p>
<p> Возраст: <%= user.getAge()%></p>

</body>
</html>
