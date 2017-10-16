package gr.pr.models;

import java.io.Serializable;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class Course implements Serializable {
    private static final long serialVersionUID = 1L;
    private String courseName;
    private String facultyName;
    private String imageUrl;
    private String description;
    private int fees;
    private Rating rating;


    public Course() {
    }

    public String getCourseName() {
        return courseName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public void setCourseName(String courseName) {
        this.courseName = courseName;
    }

    public String getFacultyName() {
        return facultyName;
    }

    public void setFacultyName(String facultyName) {
        this.facultyName = facultyName;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    public int getFees() {
        return fees;
    }

    public void setFees(int fees) {
        this.fees = fees;
    }

    public int getUserRating(String userName) {
        int userRating = 0;

        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        try {
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test_db",
                    "root","root");
            Statement stmt = conn.createStatement();
            String query = "SELECT rating FROM ratings WHERE user_name = '" + userName + "' and course_name = '" +
                    this.courseName + "'";
            ResultSet rs = stmt.executeQuery(query);
            if(rs.next()){
                userRating =  rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return userRating;
    }


    public static List<Course> getCourses(){
        ArrayList<Course> courses = new ArrayList<>();

        try{
            String sql = "Select * from course";
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test_db",
                    "root","root");
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            while(rs.next()){
                Course course = new Course();
                course.setCourseName(rs.getString(2));
                course.setFacultyName(rs.getString(3));
                course.setImageUrl(rs.getString(4));
                course.setFees(rs.getInt(5));
                course.setDescription(rs.getString(6));
                courses.add(course);
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return courses;
    }
}
