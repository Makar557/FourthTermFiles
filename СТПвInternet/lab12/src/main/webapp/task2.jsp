<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%--
  Created by IntelliJ IDEA.
  User: fpfpf
  Date: 28.04.2020
  Time: 20:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<c:out value="1+2" /><p>
<c:out value="${1+2}" /><p>
<c:set var="user" scope="session" value="Sergey" />

<c:if test="${user eq 'Sergey'}">
    <c:out value="${user}" />
</c:if><p>

    <c:catch var ="exception">
            <% int x = 5/0;%>
    </c:catch>

    <c:if test = "${exception != null}">
<p>Возникло исключение : ${exception} <br />
    Сообщение : ${exception.message}</p>
</c:if>
<p>

<h2>Format Tag example</h2>
<c:set var="number" value="99.40" />
<fmt:parseNumber var="n" integerOnly="true" type="number" value="${number}" />
Parse Number is :: <c:out value="${n}" /> <br>
<c:set var="date" value="02-04-2018" />
<fmt:parseDate value="${date}" var="pd"  pattern="dd-MM-yyyy" />
Parse Date is :: <c:out value="${pd}" />
<br>
<c:set var="Date" value="<%=new java.util.Date()%>" />
Format Date is :: <fmt:formatDate type="time" value="${Date}"/>

<sql:setDataSource var="db" driver="com.mysql.cj.jdbc.Driver"
                   url="jdbc:mysql://localhost:3306/final_project?serverTimezone=UTC&useSSL=false"
                   user="root"  password="18051965q"/>

<sql:query dataSource="${db}" var="rs">
    SELECT * from users;
</sql:query>

<table border="2" width="100%">
    <tr>
        <th>id</th>
        <th>name</th>
        <th>password</th>

    </tr>
    <c:forEach var="table" items="${rs.rows}">
        <tr>
            <td><c:out value="${table.id}"/></td>
            <td><c:out value="${table.name}"/></td>
            <td><c:out value="${table.password}"/></td>
        </tr>
    </c:forEach>

    <c:set var="String" value="Welcome to javatpoint"/>

    <c:if test="${fn:contains(String, 'javatpoint')}">
    <p>Found javatpoint string<p>
    </c:if>

    <c:if test="${fn:contains(String, 'JAVATPOINT')}">
    <p>Found JAVATPOINT string<p>
    </c:if>
</table>
</body>
</html>
