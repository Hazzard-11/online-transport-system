<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sign Up Form</title>

<script>
    function validateForm() {
        var name = document.getElementById("name").value.trim();
        var email = document.getElementById("email").value.trim();
        var mobile = document.getElementById("mobile").value.trim();
        var username = document.getElementById("username").value.trim();

        // Basic checks
        if (name.length < 3) {
            alert("Full name must be at least 3 characters.");
            return false;
        }

        if (!/^\S+@\S+\.\S+$/.test(email)) {
            alert("Please enter a valid email address.");
            return false;
        }

        if (!/^\d{10}$/.test(mobile)) {
            alert("Mobile number must be exactly 10 digits.");
            return false;
        }

        if (username.length < 4) {
            alert("Username must be at least 4 characters long.");
            return false;
        }

        return true; // All checks passed
    }
</script>

<style>

* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
  color: #ffffff;
  list-style: none;
  text-decoration: none;
  font-family: Verdana, Geneva, Tahoma, sans-serif;
}

body, html {
  height: 100%;
}

.container {
  height: 100vh;
  background: linear-gradient(135deg, #000000, #ffffff);
  display: flex;
  justify-content: center;
  align-items: center;
  padding: 20px;
}


.login-form {
  background: rgba(0, 0, 0, 0.7);
  border-radius: 12px;
  padding: 40px;
  width: 100%;
  max-width: 500px;
  box-shadow: 0 0 20px rgba(255, 255, 255, 0.1);
  text-align: left;
}

.login-form h2 {
  text-align: center;
  color: rgb(230, 184, 0);
  margin-bottom: 30px;
}

.login-form label {
  display: block;
  margin-bottom: 5px;
  font-weight: bold;
}

.login-form input[type="text"],
.login-form input[type="email"],
.login-form input[type="number"],
.login-form input[type="password"] {
  width: 100%;
  padding: 10px;
  margin-bottom: 20px;
  border-radius: 7px;
  border: 1px solid #ccc;
  background-color: #fff;
  color: #000;
}
.login-form #role{
  width: 100%;
  padding: 10px;
  margin-bottom: 20px;
  border-radius: 7px;
  border: 1px solid #ccc;
  background-color: #fff;
  color: #000;
}
.login-form select option {
  color: #000;
  background-color: #fff;
}
.login-form button {
  width: 100%;
  padding: 10px;
  background-color: #1a6600;
  color: white;
  border: none;
  border-radius: 8px;
  font-weight: bold;
  text-transform: uppercase;
  cursor: pointer;
  transition: background-color 0.3s ease;
}

.login-form button:hover {
  background-color: rgb(0, 179, 60);
}

.account {
  text-align: center;
  margin-top: 20px;
}

.account a {
  color: crimson;
  text-decoration: none;
  transition: color 0.2s ease;
}

.account a:hover {
  color: rgb(255, 153, 153);
}

</style>
</head>
<body>

<div class="container">
  <form action="SignupServlet" method="POST" class="login-form">
    <h2>Sign Up Form</h2>
    
    <c:if test="${not empty errorMessage}">
  <div style="color: red; font-weight: bold; padding-bottom: 10px;">
    ${errorMessage}
  </div>
</c:if>

    <label for="fullname">Full Name</label>
    <input type="text" id="name" name="name" placeholder="Enter name" required>

    <label for="email">Email</label>
    <input type="email" id="email" name="email" placeholder="Enter email" required>

    <label for="mobile">Mobile</label>
    <input type="text" id="mobile" name="mobile" placeholder="Enter mobile number" maxlength="10" title="Only digits from 0-9,10 characters required" pattern="[0-9]{10}" required>
    
    <label for="fullname">Username</label>
    <input type="text" id="username" name="username" placeholder="Enter username" title="Username must be more than 3 characters long" required>

    <label for="password">Password</label>
    <input type="password" id="password" name="password" placeholder="Enter password" maxlength="8" required>
    
    <label for="role">Role</label>
    <select  id="role" name="role" required>
        <option value="" disabled selected>Select role</option>
        <option value="user">user</option>
        <option value="admin">admin</option>
        <option value="customerCare">Customer Care agent</option>
    </select>

    <button type="submit">Register</button>

    <div class="account">
      <p>Already have an account? <a href="Sign-in.jsp">Login</a></p>
    </div>
  </form>
</div>

</body>
</html>
