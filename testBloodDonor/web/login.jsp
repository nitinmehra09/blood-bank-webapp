<%-- 
    Document   : login
    Created on : 19 Sept 2025, 7:01:52 am
    Author     : Nitin Mehra
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login - Blood Donation</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="assets/css/style.css">
</head>
<body class="body-bg-soft">
    <div class="card-custom">
        <h3 class="text-center mb-4 text-danger-custom">Login</h3>
        <form action="LoginChecker" method="post">
            <div class="mb-3">
                <label class="form-label">Email</label>
                <input type="email" name="email" class="form-control" required>
            </div>
            <div class="mb-3">
                <label class="form-label">Password</label>
                <input type="password" name="password" class="form-control" required>
            </div>
            <div class="d-grid">
                <button class="btn btn-primary">Login</button>
            </div>
        </form>
        <p class="text-center mt-3">New user? <a href="register.jsp" class="text-danger-custom">Register here</a></p>
    </div>
</body>
</html>
