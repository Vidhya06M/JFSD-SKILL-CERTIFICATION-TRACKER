<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Certificates - Skill Certification Tracker</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f0f0f0;
            margin: 0;
            padding: 20px;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
        }

        .header {
            text-align: center;
            background-color: #4CAF50;
            color: white;
            padding: 15px;
            margin-bottom: 20px;
        }

        .cert-list {
            max-width: 600px;
            margin: 0 auto;
            flex: 1;
        }

        .cert-item {
            background-color: white;
            padding: 15px;
            margin-bottom: 15px;
            border-radius: 10px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            display: grid;
            grid-template-columns: 1fr 1fr auto auto;
            align-items: center;
            column-gap: 20px;
        }

        .cert-item span {
            font-size: 16px;
            color: #333;
        }

        button {
            padding: 8px 12px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        button:hover {
            background-color: #45a049;
        }

        .delete-btn {
            background-color: #e74c3c;
        }

        .delete-btn:hover {
            background-color: #c0392b;
        }

        .back-link {
            display: block;
            text-align: center;
            margin-top: 20px;
            text-decoration: none;
            color: #4CAF50;
            font-weight: bold;
        }

        .back-link:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

    <div class="header">
        <h1>View Certificates</h1>
    </div>

    <div class="cert-list">
        <%
            // Simulating fetching data from the server (e.g., database)
            List<Map<String, String>> certifications = new ArrayList<>();
            Map<String, String> cert1 = new HashMap<>();
            cert1.put("name", "Java Certification");
            cert1.put("expirationDate", "2025-12-31");
            cert1.put("fileData", "cert1.pdf");
            certifications.add(cert1);

            Map<String, String> cert2 = new HashMap<>();
            cert2.put("name", "AWS Certification");
            cert2.put("expirationDate", "2026-06-30");
            cert2.put("fileData", "cert2.pdf");
            certifications.add(cert2);

            for (int i = 0; i < certifications.size(); i++) {
                Map<String, String> cert = certifications.get(i);
        %>
        <div class="cert-item">
            <span><%= cert.get("name") %></span>
            <span>Expires: <%= cert.get("expirationDate") %></span>
            <button onclick="downloadCertificate('<%= cert.get("fileData") %>')">Download</button>
            <button class="delete-btn" onclick="deleteCertificate(<%= i %>)">Delete</button>
        </div>
        <%
            }
        %>
    </div>

    <a href="user.jsp" class="back-link">Back to Dashboard</a>

    <script>
        function downloadCertificate(fileData) {
            const a = document.createElement('a');
            a.href = fileData;
            a.download = 'certificate';
            a.click();
        }

        function deleteCertificate(index) {
            // Deletion logic here (e.g., an AJAX request to the server)
            alert(`Certificate at index ${index} deleted.`);
        }
    </script>

</body>
</html>
