<%-- 
    Document   : bloodRequests
    Created on : 19 Sept 2025
    Author     : Nitin Mehra
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
--%>

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

    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-danger">
        <div class="container-fluid">
            <a class="navbar-brand fw-bold" href="home.jsp">Blood Donation</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" 
                    aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="home.jsp">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="profile.jsp">My Profile</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" href="bloodRequests.jsp">Blood Requests</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="donateBlood.jsp">Donate Blood</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-light" href="logout.jsp">Logout</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    <!-- End Navbar -->

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

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
