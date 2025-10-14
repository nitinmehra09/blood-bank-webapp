<%-- 
    Document   : donorDashboard
    Created on : 19 Sept 2025, 7:43:20 am
    Author     : Nitin Mehra
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Donor Dashboard</title>
    
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="assets/css/style.css">
</head>
<body>
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark" style="background-color: var(--primary);">
        <div class="container-fluid">
            <a class="navbar-brand fw-bold" href="#">Blood Donation Portal</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" 
                    data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" 
                    aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
                <ul class="navbar-nav">
                    <li class="nav-item"><a class="nav-link active" href="#">Dashboard</a></li>
                    <li class="nav-item"><a class="nav-link" href="#">My Profile</a></li>
                    <li class="nav-item"><a class="nav-link" href="logout.jsp">Logout</a></li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Hero Section -->
    <div class="hero">
        <div>
            <h1 class="fw-bold">Welcome, Donor!</h1>
            <p class="lead">Thank you for being a lifesaver ❤️</p>
        </div>
    </div>

    <!-- Dashboard Content -->
    <div class="container mt-5">
        <div class="row">
            <div class="col-md-4">
                <div class="card-custom text-center">
                    <h5 class="text-danger-custom">My Donations</h5>
                    <p>You have donated <strong>3 times</strong></p>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card-custom text-center">
                    <h5 class="text-danger-custom">Upcoming Camps</h5>
                    <p>2 camps are scheduled near you</p>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card-custom text-center">
                    <h5 class="text-danger-custom">Notifications</h5>
                    <p>You have <strong>5 new</strong> alerts</p>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
