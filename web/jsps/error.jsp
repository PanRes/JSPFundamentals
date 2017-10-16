<%--
  Created by IntelliJ IDEA.
  User: pressos
  Date: 29/9/2017
  Time: 4:20 μμ
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isErrorPage="true" %>
<html>
        <head>
            <title>Error</title>
        </head>
        <body>
            <header>
                <%@include file="header.jsp"%>
            </header>
            <article>
                <div class="alert alert-danger">
                    <%
                        String errorImage = config.getInitParameter("errorImage");
                        String errorMessage = config.getInitParameter("errorMessage");

                        out.println("<center><img src='" + errorImage + "' alt='" + errorMessage + "'/>");
                        out.println("Oops...<br>" + errorMessage + "</h2></center>");
                    %>
                   <%-- <div align="center">
                        <h1>Nigga!</h1>
                        <%%>
                        <h1><%=errorMessage%></h1>
                    </div>--%>
                </div>
            </article>
            <footer>
                <%@include file="footer.jsp"%>
            </footer>
        </body>
</html>
