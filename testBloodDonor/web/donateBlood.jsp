<%-- 
    Document   : donateBlood
    Created on : 19 Sept 2025, 5:56:08 pm
    Author     : Nitin Mehra

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Donate Blood</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="assets/css/style.css">
</head>
<body>
    <div class="container mt-5">
        <div class="card-custom">
            <h3 class="text-center text-danger-custom mb-4">Donate Blood</h3>
            <form action="DonateBlood" method="post">
                <div class="mb-3">
                    <label class="form-label">Donor Name</label>
                    <input type="text" name="donorName" class="form-control" required>
                </div>
                <div class="mb-3">
                    <label class="form-label">Blood Group</label>
                    <select class="form-select" name="bloodGroup" required>
                        <option value="">Choose...</option>
                        <option>A+</option><option>A-</option>
                        <option>B+</option><option>B-</option>
                        <option>O+</option><option>O-</option>
                        <option>AB+</option><option>AB-</option>
                    </select>
                </div>
                <div class="mb-3">
                    <label class="form-label">Phone no.</label>
                    <input type="text" name="phone" class="form-control" required>
                </div>
                <div class="mb-3">
                    <label class="form-label">City</label>
                    <input type="text" name="city" class="form-control" required>
                </div>
                <button class="btn btn-primary w-100">Register as Donor</button>
            </form>
        </div>
    </div>
</body>
</html>
--%>

<%-- 
    Document   : donateBlood
    Created on : 19 Sept 2025, 5:56:08 pm
    Author     : Nitin Mehra
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Donate Blood</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="assets/css/style.css">
</head>
<body>
    <!-- ✅ Navigation Section -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-danger">
        <div class="container-fluid">
            <a class="navbar-brand fw-bold" href="home.jsp">Blood Donation</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
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
                        <a class="nav-link" href="bloodRequests.jsp">Blood Requests</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" href="donateBlood.jsp">Donate Blood</a>
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
            <h3 class="text-center text-danger-custom mb-4">Donate Blood</h3>
            <form action="DonateBlood" method="post">
                <div class="mb-3">
                    <label class="form-label">Donor Name</label>
                    <input type="text" name="donorName" class="form-control" required>
                </div>
                <div class="mb-3">
                    <label class="form-label">Blood Group</label>
                    <select class="form-select" name="bloodGroup" required>
                        <option value="">Choose...</option>
                        <option>A+</option><option>A-</option>
                        <option>B+</option><option>B-</option>
                        <option>O+</option><option>O-</option>
                        <option>AB+</option><option>AB-</option>
                    </select>
                </div>
                <div class="mb-3">
                    <label class="form-label">Phone no.</label>
                    <input type="text" name="phone" class="form-control" required>
                </div>
                <div class="mb-3">
                    <label class="form-label">City</label>
                    <input type="text" name="city" class="form-control" required>
                </div>
                <button class="btn btn-primary w-100">Register as Donor</button>
            </form>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
