
package model;

import db.DBConnector;
import dto.UserDTO;
import java.sql.Connection;
import java.sql.Statement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Nitin Mehra
 */
public class LoginAuthenticator 
{
    public boolean isLogin(UserDTO user)
    {
        String email = user.getEmail();
        String password = user.getPassword();
        String tablePassword="";
        try
        {
            String query = "SELECT passcode FROM userregisteration WHERE email='"+email+"'";
            Connection con = DBConnector.getConnection();
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(query);
            if(rs.next())
            {
                tablePassword = rs.getString("passcode");
            }
            else
            {
                return false;
            }
        }
        catch(SQLException e)
        {
            System.out.println(e);
        }
        if(password!=null && password.equals(tablePassword))
        {
            return true;
        }
        return false;
    }

    public UserDTO getUserDetails(String email) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
}