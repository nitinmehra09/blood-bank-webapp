<%-- 
    Document   : profile
    Created on : 15 Sept 2025, 5:58:01 pm
    Author     : Nitin Mehra
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>My Profile</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="assets/css/style.css">
</head>
<body>
    <div class="container mt-5">
        <div class="card-custom">
            <h3 class="text-center text-danger-custom mb-4">My Profile</h3>
            <p><strong>Name:</strong> <%= session.getAttribute("name") %></p>
            <p><strong>Email:</strong> <%= session.getAttribute("email") %></p>
            <p><strong>Blood Group:</strong> <%= session.getAttribute("bloodGroup") %></p>
            <p><strong>Location:</strong> <%= session.getAttribute("city") %></p>
            <div class="mt-3">
                <a href="editProfile.jsp" class="btn btn-primary">Edit Profile</a>
            </div>
        </div>
    </div>
</body>
</html>
