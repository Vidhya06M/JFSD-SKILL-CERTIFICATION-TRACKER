<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>UserDashboard - Skill Certification Tracker</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f0f0f0;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }

        .header {
            background-color: #4CAF50;
            color: white;
            padding: 20px;
            text-align: center;
        }

        .container {
            max-width: 800px;
            margin: 20px auto;
            padding: 40px;
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
            display: flex;
            flex-direction: column;
            align-items: center;
            width: 90%;
        }

        h2 {
            text-align: center;
            color: #333;
            margin-bottom: 20px;
        }

        .nav-link {
            display: block;
            width: 100%;
            padding: 15px;
            margin: 10px 0;
            text-align: center;
            color: white;
            background-color: #4CAF50;
            border-radius: 5px;
            text-decoration: none;
            transition: background-color 0.3s ease, transform 0.3s ease;
        }

        .nav-link:hover {
            background-color: #45a049;
            transform: translateY(-2px);
        }

        .logout-link {
            background-color: #e74c3c;
            border: none;
        }

        .logout-link:hover {
            background-color: #c0392b;
        }

        @media (max-width: 600px) {
            .container {
                padding: 30px;
            }

            .nav-link {
                padding: 12px;
            }
        }
    </style>
</head>
<body>

    <div class="header">
        <h1>UserDashboard</h1>
    </div>

    <div class="container">
        <h2>Actions</h2>

        <!-- Links for actions -->
        <a href="addCertificate.jsp" class="nav-link">Add Certification</a>
        <a href="viewCertificate.jsp" class="nav-link">View Your Certifications</a>
        <a href="monitorRenewal.jsp" class="nav-link">Monitor Renewal Dates</a>
        <a href="downloadCertificate.jsp" class="nav-link">Download Certificates</a>

        <!-- Logout functionality based on session -->
        <c:if test="${not empty sessionScope.user}">
            <p>Welcome, ${sessionScope.user}!</p> <!-- Show logged-in user -->
            <a href="logout.jsp" class="nav-link logout-link">Logout</a>
        </c:if>

        <!-- Show login link if the user is not logged in -->
        <c:if test="${empty sessionScope.user}">
            <a href="signup.jsp" class="nav-link">Logout</a>
        </c:if>
    </div>

</body>
</html>
