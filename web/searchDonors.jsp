<%--
<%@page import="db.DBConnector"%>
<%@ page import="java.sql.*" %>
<%@ page import="dto.UserDTOSearch" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Search Donors</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        /* Body & Container */
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #f8d7da, #fff0f0);
            margin: 0;
            padding: 0;
        }
        .container {
            max-width: 1000px;
            margin: 60px auto;
        }

        /* Card */
        .card-custom {
            background: #fff;
            border-radius: 15px;
            box-shadow: 0 8px 25px rgba(0,0,0,0.15);
            padding: 30px;
            animation: fadeInUp 1s ease;
        }
        @keyframes fadeInUp {
            0% { opacity: 0; transform: translateY(50px); }
            100% { opacity: 1; transform: translateY(0); }
        }

        /* Header */
        .card-custom h3 {
            color: #c0392b;
            text-align: center;
            margin-bottom: 25px;
            position: relative;
        }
        .card-custom h3::after {
            content: "";
            display: block;
            width: 80px;
            height: 3px;
            background: #c0392b;
            margin: 10px auto 0;
            border-radius: 2px;
            animation: grow 1s ease forwards;
        }
        @keyframes grow {
            0% { width: 0; }
            100% { width: 80px; }
        }

        /* Form */
        form {
            display: flex;
            flex-wrap: wrap;
            gap: 15px;
            justify-content: center;
            margin-bottom: 25px;
        }
        select, input[type="text"] {
            padding: 12px;
            width: 220px;
            border-radius: 8px;
            border: 1px solid #ddd;
            transition: 0.3s;
        }
        select:focus, input[type="text"]:focus {
            border-color: #c0392b;
            box-shadow: 0 0 8px rgba(192,57,43,0.3);
        }
        .btn-danger-custom {
            background-color: #c0392b;
            color: #fff;
            font-weight: bold;
            border-radius: 8px;
            padding: 12px 25px;
            border: none;
            cursor: pointer;
            transition: 0.3s;
        }
        .btn-danger-custom:hover {
            background-color: #a93226;
            transform: scale(1.05);
        }

        /* Table */
        .table-responsive {
            overflow-x: auto;
        }
        table {
            border-collapse: collapse;
            width: 100%;
            margin-top: 15px;
            border-radius: 10px;
            overflow: hidden;
            animation: fadeIn 1s ease;
        }
        @keyframes fadeIn {
            0% { opacity: 0; transform: translateY(20px); }
            100% { opacity: 1; transform: translateY(0); }
        }
        th {
            background: #c0392b !important;
            color: #fff;
            text-align: center;
            padding: 12px;
        }
        td {
            text-align: center;
            padding: 12px;
            border-bottom: 1px solid #eee;
        }
        tr:nth-child(even) {
            background-color: #f9f9f9;
        }
        tr:hover {
            background-color: #ffe6e6;
            transition: 0.3s;
        }

        /* No Results */
        .no-results {
            text-align: center;
            color: #777;
            font-style: italic;
            margin-top: 20px;
            animation: fadeIn 1s ease;
        }

        /* Responsive */
        @media (max-width: 576px) {
            select, input[type="text"] {
                width: 100%;
            }
            .btn-danger-custom {
                width: 100%;
            }
        }
    </style>
</head>
<body>
<div class="container">
    <div class="card-custom">
        <h3>🔍 Search Donors</h3>
        <form method="post">
            <select name="bloodGroup" required>
                <option value="">--Select Blood Group--</option>
                <option value="A+">A+</option>
                <option value="A-">A-</option>
                <option value="B+">B+</option>
                <option value="B-">B-</option>
                <option value="O+">O+</option>
                <option value="O-">O-</option>
                <option value="AB+">AB+</option>
                <option value="AB-">AB-</option>
            </select>
            <input type="text" name="city" placeholder="Enter City" required>
            <button type="submit" class="btn btn-danger-custom">Search</button>
        </form>

        <%
            String bloodGroup = request.getParameter("bloodGroup");
            String city = request.getParameter("city");

            if (bloodGroup != null && city != null) {
                try (
                    Connection con = DBConnector.getConnection();
                    PreparedStatement pst = con.prepareStatement(
                        "SELECT name, bloodGroup, city, contact FROM donors WHERE bloodGroup=? AND city=?"
                    )
                ) {
                    pst.setString(1, bloodGroup);
                    pst.setString(2, city);

                    try (ResultSet rs = pst.executeQuery()) {
                        if (!rs.isBeforeFirst()) {
        %>
                            <p class="no-results">No donors found for your search.</p>
        <%
                        } else {
        %>
                            <div class="table-responsive mt-4">
                                <table class="table table-bordered table-hover">
                                    <thead>
                                        <tr>
                                            <th>Name</th>
                                            <th>Blood Group</th>
                                            <th>City</th>
                                            <th>Contact</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <%
                                        while(rs.next()) {
                                            UserDTOSearch user = new UserDTOSearch(
                                                rs.getString("name"),
                                                rs.getString("bloodGroup"),
                                                rs.getString("city"),
                                                rs.getString("contact")
                                            );
                                    %>
                                        <tr>
                                            <td><%= user.getUsername() %></td>
                                            <td><%= user.getBloodGroup() %></td>
                                            <td><%= user.getCity() %></td>
                                            <td><%= user.getEmail() %></td>
                                        </tr>
                                    <% } %>
                                    </tbody>
                                </table>
                            </div>
        <%
                        }
                    }
                } catch(Exception e) {
                    out.println("<p class='text-danger text-center mt-3'>Error: " + e.getMessage() + "</p>");
                }
            }
        %>
    </div>
</div>
</body>
</html>
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="dto.UserDTOSearch" %>
<!DOCTYPE html>
<html>
<head>
    <title>Search Donors</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="assets/css/style.css">
    <style>
        /* Custom card styling */
        .card-custom {
            background: #fff;
            border-radius: 16px;
            padding: 30px;
            box-shadow: 0 6px 20px rgba(0,0,0,0.05);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }
        .card-custom:hover {
            transform: translateY(-4px);
            box-shadow: 0 12px 25px rgba(0,0,0,0.1);
        }
        .text-danger-custom {
            color: #d32f2f;
        }
        .btn-danger-custom {
            background: #d32f2f;
            border: none;
            transition: background 0.3s ease, transform 0.2s ease;
        }
        .btn-danger-custom:hover {
            background: #b71c1c;
            transform: scale(1.05);
        }
        .no-results {
            text-align: center;
            color: #a1a1a1;
            font-style: italic;
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <% 
        String userEmail = (String) session.getAttribute("email");
        if(userEmail == null || userEmail.trim().equals("")){
        
          response.sendRedirect("login.jsp");
            
        }
    
    %>

    <!-- ✅ Navigation Section -->
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
                        <a class="nav-link" href="requestBlood.jsp">Blood Requests</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" href="donateBlood.jsp">Search Donors</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-light" href="logout.jsp">Logout</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    <!-- ✅ End Navigation -->

    <div class="container mt-5">
        <div class="card-custom">
            <h3 class="text-center text-danger-custom mb-4">🔍 Search Blood Donors</h3>

            <!-- Search Form -->
            <form method="post" action="${pageContext.request.contextPath}/SearchDonorServlet" class="row g-3 align-items-end">
                <div class="col-md-4">
                    <label for="bloodGroup" class="form-label">Blood Group</label>
                    <select name="bloodGroup" id="bloodGroup" class="form-select" required>
                        <option value="">Select</option>
                        <option value="A+">A+</option>
                        <option value="A-">A-</option>
                        <option value="B+">B+</option>
                        <option value="B-">B-</option>
                        <option value="O+">O+</option>
                        <option value="O-">O-</option>
                        <option value="AB+">AB+</option>
                        <option value="AB-">AB-</option>
                    </select>
                </div>

                <div class="col-md-4">
                    <label for="city" class="form-label">City</label>
                    <input type="text" id="city" name="city" class="form-control" placeholder="Enter city" required>
                </div>

                <div class="col-md-4 text-end">
                    <button type="submit" class="btn btn-danger-custom w-100">Search</button>
                </div>
            </form>

            <!-- Error Message -->
            <%
                String error = (String) request.getAttribute("error");
                if (error != null) {
            %>
            <div class="alert alert-danger mt-3"><%= error %></div>
            <% } %>

            <!-- Search Results -->
            <%
                List<UserDTOSearch> donors = (List<UserDTOSearch>) request.getAttribute("donors");
                if (donors != null) {
                    if (donors.isEmpty()) {
            %>
                        <p class="no-results">No donors found for your search.</p>
            <%
                    } else {
            %>
                        <div class="table-responsive mt-3">
                            <table class="table table-bordered table-hover">
                                <thead class="table-light text-center">
                                    <tr>
                                        <th>Name</th>
                                        <th>Blood Group</th>
                                        <th>City</th>
                                        <th>Phone</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <% for (UserDTOSearch u : donors) { %>
                                    <tr>
                                        <td><%= u.getDonorName() %></td>
                                        <td><%= u.getBloodGroup() %></td>
                                        <td><%= u.getCity() %></td>
                                        <td><%= u.getPhone() %></td>
                                    </tr>
                                    <% } %>
                                </tbody>
                            </table>
                        </div>
            <%
                    }
                }
            %>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>



<%--
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="dto.UserDTOSearch" %>
<!DOCTYPE html>
<html>
<head>
    <title>Search Donors</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body { font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; background:#fff7f7; }
        .card-custom { background:#fff; border-radius:12px; padding:22px; box-shadow:0 6px 20px rgba(0,0,0,0.08); }
        .no-results { text-align:center; color:#666; font-style:italic; margin-top:16px; }
    </style>
</head>
<body>

<!-- NAVBAR (in-file) -->
<nav class="navbar navbar-expand-lg navbar-dark bg-danger">
    <div class="container-fluid">
        <a class="navbar-brand fw-bold" href="home.jsp">Blood Donation</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false"
                aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item"><a class="nav-link" href="home.jsp">Home</a></li>
                <li class="nav-item"><a class="nav-link" href="profile.jsp">My Profile</a></li>
                <li class="nav-item"><a class="nav-link" href="bloodRequests.jsp">Blood Requests</a></li>
                <li class="nav-item"><a class="nav-link" href="donateBlood.jsp">Donate Blood</a></li>
                <li class="nav-item"><a class="nav-link active text-light" id="nav-search" href="searchDonors.jsp">Search Donors</a></li>
                <li class="nav-item"><a class="nav-link text-light" href="logout.jsp">Logout</a></li>
            </ul>
        </div>
    </div>
</nav>

<!-- MAIN -->
<div class="container mt-5">
    <div class="card-custom">
        <h3 class="text-center text-danger mb-4">🔍 Search Blood Donors</h3>

        <!-- FORM -->
        <form method="post" action="${pageContext.request.contextPath}/SearchDonorServlet" class="row g-3 align-items-end">
            <div class="col-md-4">
                <label for="bloodGroup" class="form-label">Blood Group</label>
                <select name="bloodGroup" id="bloodGroup" class="form-select" required>
                    <option value="">Select</option>
                    <option value="A+">A+</option>
                    <option value="A-">A-</option>
                    <option value="B+">B+</option>
                    <option value="B-">B-</option>
                    <option value="O+">O+</option>
                    <option value="O-">O-</option>
                    <option value="AB+">AB+</option>
                    <option value="AB-">AB-</option>
                </select>
            </div>

            <div class="col-md-4">
                <label for="city" class="form-label">City</label>
                <input type="text" id="city" name="city" class="form-control" placeholder="Enter city" required>
            </div>

            <div class="col-md-4 text-end">
                <button type="submit" class="btn btn-danger">Search</button>
            </div>
        </form>

        <!-- ERROR MESSAGE -->
        <%
            String error = (String) request.getAttribute("error");
            if (error != null) {
        %>
        <div class="alert alert-danger mt-3"><%= error %></div>
        <% } %>

        <!-- RESULTS -->
        <%
            List<UserDTOSearch> donors = (List<UserDTOSearch>) request.getAttribute("donors");
            if (donors != null) {
                if (donors.isEmpty()) {
        %>
                    <p class="no-results">No donors found for your search.</p>
        <%
                } else {
        %>
                    <div class="table-responsive mt-3">
                        <table class="table table-bordered table-hover">
                            <thead class="table-light text-center">
                                <tr>
                                    <th>Name</th>
                                    <th>Blood Group</th>
                                    <th>City</th>
                                    <th>Phone</th>
                                </tr>
                            </thead>
                            <tbody>
                                <% for (UserDTOSearch u : donors) { %>
                                <tr>
                                    <td><%= u.getDonorName() %></td>
                                    <td><%= u.getBloodGroup() %></td>
                                    <td><%= u.getCity() %></td>
                                    <td><%= u.getPhone() %></td>
                                </tr>
                                <% } %>
                            </tbody>
                        </table>
                    </div>
        <%
                }
            }
        %>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

--%>