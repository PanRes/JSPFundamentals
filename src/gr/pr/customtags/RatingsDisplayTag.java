package gr.pr.customtags;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.SimpleTagSupport;
import java.io.IOException;
import java.sql.*;

public class RatingsDisplayTag extends SimpleTagSupport {
    private String course;

    public void setCourse(String course) {
        this.course = course;
    }

    public void doTag() throws JspException,IOException{
        JspWriter out = getJspContext().getOut();
        Connection conn = null;
        String query = "SELECT COUNT(user_name) AS users, rating FROM ratings where course_name = '" + course +
                "' GROUP BY course_name";
        int userCount = 0;
        int rating = 0;
        int totalUserRating = 0;
        int totalUsers = 0;
        float courseRating = 0;
        try{
            conn = getConnection();
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(query);

            while (rs.next()){
                userCount = rs.getInt("users");
                rating = rs.getInt("rating");
                totalUserRating += userCount*rating;
                totalUsers += userCount;
            }
            if (totalUsers > 0){
                courseRating = totalUserRating/totalUsers;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        out.println(courseRating);
    }

    private Connection getConnection() throws ClassNotFoundException, SQLException {
        Connection conn = null;

        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test_db",
                    "root","root");
        } catch (ClassNotFoundException e) {
            throw e;
        } catch (SQLException e) {
            throw e;
        }

        return conn;

    }
}
