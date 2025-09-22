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
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String patientName = req.getParameter("patientName");
        String bloodGroup = req.getParameter("bloodGroup");
        String city = req.getParameter("city");
        String contact = req.getParameter("contact");

        try {
            Connection con = DBConnector.getConnection();
            PreparedStatement pst = con.prepareStatement(
                "INSERT INTO blood_requests(requester_name, phone, blood_group, city) VALUES (?, ?, ?, ?)"
            );
            pst.setString(1, patientName);
            pst.setString(2, contact);
            pst.setString(3, bloodGroup);
            pst.setString(4, city);
            pst.executeUpdate();

            resp.sendRedirect("dashboard.jsp");  // Redirect on success

        } catch (SQLException e) {
            e.printStackTrace();
            resp.sendRedirect("requestBlood.jsp?error=1"); // Redirect on error
        }
    }
 
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("requestBlood.jsp").forward(req, resp);
    }
}
