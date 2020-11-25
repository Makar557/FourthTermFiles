<%--
  Created by IntelliJ IDEA.
  User: fpfpf
  Date: 29.04.2020
  Time: 13:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="/WEB-INF/label.tld" prefix="l" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>

<html>
<head>
    <title>Title</title>
</head>
<body>

<c:set var="list" value="${list}"/>


<form method="post" action="/3">
    <l:mylabel  value="some text" label="some label" name="myName"/>
    <l:mybutton name="login"/>
</form>
<l:mybutton name="register"/>
<c:out value="${name}"/>
<br>
<c:forEach var="l" items="${list}">
    <c:out value="${l}"/>
</c:forEach>
</body>
</html>
