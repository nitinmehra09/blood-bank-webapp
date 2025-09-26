<%-- 
    Document   : home
    Created on : 19 Sept 2025, 5:53:46 pm
    Author     : Nitin Mehra
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Home - Blood Donation Portal</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="assets/css/style.css">
    <style>
        .hero-section {
            text-align: center;
            padding: 80px 20px 40px;
            background: linear-gradient(to right, #B71C1C, #D32F2F, #FF5252);
            color: white;
            border-radius: 0 0 40px 40px;
            animation: fadeInDown 1.5s ease;
        }
        @keyframes fadeInDown {
            from {opacity: 0; transform: translateY(-50px);}
            to {opacity: 1; transform: translateY(0);}
        }
        .option-card {
            border-radius: 15px;
            box-shadow: 0 5px 20px rgba(0,0,0,0.15);
            transition: transform 0.3s, box-shadow 0.3s;
            cursor: pointer;
            padding: 30px 20px;
            text-align: center;
        }
        .option-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 8px 25px rgba(0,0,0,0.25);
        }
        .option-icon {
            font-size: 50px;
            margin-bottom: 15px;
            color: var(--primary, #D32F2F);
        }
        .option-title {
            font-weight: 600;
            margin-bottom: 10px;
            color: #B71C1C;
        }
    </style>
</head>
<body>

    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark" style="background-color: #B71C1C;">
        <div class="container-fluid">
            <a class="navbar-brand fw-bold" href="home.jsp">Blood Donation Portal</a>
            <div class="collapse navbar-collapse justify-content-end">
                <ul class="navbar-nav">
                    <li class="nav-item"><a class="nav-link active" href="home.jsp">Home</a></li>
                    <li class="nav-item"><a class="nav-link" href="profile.jsp">Profile</a></li>
                    <li class="nav-item"><a class="nav-link" href="logout.jsp">Logout</a></li>
                </ul>
            </div>
        </div>
    </nav>
    <% 
        String userEmail = (String) session.getAttribute("email");
        if(userEmail == null || userEmail.trim().equals("")){
        
          response.sendRedirect("login.jsp");
            
        }
    
    %>

    <!-- Hero -->
    <div class="hero-section">
        <h1 class="fw-bold">Welcome to Blood Donation Portal</h1>
        <p class="lead">Donate blood, request help, and save lives ❤️</p>
    </div>

    <!-- Options -->
    <div class="container my-5">
        <div class="row g-4">
            <!-- Request Blood -->
            <div class="col-md-4">
                <div class="option-card" onclick="window.location.href='requestBlood.jsp'">
                    <div class="option-icon">🩸</div>
                    <h5 class="option-title">Request Blood</h5>
                    <p>Submit a request if you or someone needs blood urgently.</p>
                </div>
            </div>

            <!-- Donate Blood -->
            <div class="col-md-4">
                <div class="option-card" onclick="window.location.href='donateBlood.jsp'">
                    <div class="option-icon">❤️</div>
                    <h5 class="option-title">Donate Blood</h5>
                    <p>Register your availability to donate blood and help patients.</p>
                </div>
            </div>

            <!-- Search Donors -->
            <div class="col-md-4">
                <div class="option-card" onclick="window.location.href='searchDonors.jsp'">
                    <div class="option-icon">🔍</div>
                    <h5 class="option-title">Search Donors</h5>
                    <p>Find donors by blood group and location quickly.</p>
                </div>
            </div>

            <!-- Blood Required Requests -->
            <div class="col-md-6">
                <div class="option-card" onclick="window.location.href='bloodRequests.jsp'">
                    <div class="option-icon">📢</div>
                    <h5 class="option-title">Blood Required Requests</h5>
                    <p>View and respond to open requests from patients and hospitals.</p>
                </div>
            </div>

            <!-- My Profile -->
            <div class="col-md-6">
                <div class="option-card" onclick="window.location.href='profile.jsp'">
                    <div class="option-icon">👤</div>
                    <h5 class="option-title">My Profile</h5>
                    <p>Update your details, track donations and requests.</p>
                </div>
            </div>
        </div>
    </div>

</body>
</html>
