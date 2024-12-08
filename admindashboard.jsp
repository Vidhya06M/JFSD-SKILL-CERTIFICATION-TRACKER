<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard - Skill Certification Tracker</title>
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
            width: 90%;
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
        }
        .logout-link:hover {
            background-color: #c0392b;
        }
    </style>
</head>
<body>

    <div class="header">
        <h1>Admin Dashboard</h1>
    </div>

    <div class="container">
        <h2>Actions</h2>

        <!-- Link to manage certifications -->
        <a href="pendingApprovals.jsp" class="nav-link">Manage Certifications</a>

        <!-- Link to view renewal requests -->
        <a href="viewRenewalRequests.jsp" class="nav-link">View Renewal Requests</a>

        <!-- Logout functionality -->
        <c:if test="${not empty sessionScope.admin}">
            <a href="logout.jsp" class="nav-link logout-link">Logout</a>
        </c:if>
    </div>

</body>
</html>
