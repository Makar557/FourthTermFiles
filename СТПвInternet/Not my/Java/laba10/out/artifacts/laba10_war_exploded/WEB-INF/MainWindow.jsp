<%--
  Created by IntelliJ IDEA.
  User: Valentin
  Date: 28.05.2019
  Time: 21:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
Hello <%out.println(request.getAttribute("newusername").toString());%> time on server <%out.println(request.getAttribute("date").toString());%>
</body>
</html>
