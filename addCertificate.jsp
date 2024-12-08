<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Certification - Skill Certification Tracker</title>
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
            max-width: 600px;
            margin: 30px auto;
            padding: 40px 20px;
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
        }

        label {
            margin: 10px 0 5px;
            font-weight: bold;
            color: #555;
        }

        input, button {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border-radius: 5px;
            border: 1px solid #ccc;
        }

        button {
            background-color: #4CAF50;
            color: white;
            border: none;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        button:hover {
            background-color: #45a049;
        }

        .nav-link {
            display: block;
            text-align: center;
            margin-top: 20px;
            text-decoration: none;
            color: #4CAF50;
        }
    </style>
</head>
<body>

    <div class="header">
        <h1>Add Certification</h1>
    </div>

    <div class="container">
        <!-- JSP form to submit certification details -->
        <form action="processCertificate.jsp" method="post" enctype="multipart/form-data">
            <label for="certName">Certification Name</label>
            <input type="text" id="certName" name="certName" placeholder="Enter certification name" required>

            <label for="expiryDate">Expiration Date</label>
            <input type="date" id="expiryDate" name="expiryDate" required>

            <label for="certFile">Upload Certificate</label>
            <input type="file" id="certFile" name="certFile" accept=".pdf,.jpg,.jpeg,.png" required>

            <button type="submit">Add Certification</button>
        </form>

        <a href="viewCertificate.jsp" class="nav-link">View All Certificates</a>
    </div>

</body>
</html>
