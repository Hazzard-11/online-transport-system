<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sign-In Form</title>
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
.login-form input[type="password"],
 .login-form select{
  width: 100%;
  padding: 10px;
  margin-bottom: 20px;
  border-radius: 6px;
  border: 1px solid #ccc;
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
  background-color: #00b33c;
}

.login-form .links {
  margin-top: 20px;
  display: flex;
  justify-content: space-between;
  font-size: 0.9em;
}

.login-form .links a {
  color: crimson;
  transition: color 0.2s ease;
  text-decoration: none;
}

.login-form .links a:hover {
  color: rgb(255, 153, 153);
}

</style>
</head>
<body>

<div class="container">
  <form action="SigninServlet" method="post" class="login-form">
    <h2>Sign-In Form</h2>

	<c:if test="${not empty errorMessage}">
  <div style="color: red; font-weight: bold; padding-bottom: 10px;">
    ${errorMessage}
  </div>
</c:if>

    <label for="username">Username</label>
    <input type="text" id="username" name="username" placeholder="Enter username" title="Username must be more than 3 characters long" required>

    <label for="password">Password</label>
    <input type="password" id="password" name="password" placeholder="Enter password" maxlength="8" required>

    <label for="role">Role</label>
    <select id="role" name="role" required>
      <option value="" disabled selected>Select role</option>
      <option value="user">User</option>
      <option value="admin">Admin</option>
      <option value="customerCare">Customer Care Agent</option>
    </select>

    <button type="submit">Login</button>

    <div class="links">
      <div>
        <p>Forgot Password?</p>
        <a href="forgetPwd.jsp">Click here</a>
      </div>
      <div>
        <p>Don't have an account?</p>
        <a href="Sign-Up.jsp">Sign Up</a>
      </div>
    </div>
</form>

</div>

</body>
</html>
