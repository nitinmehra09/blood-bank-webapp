/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
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
/**
 *
 * @author Nitin Mehra
 */
public class DonateBlood extends HttpServlet 
{

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String donorName = req.getParameter("donorName");
        String bloodGroup = req.getParameter("bloodGroup");
        String phone = req.getParameter("phone");
        String city = req.getParameter("city");

        try {

            Connection con = DBConnector.getConnection();
            PreparedStatement pst = con.prepareStatement(
                "INSERT INTO userregisteration(donorName, bloodGroup, phone, city) VALUES (?, ?, ?, ?)"
            );
            pst.setString(1,donorName);
            pst.setString(2,bloodGroup);
            pst.setString(3,phone);
            pst.setString(4,city);
            pst.executeUpdate();
                       
            resp.sendRedirect("bloodRequests.jsp"); 

        } catch (SQLException e) {
            resp.sendRedirect("home.jsp?error=1"); // Redirect on error
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.sendRedirect("login.jsp");
    }
    
}
