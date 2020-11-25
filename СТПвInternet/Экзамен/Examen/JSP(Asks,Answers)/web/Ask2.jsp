<%--
  Created by IntelliJ IDEA.
  User: asus
  Date: 23.09.2018
  Time: 21:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <form action="Servlet2" method="get">
        <p>right: <input name="right" type="text" value="${right}"/></p>
        Days in year?
        <p><input name="answer" type="radio" value="yes"/> 365</p>
        <p><input name="answer" type="radio" value="no"/> 32</p>
        <input type="submit" value="Asnwer"/>
    </form>
</body>
</html>
