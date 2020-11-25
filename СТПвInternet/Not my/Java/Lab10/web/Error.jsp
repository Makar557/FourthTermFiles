<%@ page contentType="text/html;charset=UTF-8" language="java" isErrorPage="true" %>
<html>
<head>
    <title>Error</title>
</head>
<body>
    <%@include file="Headers/IndexHeader.jsp"%>

    <h1>Oops...</h1>
    <p>Sorry, an error occurred.</p>
    <p>Here is the exception stack trace: </p>
    <pre><% exception.printStackTrace(response.getWriter()); %></pre>

    <%@include file="Footers/IndexFooter.jsp"%>
</body>
</html>
