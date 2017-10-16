<%@ page import="java.util.Calendar" %><%--
  Created by IntelliJ IDEA.
  User: pressos
  Date: 28/9/2017
  Time: 5:34 μμ
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" errorPage="error.jsp" %>
<html>
    <head>
        <title>LearnToday-Way To Success</title>
    </head>
    <body>
        <div class="container">
            <header>
                <%@include file="header.jsp"%>
            </header>
            <article>
                <div class="jumbotron">
                    <div class="row">
                            <h1 class="text-center">Enter to Learn and Exit to Earn</h1>
                    </div>
                    <div class="row">
                        <center>
                            <form class="form-inline" action="/jsps/findCourse.jsp">
                                <div class="form-group">
                                    <label class="control-label">Search Course</label>
                                    <input type="search" class="form-control" name="courseName" placeholder="Enter Course Title"/>
                                    <input type="Submit" class="btn btn-primar" value="Search">
                                </div>
                            </form>
                        </center>
                    </div>
                    <p class="text-center"><a href="/jsps/courses.jsp" class="btn btn-lg btn-success">View All Courses</a> </p>
                </div>
                <div class="row">
                    <p>New Users : <a href="/jsps/register.jsp" >Register Here</a> </p>
                </div>
                <div class="row">
                    <p>Existing Users : <a href="/jsps/login.jsp">Login Here</a> </p>
                </div>
            </article>
            <footer>
                <%@include file="footer.jsp"%>
            </footer>
        </div>
    </body>
</html>
