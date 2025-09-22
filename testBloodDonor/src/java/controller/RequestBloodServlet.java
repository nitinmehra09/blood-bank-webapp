//package controller;
//
//import db.DBConnector;
//import java.io.IOException;
//import java.sql.Connection;
//import java.sql.PreparedStatement;
//import java.sql.SQLException;
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//
//@WebServlet(name = "RequestBloodServlet", urlPatterns = {"/RequestBloodServlet"})
//public class RequestBloodServlet extends HttpServlet {
//
//    @Override
//    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        String patientName = req.getParameter("patientName");
//        String bloodGroup = req.getParameter("bloodGroup");
//        String city = req.getParameter("city");
//        String contact = req.getParameter("contact");
//
//        try {
//            Connection con = DBConnector.getConnection();
//            PreparedStatement pst = con.prepareStatement(
//                "INSERT INTO blood_requests(requester_name, phone, blood_group, city) VALUES (?, ?, ?, ?)"
//            );
//            pst.setString(1, patientName);
//            pst.setString(2, contact);
//            pst.setString(3, bloodGroup);
//            pst.setString(4, city);
//            pst.executeUpdate();
//
//            resp.sendRedirect("home.jsp");  
//
//        } catch (SQLException e) {
//            e.printStackTrace();
//            resp.sendRedirect("requestBlood.jsp?error=1"); 
//        }
//    }
// 
//    @Override
//    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        req.getRequestDispatcher("requestBlood.jsp").forward(req, resp);
//    }
//}


package controller;

import db.DBConnector;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "RequestBloodServlet", urlPatterns = {"/RequestBloodServlet"})
public class RequestBloodServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        // Get form parameters
        String patientName = req.getParameter("patientName");
        String bloodGroup = req.getParameter("bloodGroup");
        String city = req.getParameter("city");
        String contact = req.getParameter("contact");

        // Validate input (optional but recommended)
        if(patientName == null || bloodGroup == null || city == null || contact == null ||
           patientName.isEmpty() || bloodGroup.isEmpty() || city.isEmpty() || contact.isEmpty()) {
            resp.sendRedirect("requestBlood.jsp?error=empty");
            return;
        }

        try (Connection con = DBConnector.getConnection();
             PreparedStatement pst = con.prepareStatement(
                     "INSERT INTO blood_requests(requester_name, phone, blood_group, city) VALUES (?, ?, ?, ?)")
        ) {
            pst.setString(1, patientName);
            pst.setString(2, contact);
            pst.setString(3, bloodGroup);
            pst.setString(4, city);

            int rows = pst.executeUpdate();
            if (rows > 0) {
                // Successfully inserted → redirect to home with success message
                resp.sendRedirect("home.jsp?success=1");
            } else {
                // Failed insertion
                resp.sendRedirect("requestBlood.jsp?error=insertfail");
            }

        } catch (SQLException e) {
            e.printStackTrace();
            resp.sendRedirect("requestBlood.jsp?error=sql");
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        // Forward to request form
        req.getRequestDispatcher("requestBlood.jsp").forward(req, resp);
    }
}
