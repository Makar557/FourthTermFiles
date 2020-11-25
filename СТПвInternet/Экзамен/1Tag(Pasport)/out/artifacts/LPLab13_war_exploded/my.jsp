
<%@page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="my" uri="/WEB-INF/myTags.tld" %>
<html>
<head>
    <title>Title</title>
    <form>
        <my:TagPasport myPasport="${Correct}"/>
        <my:TagPasport myPasport="${Date}"/>
        <my:TagPasport myPasport="${Id}"/>
        <a href="http://localhost:8080/">Link</a>
    </form>
</head>
<body>
</body>
</html>
