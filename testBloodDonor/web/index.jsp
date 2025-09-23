<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Blood Donation Portal</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        /* ===== Global Styles ===== */
        body, html {
            margin: 0;
            padding: 0;
            height: 100%;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        a {
            text-decoration: none;
        }

        /* ===== Hero Section ===== */
        .hero {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background: linear-gradient(to right, #dc3545, #e74c3c);
            color: #fff;
            text-align: center;
            position: relative;
            overflow: hidden;
        }

        .hero::after {
            content: '';
            position: absolute;
            top: -50%;
            left: -50%;
            width: 200%;
            height: 200%;
            background: rgba(255,255,255,0.05);
            transform: rotate(45deg);
            animation: moveLines 10s linear infinite;
            pointer-events: none; /* Fix clickable buttons */
        }

        @keyframes moveLines {
            0% { transform: rotate(45deg) translate(0, 0); }
            100% { transform: rotate(45deg) translate(-50%, -50%); }
        }

        .hero h1 {
            font-size: 3rem;
            margin-bottom: 1rem;
            animation: fadeInDown 1s ease forwards;
        }

        .hero p {
            font-size: 1.25rem;
            margin-bottom: 2rem;
            animation: fadeInUp 1.2s ease forwards;
        }

        /* ===== Buttons with contrast ===== */
        .hero .btn {
            padding: 0.75rem 1.5rem;
            font-size: 1rem;
            border-radius: 50px;
            transition: transform 0.3s, box-shadow 0.3s, background-color 0.3s, color 0.3s;
            border: none;
            box-shadow: 0 5px 15px rgba(0,0,0,0.2);
        }

        .hero .btn-primary {
            background-color: #dc3545;
            color: #fff;
        }

        .hero .btn-primary:hover {
            transform: scale(1.1);
            box-shadow: 0 8px 20px rgba(220,53,69,0.6);
        }

        .hero .btn-outline-light {
            border: 2px solid #fff;
            color: #fff;
            background-color: rgba(0,0,0,0.15);
        }

        .hero .btn-outline-light:hover {
            background-color: #fff;
            color: #dc3545;
            transform: scale(1.1);
        }

        /* ===== Animations ===== */
        @keyframes fadeInDown {
            0% { opacity: 0; transform: translateY(-50px); }
            100% { opacity: 1; transform: translateY(0); }
        }

        @keyframes fadeInUp {
            0% { opacity: 0; transform: translateY(50px); }
            100% { opacity: 1; transform: translateY(0); }
        }

        /* ===== Responsive ===== */
        @media (max-width: 768px) {
            .hero h1 {
                font-size: 2.2rem;
            }

            .hero p {
                font-size: 1rem;
            }

            .hero .btn {
                padding: 0.6rem 1.2rem;
                font-size: 0.9rem;
            }
        }
    </style>
</head>
<body>
    <div class="hero">
        <div>
            <h1 class="display-4 fw-bold">Donate Blood, Save Lives ❤️</h1>
            <p class="lead">Your big impact starts with a small drop.</p>
            <a href="register.jsp" class="btn btn-primary me-2">Register</a>
            <a href="login.jsp" class="btn btn-outline-light">Login</a>
        </div>
    </div>
</body>
</html>


