<%-- 
    Document   : comingSoon
    Created on : 23 Sept 2025, 1:48:48 am
    Author     : Nitin Mehra
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Coming Soon</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body, html {
            height: 100%;
            margin: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #ff758c, #ff7eb3);
            display: flex;
            justify-content: center;
            align-items: center;
            text-align: center;
            color: white;
            overflow: hidden;
        }

        .container-soon {
            max-width: 500px;
            animation: float 3s ease-in-out infinite;
        }

        @keyframes float {
            0%, 100% { transform: translateY(0); }
            50% { transform: translateY(-20px); }
        }

        .character {
            font-size: 100px;
            animation: bounce 2s infinite;
        }

        @keyframes bounce {
            0%, 100% { transform: translateY(0); }
            50% { transform: translateY(-30px); }
        }

        h1 {
            margin-top: 20px;
            font-size: 2.5rem;
        }

        p {
            font-size: 1.2rem;
            margin-top: 10px;
        }

        .btn-home {
            margin-top: 20px;
            padding: 10px 25px;
            font-weight: bold;
            border-radius: 50px;
            background-color: white;
            color: #ff4a6e;
            border: none;
            transition: 0.3s;
        }

        .btn-home:hover {
            background-color: #ff4a6e;
            color: white;
            transform: scale(1.1);
        }
    </style>
</head>
<body>
    <div class="container-soon">
        <div class="character">🚀</div>
        <h1>Coming Soon!</h1>
        <p>This feature will be available in the near future.</p>
        <a href="home.jsp" class="btn btn-home">Back to Home</a>
    </div>
</body>
</html>
