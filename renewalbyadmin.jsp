<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Renewal Requests</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: 'Arial', sans-serif;
            background-color: #f0f0f0;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }

        .header {
            background-color: #333;
            color: white;
            padding: 20px;
            text-align: center;
            font-size: 24px;
        }

        .container {
            margin: 40px auto;
            max-width: 800px;
            width: 90%;
            background-color: #fff;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
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
            padding: 10px 15px;
            color: white;
            border: none;
            border-radius: 5px;
            margin-right: 10px;
        }

        .btn-approve {
            background-color: #4CAF50;
        }

        .btn-reject {
            background-color: #e74c3c;
        }

        .btn-back {
            background-color: #3498db;
            margin-top: 20px;
            width: 100%;
            text-align: center;
            padding: 12px;
            font-size: 16px;
            cursor: pointer;
        }
    </style>
</head>
<body>

    <div class="header">Renewal Requests</div>

    <div class="container">
        <table id="renewalRequestsTable">
            <thead>
                <tr>
                    <th>Certification Name</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="request" items="${renewalRequests}">
                    <tr>
                        <td>${request.certificationName}</td>
                        <td>
                            <form action="updateRenewalStatus" method="post">
                                <input type="hidden" name="certificationName" value="${request.certificationName}">
                                <input type="hidden" name="action" value="Approve">
                                <button class="btn-approve" type="submit">Approve</button>
                            </form>
                            <form action="updateRenewalStatus" method="post">
                                <input type="hidden" name="certificationName" value="${request.certificationName}">
                                <input type="hidden" name="action" value="Reject">
                                <button class="btn-reject" type="submit">Reject</button>
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <button class="btn-back" onclick="window.location.href='admin.jsp'">Back to Dashboard</button>
    </div>

</body>
</html>
