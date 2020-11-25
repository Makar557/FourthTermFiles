<%@ page contentType="text/html;charset=UTF-8" language="java" errorPage="Error.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
    <head>
        <title>Login</title>
        <style>
            section{
                position: relative;
                left: 35%;
                height: 250px;
                width: 30%;
                margin-bottom: 10px;

                -webkit-border-radius: 3px;
                -moz-border-radius: 3px;
                border-radius: 3px;
                background-color: #C9FFBF;
            }
            span{
                font-size: 18px;
            }
            .login-header{
                padding-top: 20px;
                display: block;
                text-align: center;
                font-size: 20px;
            }
            .input-div{
                margin-top: 10px;
                text-align: center;
            }
            .btn{
                margin-top: 20px;
                position: relative;
            }
            .login-btn{
                width: 10%;
                left: 45%;
            }
            .register-btn{
                margin-top: 0;
                width: 16%;
                left: 42%;
            }
            .error-message{
                color: red;
                font-weight: bold;
                font-size: 18px;
                display: block;
                text-align: center;

                padding: 10px;
            }
        </style>
    </head>
    <body>
        <%@include file="Headers/IndexHeader.jsp"%>

        <section>
            <span class="login-header">Log in</span>

            <c:if test="${not empty errorMessage}">
                <span class="error-message">${errorMessage}</span>
            </c:if>

            <form method="post" action="login">

                <div class="input-div">
                    <span>Username:</span>
                    <input type="text" name="username"/>
                </div>

                <div class="input-div">
                    <span>Password:</span>
                    <input type="password" name="password"/>
                </div>

                <input class="btn login-btn" type="submit" value="Login"/>
            </form>

            <form method="get" action="RegisterForm.jsp">
                <input class="btn register-btn" type="submit" value="Register"/>
            </form>
        </section>

        <%@include file="Footers/IndexFooter.jsp"%>
    </body>
</html>
