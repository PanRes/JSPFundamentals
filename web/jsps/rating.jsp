<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: pressos
  Date: 3/10/2017
  Time: 1:07 μμ
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.io.*" session="true" %>
<%@ page import="java.util.*" session="true" %>
<%@ page import="java.sql.*" session="true" %>
<%@ page import="com.mysql.jdbc.Driver" session="true" %>

<sql:setDataSource var="courses" driver="com.mysql.jdbc.Driver"
                   url="jdbc:mysql://localhost:3306/test_db"
                   user="root"  password="root" />

<sql:update dataSource="${courses}" var="rows">
    insert into ratings(course_name,user_name,rating) values(?,?,?)
    <sql:param value="${param.courseName}"/>
    <sql:param value="${sessionScope.user}"/>
    <sql:param value="${param.rating}"/>
</sql:update>

<jsp:forward page="findCourse.jsp">
    <jsp:param name="courseName" value="${param.courseName}"/>
</jsp:forward>