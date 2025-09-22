
<%-- 
    Document   : profile
    Created on : 15 Sept 2025, 5:58:01 pm
    Author     : Nitin Mehra

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
        <div class="card-custom p-4">
            <h3 class="text-center text-danger-custom mb-4">My Profile</h3>
            
            <form action="UpdateProfileServlet" method="post">
                <p>
                    <strong>Name:</strong>
                    <input type="text" class="form-control" name="name" 
                           placeholder="<%= (session.getAttribute("name") != null) ? session.getAttribute("name") : "" %>">
                </p>
                
                <p>
                    <strong>Email:</strong>
                    <input type="email" class="form-control" name="email" 
                           value="<%= (session.getAttribute("email") != null) ? session.getAttribute("email") : "" %>" 
                           readonly>
                </p>
                
                <p>
                    <strong>Blood Group:</strong>
                    <input type="text" class="form-control" name="bloodGroup" 
                           placeholder="<%= (session.getAttribute("bloodGroup") != null) ? session.getAttribute("bloodGroup") : "" %>">
                </p>
                
                <p>
                    <strong>Location:</strong>
                    <input type="text" class="form-control" name="city" 
                           placeholder="<%= (session.getAttribute("city") != null) ? session.getAttribute("city") : "" %>">
                </p>
                
                <div class="mt-3 d-flex justify-content-between">
                    <a href="delete.jsp" class="btn btn-primary">Delete</a>
                    <button type="submit" class="btn btn-success">Update Profile</button>
                </div>
            </form>
        </div>
    </div>
</body>
</html>

--%>
<%-- 
    Document   : profile
    Created on : 15 Sept 2025, 5:58:01 pm
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
                        <a class="nav-link active" href="profile.jsp">My Profile</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="bloodRequests.jsp">Blood Requests</a>
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
    <!-- ✅ End Navigation -->

    <div class="container mt-5">
        <div class="card-custom p-4">
            <h3 class="text-center text-danger-custom mb-4">My Profile</h3>
            
            <form action="UpdateProfileServlet" method="post">
                <p>
                    <strong>Name:</strong>
                    <input type="text" class="form-control" name="name" 
                           placeholder="<%= (session.getAttribute("name") != null) ? session.getAttribute("name") : "" %>">
                </p>
                
                <p>
                    <strong>Email:</strong>
                    <input type="email" class="form-control" name="email" 
                           value="<%= (session.getAttribute("email") != null) ? session.getAttribute("email") : "" %>" 
                           readonly>
                </p>
                
                <p>
                    <strong>Blood Group:</strong>
                    <input type="text" class="form-control" name="bloodGroup" 
                           placeholder="<%= (session.getAttribute("bloodGroup") != null) ? session.getAttribute("bloodGroup") : "" %>">
                </p>
                
                <p>
                    <strong>Location:</strong>
                    <input type="text" class="form-control" name="city" 
                           placeholder="<%= (session.getAttribute("city") != null) ? session.getAttribute("city") : "" %>">
                </p>
                
                <div class="mt-3 d-flex justify-content-between">
                    <a href="delete.jsp" class="btn btn-danger">Delete</a>
                    <button type="submit" class="btn btn-success">Update Profile</button>
                </div>
            </form>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
