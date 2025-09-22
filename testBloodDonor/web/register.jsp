<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html>
<head>
    <title>Register - Blood Donation</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(135deg, #f8d7da, #fff0f0);
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            padding-top: 50px;
        }
        .card-custom {
            max-width: 500px;
            margin: auto;
            background: #fff;
            border-radius: 15px;
            padding: 30px;
            box-shadow: 0 8px 25px rgba(0,0,0,0.15);
            animation: fadeInUp 1s ease;
        }
        @keyframes fadeInUp {
            0% { opacity: 0; transform: translateY(50px); }
            100% { opacity: 1; transform: translateY(0); }
        }
        .card-custom h3 {
            color: #c0392b;
            text-align: center;
            margin-bottom: 25px;
        }
        input, select {
            margin-bottom: 15px;
            padding: 10px;
            border-radius: 8px;
            border: 1px solid #ddd;
            width: 100%;
            transition: 0.3s;
        }
        input:focus, select:focus {
            border-color: #c0392b;
            box-shadow: 0 0 8px rgba(192,57,43,0.3);
        }
        .btn-danger-custom, .btn-primary {
            background-color: #c0392b;
            color: #fff;
            font-weight: bold;
            width: 100%;
            padding: 12px;
            border: none;
            border-radius: 8px;
            transition: 0.3s;
        }
        .btn-danger-custom:hover, .btn-primary:hover {
            background-color: #a93226;
            transform: scale(1.05);
        }
        .alert-custom {
            padding: 12px;
            border-radius: 8px;
            text-align: center;
            margin-bottom: 15px;
        }
        .alert-success-custom {
            background-color: #d4edda;
            color: #155724;
            border: 1px solid #c3e6cb;
        }
        .alert-error-custom {
            background-color: #f8d7da;
            color: #721c24;
            border: 1px solid #f5c6cb;
        }
    </style>
</head>
<body>
<div class="card-custom">
    <h3>Create Account</h3>

    <%-- Display success/error messages --%>
    <%
        
        if (session != null) { // session is already available
        String successMsg = (String) session.getAttribute("successMsg");
        String errorMsg = (String) session.getAttribute("errorMsg");

        if (successMsg != null) {
%>
            <div class="alert-custom alert-success-custom">
                <%= successMsg %>
            </div>
<%
            session.removeAttribute("successMsg");
        }

        if (errorMsg != null) {
%>
            <div class="alert-custom alert-error-custom">
                <%= errorMsg %>
            </div>
<%
            session.removeAttribute("errorMsg");
        }
    }
%>


    <form action="RegisterServlet" method="post">
        <div class="mb-3">
            <label class="form-label">Full Name</label>
            <input type="text" name="name" class="form-control" required>
        </div>
        <div class="mb-3">
            <label class="form-label">Blood Group</label>
            <select class="form-select" name="bloodGroup" required>
                <option value="">Choose Blood Group</option>
                <option>A+</option><option>A-</option>
                <option>B+</option><option>B-</option>
                <option>O+</option><option>O-</option>
                <option>AB+</option><option>AB-</option>
            </select>
        </div>
        <div class="mb-3">
            <label class="form-label">Email</label>
            <input type="email" name="email" class="form-control" required>
        </div>
        <div class="mb-3">
            <label class="form-label">Password</label>
            <input type="password" name="password" class="form-control" required>
        </div>
        <div class="mb-3">
            <label class="form-label">City</label>
            <input type="text" name="city" class="form-control" required>
        </div>
        <div class="d-grid">
            <button class="btn btn-primary">Register</button>
        </div>
    </form>

    <p class="text-center mt-3">Already registered? <a href="login.jsp" class="text-danger-custom">Login here</a></p>
</div>
</body>
</html>
