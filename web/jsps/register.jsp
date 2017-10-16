<%--
  Created by IntelliJ IDEA.
  User: pressos
  Date: 29/9/2017
  Time: 12:26 μμ
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"  errorPage="error.jsp"%>
<html>
    <head>
        <title>Registration Form</title>
    </head>
    <body>
        <header>
            <%@include file="header.jsp"%>
        </header>
        <article>
            <h1 class="page-header">Registration Form</h1>

            <form class="form-horizontal" action="registerUser.jsp" name="registrationForm" method="post">
                <div class="form-group">
                    <label class="col-md-4">User Name : </label>
                    <div class="col-md-4">
                        <input type="text" name="userName" class="form-control" required="required"/>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-md-4">User Name : </label>
                    <div class="col-md-4">
                        <input type="password" name="password" class="form-control" required="required"/>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-md-4 col-md-offset-2">
                        <input type="submit" value="Register" class="btn btn-primary" name="btnRegister">
                    </div>
                </div>
            </form>
        </article>
        <footer>
            <%@include file="footer.jsp"%>
        </footer>
    </body>
</html>
