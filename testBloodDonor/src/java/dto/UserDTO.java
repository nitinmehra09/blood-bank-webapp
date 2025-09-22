package dto;

import db.DBConnector;
//import db.DBConnector;
//import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
//import java.sql.SQLException;
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
/**
 *
 * @author Nitin Mehra
 */
public class UserDTO 
{   
    private int id;
    private String name;
    private String bloodGroup;
    private String location;
    private String contact;

    // Getters & Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public String getBloodGroup() { return bloodGroup; }
    public void setBloodGroup(String bloodGroup) { this.bloodGroup = bloodGroup; }

    public String getLocation() { return location; }
    public void setLocation(String location) { this.location = location; }

    public String getContact() { return contact; }
    public void setContact(String contact) { this.contact = contact; }

    private String username,password,email;
    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
    
    public static UserDTO getUserDetails(String email) {
        UserDTO user = null;
        try (Connection con = DBConnector.getConnection();
             PreparedStatement ps = con.prepareStatement("SELECT donorName, bloodGroup, city, email FROM userregisteration WHERE email=?")) {

            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                user = new UserDTO();
                user.setName(rs.getString("donorName"));
                user.setBloodGroup(rs.getString("bloodGroup"));
                user.setLocation(rs.getString("city"));
                user.setEmail(rs.getString("email"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }

}