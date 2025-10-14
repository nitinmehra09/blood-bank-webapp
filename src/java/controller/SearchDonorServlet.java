//package controller;
//
//import db.DBConnector;
//import dto.UserDTOSearch;
//
//import javax.servlet.ServletException;
//import javax.servlet.http.*;
//import java.io.IOException;
//import java.sql.*;
//import java.util.ArrayList;
//import java.util.List;
//
//public class SearchDonorServlet extends HttpServlet {
//    @Override
//    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
//            throws ServletException, IOException {
//
//        String bloodGroup = req.getParameter("bloodGroup");
//        String city = req.getParameter("location");
//
//        List<UserDTOSearch> donors = new ArrayList<>();
//
//        try (Connection con = DBConnector.getConnection();
//             PreparedStatement pst = con.prepareStatement(
//                 "SELECT username, blood_group, city, email " +
//                 "FROM userregisteration WHERE blood_group=? AND city=?"
//             )) {
//
//            pst.setString(1, bloodGroup);
//            pst.setString(2, city);
//
//            ResultSet rs = pst.executeQuery();
//            while (rs.next()) {
//                UserDTOSearch donor = new UserDTOSearch(
//                        rs.getString("username"),
//                        rs.getString("blood_group"),
//                        rs.getString("city"),
//                        rs.getString("email")   // assuming email is used as contact
//                );
//                donors.add(donor);
//            }
//
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }
//
//        // Store results in request scope
//        req.setAttribute("donors", donors);
//
//        // Forward back to JSP
//        req.getRequestDispatcher("searchDonors.jsp").forward(req, resp);
//    }
//}
//
package controller;

import db.DBConnector;
import dto.UserDTOSearch;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/SearchDonorServlet")   // ✅ URL mapping
public class SearchDonorServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String bloodGroup = req.getParameter("bloodGroup");
        String city = req.getParameter("city"); // ✅ matches JSP

        List<UserDTOSearch> donors = new ArrayList<>();

        try (Connection con = DBConnector.getConnection();
             PreparedStatement pst = con.prepareStatement(
                 "SELECT donorName, bloodGroup, city, phone " +
                 "FROM donors WHERE bloodGroup=? AND city=?"
             )) {

            pst.setString(1, bloodGroup);
            pst.setString(2, city);

            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                UserDTOSearch donor = new UserDTOSearch(
                        rs.getString("donorName"),
                        rs.getString("bloodGroup"),
                        rs.getString("city"),
                        rs.getString("phone")
                );
                donors.add(donor);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        req.setAttribute("donors", donors);
        req.getRequestDispatcher("searchDonors.jsp").forward(req, resp);
    }
}
