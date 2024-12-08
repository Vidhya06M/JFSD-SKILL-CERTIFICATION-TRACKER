<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Skill Certification Tracker - View Certificates</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: Arial, sans-serif;
            background-image: url('https://blog.imocha.io/hubfs/skills-tracking-software.webp');
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            margin: 0;
            height: 100vh;
        }

        /* Full-page container with white background */
        .container {
            width: 100%;
            height: 100vh; /* Full height of the viewport */
            background-color: rgba(255, 255, 255, 0.95); /* White with slight transparency */
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
        }

        h2 {
            color: #333;
            text-align: center;
            margin-bottom: 20px;
        }

        /* Align certificates grid centrally */
        .certificates-grid {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
            justify-content: center;
        }

        .certificate-card {
            width: 300px;
            border: 1px solid #ddd;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease;
            text-decoration: none;
            color: inherit;
        }

        .certificate-card:hover {
            transform: scale(1.05);
        }

        .certificate-card img {
            width: 100%;
            height: 200px;
            object-fit: cover;
        }

        .certificate-card .details {
            padding: 15px;
        }

        .certificate-card h3 {
            margin: 0 0 10px;
            font-size: 18px;
            color: #4CAF50;
        }

        .certificate-card p {
            margin: 0;
            font-size: 14px;
            color: #555;
        }

        /* Header Section */
        .header {
            width: 100%;
            background-color: rgba(76, 175, 80, 0.9);
            color: white;
            text-align: center;
            padding: 15px 0;
            position: fixed;
            top: 0;
            left: 0;
        }

        .header h1 {
            margin: 0;
        }

        .nav {
            position: absolute;
            top: 50%;
            right: 20px;
            transform: translateY(-50%);
        }

        .nav-link {
            color: white;
            text-decoration: none;
            margin-left: 20px;
            font-size: 16px;
            border: 2px solid white;
            padding: 5px 10px;
            border-radius: 4px;
            transition: background-color 0.3s ease;
        }

        .nav-link:hover {
            background-color: white;
            color: #4CAF50;
        }
    </style>
</head>
<body>

    <!-- Header Section -->
    <div class="header">
        <h1>Skill Certification Tracker</h1>
        <div class="nav">
            <a href="login.jsp" class="nav-link">Login</a>
            <a href="signup.jsp" class="nav-link">Signup</a>
        </div>
    </div>

    <!-- Main Content -->
    <div class="container">
        <h2>Manage Your Certifications</h2>
        <div class="certificates-grid">
            <!-- Certificate Card 1 -->
            <a href="https://pll.harvard.edu/series/professional-certificate-data-science" class="certificate-card" target="_blank">
                <img src="images/SPC One.jpg" alt="Data Science Certification">
                <div class="details">
                    <h3>Data Science Certification</h3>
                    <p>Issued by: Harvard University</p>
                </div>
            </a>

            <!-- Certificate Card 2 -->
            <a href="https://www.intel.com/content/www/us/en/developer/topic-technology/artificial-intelligence/training/overview.html" class="certificate-card" target="_blank">
                <img src="images/SPC Two.jpg" alt="AI Specialist Certification">
                <div class="details">
                    <h3>AI Specialist Certification</h3>
                    <p>Issued by: Udacity</p>
                </div>
            </a>

            <!-- Certificate Card 3 -->
            <a href="https://aws.amazon.com/certification/certified-ai-practitioner/" class="certificate-card" target="_blank">
                <img src="images/SPC Three.jpg" alt="Cloud Computing Certification">
                <div class="details">
                    <h3>Cloud Computing Certification</h3>
                    <p>Issued by: AWS</p>
                </div>
            </a>

            <!-- Certificate Card 4 -->
            <a href="https://learn.microsoft.com/en-us/credentials/certifications/azure-fundamentals/?practice-assessment-type=certification" class="certificate-card" target="_blank">
                <img src="images/SPC Four.jpg" alt="Microsoft Azure Certification">
                <div class="details">
                    <h3>Microsoft Azure Certification</h3>
                    <p>Issued by: Microsoft</p>
                </div>
            </a>

            <!-- Certificate Card 5 -->
            <a href="https://pathfinder.automationanywhere.com/university/certification/advanced" class="certificate-card" target="_blank">
                <img src="images/SPC FIVE.jpg" alt="RPA Certification">
                <div class="details">
                    <h3>RPA Certification</h3>
                    <p>Issued by: UiPath</p>
                </div>
            </a>

            <!-- Certificate Card 6 -->
            <a href="https://www.redhat.com/en/services/training-and-certification" class="certificate-card" target="_blank">
                <img src="images/SPC SIX.jpg" alt="Red Hat Certification">
                <div class="details">
                    <h3>Red Hat Certification</h3>
                    <p>Issued by: Red Hat</p>
                </div>
            </a>
        </div>
    </div>

</body>
</html>
