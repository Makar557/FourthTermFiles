<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<html>
<body>
<form action="Exam" method="post">
    phone
    <input type="text" name="phone">
    email
    <input type="text" name="email">
    <button type="submit">Submit</button>
</form>

<c:if test="${errorMessage ne null}">
    <h2>${errorMessage}</h2>
</c:if>
</body>
</html>
