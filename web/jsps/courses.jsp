<%--
  Created by IntelliJ IDEA.
  User: pressos
  Date: 29/9/2017
  Time: 12:59 μμ
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
    <head>
        <title>All Courses</title>
    </head>
    <body>
        <header>
            <jsp:include page="header.jsp" flush="true"/>
        </header>
        <article>
            <jsp:useBean id="courseCookie" class="gr.pr.models.Course" scope="request"/>
            <div class="row">
                <c:set var="i" value="0" scope="page"/>
                <c:forEach var="course" items="${courseCookie.getCourses()}">
                    <c:set var="n" value="${i%3}"/>
                    <c:if test="${n==0}">
                        </div>
                        <div class="row">
                    </c:if>
                    <div class="col-md-4">
                        <p>
                            <img src="${course.imageUrl}" width="200" height="200" class="img-thumbnail"/>
                        </p>
                        <h3 class="text-primary">${course.courseName}</h3>
                        <p class="text-success">
                            Trainer : <strong>${course.facultyName}</strong>
                        </p>
                        <p>
                            <a href="/jsps/findCourse.jsp?courseName=${course.courseName}" class="btn btn-default">
                                View Details
                            </a>
                        </p>
                    </div>
                    <c:set var="i" value="${i+1}"/>
                </c:forEach>
            </div>
        </article>
        <footer>
            <jsp:include page="footer.jsp" flush="true"/>
        </footer>
    </body>
</html>
