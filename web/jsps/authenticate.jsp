<%@ page import="java.sql.Connection" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%--
  Created by IntelliJ IDEA.
  User: pressos
  Date: 29/9/2017
  Time: 2:57 μμ
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" errorPage="error.jsp"  %>

<%!
    Connection con;

    private boolean isValidUser(String userName, String password){
        try{
            String sql = "SELECT * FROM users WHERE user_name = ? and password = ?";
            PreparedStatement pstmt = con.prepareStatement(sql);
            pstmt.setString(1,userName);
            pstmt.setString(2,password);
            ResultSet rs = pstmt.executeQuery();
            return rs.next();
        }
        catch (Exception e){
            System.err.print(new Date() + " ");
            e.printStackTrace();
        }
        return false;
    }
%>

<%
    String userName = request.getParameter("userName");
    String password = request.getParameter("password");

    String driverClass = application.getInitParameter("dbDriver");
    String url = application.getInitParameter("dbURL");
    String dbUserName = application.getInitParameter("dbUserName");
    String dbPassword = application.getInitParameter("dbPassword");

    try{
        Class.forName(driverClass);
    }
    catch (Exception e){
        System.err.print(new Date());
        e.printStackTrace();
    }

    con = DriverManager.getConnection(url + "?autoReconnect=true&useSSL=false",dbUserName,dbPassword);

    application.setAttribute("connection",con);

    if(isValidUser(userName,password)){
        session.setAttribute("user",userName);
        String rurl = request.getParameter("requestUrl");
        if (rurl != null && !rurl.equals("null")){
            response.sendRedirect(rurl + ".jsp?courseName=" + request.getParameter("courseName"));
        }
        response.sendRedirect("courses.jsp");
    }
    else{
        response.sendRedirect("error.jsp");
    }
%>