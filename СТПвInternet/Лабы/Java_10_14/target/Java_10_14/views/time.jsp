<%@ page import="java.util.Date" %><%--  Created by IntelliJ IDEA.  User: Влад Храмых  Date: 02.06.2019  Time: 0:03  To change this template use File | Settings | File Templates.--%><%@ page contentType="text/html;charset=UTF-8" language="java" %><html><head>    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">    <title>Title</title></head><body><%    out.println("<h1>" + request.getAttribute("time") + "</h1>");    out.print("<h2>"+getServletInfo()+"</h2>");%><br/><button onclick="location.href='/'">На главную</button><h1>DNS - ${name}</h1><h1>address - ${address}</h1><h1>protocol - ${p}</h1><h1>headers - ${headers}</h1></body></html>