<%@ page import="java.io.*, javax.servlet.*, javax.servlet.http.*, java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Process Certification</title>
</head>
<body>
    <%
        // Get form parameters
        String certName = request.getParameter("certName");
        String expiryDate = request.getParameter("expiryDate");
        Part certFile = request.getPart("certFile");

        // Define path to save the file
        String uploadPath = application.getRealPath("") + File.separator + "uploads";
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) uploadDir.mkdir();

        // Save the uploaded file
        String fileName = certFile.getSubmittedFileName();
        String filePath = uploadPath + File.separator + fileName;
        certFile.write(filePath);

        // Database connection
        String dbURL = "jdbc:mysql://localhost:3306/yourDatabase";
        String dbUser = "root";
        String dbPassword = "admin";
        Connection conn = null;

        try {
            // Connect to database
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);

            // Insert certificate details into the database
            String sql = "INSERT INTO Certificates (certName, expiryDate, filePath) VALUES (?, ?, ?)";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, certName);
            statement.setString(2, expiryDate);
            statement.setString(3, "uploads/" + fileName);

            int row = statement.executeUpdate();

            if (row > 0) {
                session.setAttribute("message", "Certification '" + certName + "' added successfully!");
            } else {
                session.setAttribute("message", "Failed to add certification.");
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
            }
        }

        // Redirect to the "View All Certificates" page
        response.sendRedirect("viewCertificate.jsp");
    %>
</body>
</html>
