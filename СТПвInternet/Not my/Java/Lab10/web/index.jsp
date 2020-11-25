<%@ page contentType="text/html;charset=UTF-8" language="java" errorPage="Error.jsp" %>
<html>
  <head>
    <title>Index.jsp</title>
    <style>
      span{
        margin-right: 10px;
      }
      .container{
        position: relative;
        width: 200px;
        height: 200px;
        margin: 10px;
        padding: 15px;
        -webkit-border-radius: 10px;
        -moz-border-radius: 10px;
        border-radius: 10px;
      }
      .lab11-12{
        margin-top: 50px;
        background-color: #B7D4FF;
        border: 2px solid #B7D4FF;
      }
      .lab10{
        background-color: #B5FBDD;
        border: 2px solid #B5FBDD;
      }
      .login{
        position: relative;
        top: 30%;
        left: 10%;
      }
    </style>
  </head>
  <body>
    <%@ include file="Headers/IndexHeader.jsp"%>

    <div class="container lab10">
      <h1>Lab10:</h1>
      <span>Several info via servlet: </span>
      <form method="get" action="get_servlet_info">
        <input type="submit" value="Show Info"/>
      </form>
      <%
        out.println("Code inside a JSP page");
      %>
    </div>

    <div class="container lab11-12">
      <h1>Lab 11-12:</h1>
      <form method="get" action="LoginForm.jsp">
        <input class="login" type="submit" value="Go to login"/>
      </form>
    </div>

    <%@include file="Footers/IndexFooter.jsp"%>
  </body>
</html>
