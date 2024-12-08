<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Certifications - Admin</title>
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
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 12px;
            text-align: center;
        }
        th {
            background-color: #4CAF50;
            color: white;
        }
        button {
            padding: 8px 12px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        button:hover {
            background-color: #45a049;
        }

        /* Back to Dashboard button */
        .btn-back {
            display: block;
            margin-top: 20px;
            text-align: center;
            padding: 12px;
            background-color: #3498db;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            width: 100%;
        }

        .btn-back:hover {
            background-color: #2980b9;
        }
    </style>
</head>
<body>

    <div class="header">
        <h1>Manage Certifications</h1>
    </div>

    <div class="container">
        <p>Use this page to review and manage certifications that have been approved.</p>

        <!-- The Back to Dashboard button -->
        <a href="admin.jsp" class="btn-back">Back to Dashboard</a>
        
        <!-- Example of dynamic content, such as a list of certifications from the server -->
        <c:if test="${not empty certifications}">
            <table>
                <thead>
                    <tr>
                        <th>Certification Name</th>
                        <th>Issued Date</th>
                        <th>Status</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="cert" items="${certifications}">
                        <tr>
                            <td>${cert.name}</td>
                            <td>${cert.issuedDate}</td>
                            <td>${cert.status}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </c:if>

        <c:if test="${empty certifications}">
            <p>No certifications available to manage.</p>
        </c:if>
    </div>

</body>
</html>
