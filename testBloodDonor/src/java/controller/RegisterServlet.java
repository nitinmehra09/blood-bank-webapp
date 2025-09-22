package controller;

import db.DBConnector;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Nitin Mehra
 */
public class RegisterServlet extends HttpServlet 
{
@Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("name");
        String passcode = req.getParameter("password");
        String email = req.getParameter("email");
        String blood_group = req.getParameter("bloodGroup");
        String city = req.getParameter("city");

        try {
            Connection con = DBConnector.getConnection();
            PreparedStatement pst = con.prepareStatement(
                "INSERT INTO userregisteration(username, passcode, email, blood_group, city) VALUES (?, ?, ?, ?, ?)"
            );
            pst.setString(1,username);
            pst.setString(2,passcode);
            pst.setString(3,email);
            pst.setString(4,blood_group);
            pst.setString(5,city);
            pst.executeUpdate();
            
            HttpSession session = req.getSession(true);
            session.setAttribute("email", email);
            session.setAttribute("name", username);
            session.setAttribute("bloodGroup", blood_group);
            session.setAttribute("city", city);
            
            resp.sendRedirect("login.jsp"); 

        } catch (SQLException e) {
            resp.sendRedirect("register.jsp?error=1"); // Redirect on error
        }
    }
 
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("login.jsp").forward(req, resp);
    }
    
}
