<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pending Approvals - Manage Certifications</title>
    <style>
        /* Resetting default styles */
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body {
            font-family: 'Arial', sans-serif;
            background-color: #f8f9fa;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            min-height: 100vh;
            color: #333;
        }

        .header {
            width: 100%;
            background-color: #28a745;
            color: white;
            padding: 20px;
            text-align: center;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .header h1 {
            margin: 0;
            font-size: 1.5rem;
        }

        .header .back-button {
            background-color: white;
            color: #28a745;
            padding: 8px 16px;
            text-decoration: none;
            border-radius: 4px;
            font-weight: bold;
            border: 2px solid #28a745;
            transition: background-color 0.3s ease;
        }

        .header .back-button:hover {
            background-color: #28a745;
            color: white;
        }

        .container {
            background-color: white;
            border-radius: 8px;
            max-width: 600px;
            width: 90%;
            padding: 20px;
            margin: 20px auto;
            box-shadow: 0 6px 15px rgba(0, 0, 0, 0.1);
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            padding: 14px;
            text-align: left;
            border-bottom: 1px solid #ddd;
            font-size: 16px;
        }

        th {
            background-color: #28a745;
            color: white;
            text-align: center;
            font-weight: 500;
        }

        td {
            text-align: center;
            color: #555;
        }

        tr:nth-child(even) {
            background-color: #f8f9fa;
        }

        .action-btn {
            padding: 8px 16px;
            background-color: #28a745;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s ease;
            font-size: 15px;
        }

        .action-btn:hover {
            background-color: #218838;
        }
    </style>
</head>
<body>

<div class="header">
    <h1>Pending Approvals</h1>
    <a href="admin.jsp" class="back-button">Back to Admin Dashboard</a>
</div>

<div class="container">
    <table>
        <thead>
            <tr>
                <th>Certification Name</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody id="approvalTableBody">
            <c:forEach var="cert" items="${renewalRequests}">
                <tr>
                    <td>${cert.name}</td>
                    <td>
                        <button class="action-btn" onclick="approveRequest('${cert.name}', ${cert.index})">Approve</button>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>

<script>
    function loadPendingApprovals() {
        const approvalTableBody = document.getElementById('approvalTableBody');
        const renewalRequests = ${renewalRequestsJson}; // Dynamically populated in JSP

        approvalTableBody.innerHTML = '';

        if (renewalRequests.length === 0) {
            approvalTableBody.innerHTML = '<tr><td colspan="2">No pending approvals.</td></tr>';
            return;
        }

        renewalRequests.forEach((certName, index) => {
            const row = approvalTableBody.insertRow();
            row.insertCell(0).innerText = certName;

            const actionCell = row.insertCell(1);
            const approveButton = document.createElement('button');
            approveButton.innerText = 'Approve';
            approveButton.classList.add('action-btn');
            approveButton.addEventListener('click', () => approveRequest(certName, index));
            actionCell.appendChild(approveButton);
        });
    }

    function approveRequest(certName, index) {
        let certificates = JSON.parse(localStorage.getItem('certifications')) || [];
        const certIndex = certificates.findIndex(cert => cert.name === certName);

        if (certIndex >= 0) {
            certificates[certIndex].status = 'Approved';
            localStorage.setItem('certifications', JSON.stringify(certificates));
        }

        let renewalRequests = JSON.parse(localStorage.getItem('renewalRequests')) || [];
        renewalRequests.splice(index, 1);
        localStorage.setItem('renewalRequests', JSON.stringify(renewalRequests));

        alert(`Certification "${certName}" approved.`);
        loadPendingApprovals();
    }

    document.addEventListener('DOMContentLoaded', loadPendingApprovals);
</script>

</body>
</html>
