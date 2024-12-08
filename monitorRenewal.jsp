<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Monitor Renewal Dates - Skill Certification Tracker</title>
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
            margin: 30px auto;
            padding: 20px;
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            padding: 12px;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #f2f2f2;
        }

        tr:hover {
            background-color: #f9f9f9;
        }

        .status-active {
            color: green;
        }

        .status-expired {
            color: red;
        }

        .nav-link {
            display: block;
            text-align: center;
            margin-top: 20px;
            text-decoration: none;
            color: #4CAF50;
        }

        .add-cert-btn {
            display: block;
            margin: 20px auto;
            padding: 10px 20px;
            background-color: #4CAF50;
            color: white;
            text-align: center;
            border-radius: 5px;
            text-decoration: none;
            width: fit-content;
        }

        .add-cert-btn:hover {
            background-color: #45a049;
        }

        .renew-btn {
            padding: 5px 10px;
            background-color: #FFA500;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .renew-btn:hover {
            background-color: #e69500;
        }
    </style>
</head>
<body>

    <div class="header">
        <h1>Monitor Renewal Dates</h1>
    </div>

    <div class="container">
        <table>
            <thead>
                <tr>
                    <th>Certification Name</th>
                    <th>Expiration Date</th>
                    <th>Status</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <% 
                    // Assuming certifications are stored in the session
                    List<Certification> certifications = (List<Certification>) session.getAttribute("certifications");
                    Map<String, String> renewalStatuses = (Map<String, String>) session.getAttribute("renewalStatuses");
                    List<String> renewalRequests = (List<String>) session.getAttribute("renewalRequests");
                    
                    if (certifications != null) {
                        for (Certification cert : certifications) {
                            String certName = cert.getName();
                            String expirationDate = cert.getExpirationDate();
                            String status = "Active";
                            String renewalStatus = renewalStatuses.get(certName);
                            Date today = new Date();
                            Date expiration = new SimpleDateFormat("yyyy-MM-dd").parse(expirationDate);
                            if ("Approved".equals(renewalStatus)) {
                                status = "Renewal Approved";
                            } else if ("Rejected".equals(renewalStatus)) {
                                status = "Renewal Rejected";
                            } else if (expiration.before(today)) {
                                status = "Expired";
                            }
                %>
                <tr>
                    <td><%= cert.getName() %></td>
                    <td><%= cert.getExpirationDate() %></td>
                    <td class="<%= status.equals("Active") ? "status-active" : "status-expired" %>"><%= status %></td>
                    <td>
                        <button class="renew-btn" 
                                <%= renewalRequests != null && renewalRequests.contains(certName) ? "disabled" : "" %> 
                                onclick="requestRenewal('<%= cert.getName() %>')">
                            <%= renewalRequests != null && renewalRequests.contains(certName) ? "Request Sent" : "Request Renewal" %>
                        </button>
                    </td>
                </tr>
                <% 
                        }
                    } else {
                %>
                <tr>
                    <td colspan="4" style="text-align: center;">No certifications found.</td>
                </tr>
                <% } %>
            </tbody>
        </table>

        <a href="addcertification.jsp" class="add-cert-btn">Add Certification</a>
        <a href="user.jsp" class="nav-link">BacktoDashboard</a>
    </div>

    <script>
        function requestRenewal(certName) {
            // AJAX call or form submission to request renewal
            alert("Renewal request sent for " + certName);
            // Optionally, update the renewal request state
        }
    </script>

</body>
</html>
