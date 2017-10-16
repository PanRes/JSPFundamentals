<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: pressos
  Date: 29/9/2017
  Time: 12:59 μμ
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>Title</title>
    </head>
    <body>
        <%
            String userName = (String) session.getAttribute("user");
            if ( userName == null){
                response.sendRedirect("/jsps/login.jsp?requestUrl=findCourse&courseName=" +
                        request.getParameter("courseName"));
                return;
            }
        %>
        
        <jsp:useBean id="course" class="gr.pr.models.Course" scope="request" />

        <%
            String courseName = null;
            String facultyName = null;
            String courseDuration = null;
            int courseFee = 0;

            courseName = request.getParameter("courseName");
            System.out.println("courseName = " + courseName);
            Connection conn = (Connection) application.getAttribute("connection");
            String query  = "SELECT * FROM course WHERE course_name = '" + courseName + "'";
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(query);

            if(rs.next()){

        %>
        <jsp:setProperty name="course" property="courseName" value="<%=courseName%>"/>
        <jsp:setProperty name="course" property="facultyName" value="<%=rs.getString(3)%>"/>
        <jsp:setProperty name="course" property="imageUrl" value="<%=rs.getString(4)%>"/>
        <jsp:setProperty name="course" property="fees" value="<%=rs.getInt(5)%>"/>
        <jsp:setProperty name="course" property="description" value="<%=rs.getString(6)%>"/>

        <%}%>
        
        <jsp:forward page="viewCourse.jsp"/>
    
    </body>
</html>
