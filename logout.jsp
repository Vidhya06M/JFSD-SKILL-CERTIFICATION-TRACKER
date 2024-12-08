<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    // Invalidate the session to log the user out
    session.invalidate();
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Logout - Skill Certification Tracker</title>
    <script>
        // Redirect to login page after logout
        window.location.href = "login.jsp";
    </script>
</head>
<body>
    <p>Logging out...</p>
</body>
</html>
