<%@ page import="java.sql.*, java.security.MessageDigest" %>
<%
    String username = request.getParameter("username");
    String password = request.getParameter("password");

    // Hash the input password before checking against the stored one
    MessageDigest md = MessageDigest.getInstance("SHA-256");
    byte[] hashedPassword = md.digest(password.getBytes());
    StringBuilder hexString = new StringBuilder();
    for (byte b : hashedPassword) {
        String hex = Integer.toHexString(0xff & b);
        if (hex.length() == 1) hexString.append('0'); // Ensure leading zeros
        hexString.append(hex);
    }
    String hashedPwd = hexString.toString();

    Connection connection = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    String errorMessage = null;
    String redirectPage = "login.jsp";  // Default redirect on failure

    try {
        // Set up database connection
        Class.forName("com.mysql.cj.jdbc.Driver");
        connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/skill_certification_tracker", "root", "root");

        // Query to check if the user exists
        String sql = "SELECT * FROM users WHERE username = ? AND password = ?";
        ps = connection.prepareStatement(sql);
        ps.setString(1, username);
        ps.setString(2, hashedPwd);
        rs = ps.executeQuery();

        if (rs.next()) {
            // Login success: Check user role and redirect accordingly
            String role = rs.getString("role");
            if ("admin".equals(role)) {
                redirectPage = "adminDashboard.jsp";  // Admin page redirection
            } else {
                redirectPage = "userDashboard.jsp";  // User page redirection
            }
            session.setAttribute("username", username);  // Set session attribute for username
            session.setAttribute("role", role);  // Set session attribute for user role
        } else {
            errorMessage = "Invalid username or password!";
        }
    } catch (Exception e) {
        e.printStackTrace();
        errorMessage = "Error: " + e.getMessage();
    } finally {
        try {
            if (rs != null) rs.close();
            if (ps != null) ps.close();
            if (connection != null) connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    if (errorMessage != null) {
        request.setAttribute("message", errorMessage);
        request.getRequestDispatcher("login.jsp").forward(request, response);
    } else {
        response.sendRedirect(redirectPage);
    }
%>
