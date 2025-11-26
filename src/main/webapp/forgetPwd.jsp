<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Forget Password</title>
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
  margin-bottom: 10px;
}

.login-form p {
  text-align: center;
  margin-bottom: 30px;
}

.login-form label {
  display: block;
  margin-bottom: 5px;
  font-weight: bold;
}

.login-form input[type="email"],
.login-form input[type="password"] {
  width: 100%;
  padding: 10px;
  margin-bottom: 20px;
  border-radius: 7px;
  border: 1px solid #ccc;
  background-color: #fff;
  color: #000;
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
  display: flex;
  justify-content: space-between;
  margin-top: 20px;
  font-size: 0.9em;
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
  <form action="ResetPasswordServlet" method="post" class="login-form">
    <h2>Forget Password?</h2>
    <p>Enter your registered email to reset the password.</p>

    <label for="email">Email</label>
    <input type="email" id="email" name="email" placeholder="Enter email" required>

    <label for="newpassword">New Password</label>
    <input type="password" id="newpassword" name="newpassword" placeholder="Enter new password" required>

    <label for="confirmpassword">Confirm Password</label>
    <input type="password" id="confirmpassword" name="confirmpassword" placeholder="Confirm password" required>

    <button type="submit">Reset</button>

    <div class="account">
      <div>
        <p>Not a member? <a href="Sign-Up.jsp">Sign Up</a></p>
      </div>
      <div>
        <p>Already have an account? <a href="Sign-in.jsp">Login</a></p>
      </div>
    </div>
  </form>
</div>

</body>
</html>
