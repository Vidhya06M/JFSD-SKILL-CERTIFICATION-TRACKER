<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Signup - Skill Certification Tracker</title>
    <style>
        /* CSS styling */
        body { font-family: Arial, sans-serif; background-color: #f4f4f4; margin: 0; padding: 0; }
        .header { background-color: #4CAF50; color: white; padding: 15px; text-align: center; }
        .container { max-width: 400px; margin: 50px auto; padding: 20px; background-color: white; 
                     border-radius: 8px; box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); }
        label { display: block; margin: 10px 0 5px; }
        input, select { width: 100%; padding: 10px; margin-bottom: 10px; border: 1px solid #ddd; border-radius: 4px; }
        button { width: 100%; padding: 10px; background-color: #4CAF50; color: white; border: none; cursor: pointer; }
        button:hover { background-color: #45a049; }
        .error { color: red; margin-bottom: 10px; text-align: center; }
    </style>
    <script>
        // Password strength validation
        document.addEventListener("DOMContentLoaded", function () {
            document.getElementById('password').addEventListener('input', function () {
                var password = this.value;
                var message = '';
                if (password.length < 8) {
                    message = 'Password must be at least 8 characters long.';
                } else if (!/[A-Z]/.test(password)) {
                    message = 'Password must contain at least one uppercase letter.';
                } else if (!/[a-z]/.test(password)) {
                    message = 'Password must contain at least one lowercase letter.';
                } else if (!/\d/.test(password)) {
                    message = 'Password must contain at least one number.';
                } else {
                    message = 'Password is strong.';
                }
                document.getElementById('passwordMessage').innerText = message;
            });
        });
    </script>
</head>
<body>

    <div class="header">
        <h1>Skill Certification Tracker - Signup</h1>
    </div>

    <div class="container">
        <h2>Signup</h2>
        <div class="error">
            <% 
                // Display error or success message if available
                String message = (String) request.getAttribute("message");
                if (message != null) {
                    out.println(message);
                }
            %>
        </div>
        <form action="processSignup.jsp" method="post">
            <label for="username">Username</label>
            <input type="text" name="username" id="username" placeholder="Enter your username" required>

            <label for="email">Email</label>
            <input type="email" name="email" id="email" placeholder="Enter your email" required>

            <label for="password">Password</label>
            <input type="password" name="password" id="password" placeholder="Enter your password" required>

            <div id="passwordMessage"></div>

            <label for="role">Select Role</label>
            <select name="role" id="role" required>
                <option value="user">User</option>
                <option value="admin">Admin</option>
            </select>

            <button type="submit">Signup</button>
        </form>
    </div>

</body>
</html>
