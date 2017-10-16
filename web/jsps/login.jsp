<%--
  Created by IntelliJ IDEA.
  User: pressos
  Date: 29/9/2017
  Time: 12:26 μμ
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" errorPage="error.jsp" %>
<html>
<head>
    <title>Login Page</title>
</head>
<body>
<header>
    <%@include file="header.jsp"%>
</header>
<article>
    <h1 class="page-header">Login Form</h1>
    <form class="form-horizontal" action="authenticate.jsp" name="loginForm" method="post" >
        <input type="hidden" name="requestUrl" value="<%=request.getParameter("requestUrl")%>">
        <input type="hidden" name="courseName" value="<%=request.getParameter("courseName")%>">
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
                <input type="submit" value="Login" class="btn btn-primary" name="btnLogin">
            </div>
        </div>
    </form>
</article>
<footer>
    <%@include file="footer.jsp"%>
</footer>
</body>
</html>
