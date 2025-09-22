<%-- 
    Document   : bloodRequests
    Created on : 19 Sept 2025
    Author     : Nitin Mehra
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="db.DBConnector" %>
<!DOCTYPE html>
<html>
<head>
    <title>Blood Requests</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="assets/css/style.css">
</head>
<body>
    <div class="container mt-5">
        <h3 class="text-center text-danger-custom mb-4">Open Blood Requests</h3>
        <table class="table table-bordered table-hover">
            <thead class="table-danger">
                <tr>
                    <th>Patient Name</th>
                    <th>Blood Group</th>
                    <th>City</th>
                    <th>Contact</th>
                </tr>
            </thead>
            <tbody>
            <%
                try (
                    Connection con = DBConnector.getConnection();
                    PreparedStatement pst = con.prepareStatement("SELECT requester_name, blood_group, city, phone FROM blood_requests");
                    ResultSet rs = pst.executeQuery()
                ) {
                    boolean hasData = false;
                    while (rs.next()) {
                        hasData = true;
            %>
                        <tr>
                            <td><%= rs.getString("requester_name") %></td>
                            <td><%= rs.getString("blood_group") %></td>
                            <td><%= rs.getString("city") %></td>
                            <td><%= rs.getString("phone") %></td>
                        </tr>
            <%
                    }
                    if (!hasData) {
            %>
                        <tr>
                            <td colspan="4" class="text-center text-muted">No open blood requests</td>
                        </tr>
            <%
                    }
                } catch (SQLException e) {
                    out.println("<tr><td colspan='4' class='text-danger text-center'>Error: " + e.getMessage() + "</td></tr>");
                }
            %>
            </tbody>
        </table>
    </div>
</body>
</html>
