package model;

import db.DBConnector;
import dto.UserDetailsDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Fetches profile details for a user
 * 
 * @author Nitin
 */
public class ProfileDetails {

    public UserDetailsDTO getUserDetails(String email) {
        UserDetailsDTO user = null;

        try (Connection con = DBConnector.getConnection()) {
            String query = "SELECT username, blood_group, city, email FROM userregisteration WHERE email = ?";
            PreparedStatement pst = con.prepareStatement(query);
            pst.setString(1, email);
            ResultSet rs = pst.executeQuery();

            if (rs.next()) {
                user = new UserDetailsDTO();
                user.setUsername(rs.getString("username"));
                user.setBloodGroup(rs.getString("blood_group"));
                user.setCity(rs.getString("city"));
                user.setEmail(rs.getString("email"));
            }

        } catch (SQLException e) {
            System.out.println("Error fetching user details: " + e.getMessage());
        }

        return user;
    }
}
