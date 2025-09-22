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
                                            <td><%= user.getName() %></td>
                                            <td><%= user.getBloodGroup() %></td>
                                            <td><%= user.getLocation() %></td>
                                            <td><%= user.getContact() %></td>
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
