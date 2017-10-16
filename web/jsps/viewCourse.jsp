<%--
  Created by IntelliJ IDEA.
  User: pressos
  Date: 2/10/2017
  Time: 2:54 μμ
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="cs" uri="/WEB-INF/Ratings.tld" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
    <head>
        <title><jsp:getProperty name="course" property="courseName"/> </title>
    </head>
    <body>
        <header>
            <%@include file="header.jsp"%>
        </header>
        <article>
            <%
                String user = (String) session.getAttribute("user");
                String message = "Welcome " + user + "!";
            %>

            <strong><jsp:expression>message</jsp:expression></strong>
            <form name="coursefrm" action="rating.jsp">
                <jsp:useBean id="course" scope="request" class="gr.pr.models.Course"/>

                <div class="panel panel-primary">
                    <p class="panel-heading">Course Details</p>
                    <div class="panel-body">
                        <div class="media">
                            <div class="media-left">
                                <a href="#">
                                    <img src='<jsp:getProperty name="course" property="imageUrl"/>' width="300" height="300"/>
                                </a>
                            </div>
                            <div class="media-body">
                                <h4 class="media-heading">
                                    <jsp:getProperty name="course" property="courseName"/>
                                </h4>
                                <p>
                                    <strong>Trainer Name : </strong>
                                    <jsp:getProperty name="course" property="facultyName"/>
                                </p>
                                <p>
                                    <strong>Course Description</strong>
                                    <jsp:getProperty name="course" property="description"/>
                                </p>
                                <p>
                                    <strong>Course Fee : </strong>
                                    <jsp:getProperty name="course" property="fees"/>
                                </p>
                                <p>
                                    <strong>Course Ratings : </strong>
                                    <cs:rating course="${course.courseName}"/>
                                </p>
                                <%--${course.getUserRating(sessionScope.user)}--%>

                                <c:choose>
                                    <c:when test="${course.getUserRating(sessionScope.user) > 0}">
                                        <strong>Your Ratings :</strong> ${course.getUserRating(sessionScope.user)}
                                    </c:when>
                                    <c:when test="${course.getUserRating(sessionScope.user) == 0}">
                                        <strong>
                                            Enter your Rating :
                                            <select name="rating">
                                                <c:forEach var="i" begin="1" end="5">
                                                    <option value="${i}">${i}</option>
                                                </c:forEach>
                                            </select>
                                        </strong>
                                    </c:when>
                                </c:choose>
                                <%--<h4 class="media-heading">${course.courseName}</h4>--%>
                                <%--<p><strong>Trainer Name : </strong>${course.facultyName}</p>--%>
                                <%--<p><strong>Course Description : </strong>${course.description}</p>--%>
                                <%--<p><strong>Course Fees : </strong>${course.fees}</p>--%>

                            </div>
                        </div>
                        <p class="text-center">
                            <c:if test="${course.getUserRating(sessionScope.user) == 0}">
                                <input type="hidden" name="courseName" value="${course.courseName}">
                                <input type="submit" name="btnRating" value="Save Ratings"
                                       class="btn btn-lg btn-success">
                            </c:if>
                            <a href="courses.jsp" class="btn btn-lg btn-success">View All Courses</a>
                        </p>
                    </div>
                </div>
            </form>
        </article>
        <footer>
            <%@include file="footer.jsp"%>
        </footer>
    </body>
</html>
