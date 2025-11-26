<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Details</title>
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
    font-family: 'Poppins', sans-serif;
}

body, html {
    height: 100%;
}

.Add-New-Page {
    height: 100vh;
    display: flex;
    justify-content: center;
    align-items: center;
    margin: 0;
    background: linear-gradient(135deg, #000000, #ffffff);
}

.add-user {
    flex: 1;
    max-width: 500px;
    border-radius: 40px;
    box-shadow: 0 8px 20px rgba(0, 0, 0, 0.3);
    overflow: hidden;
}

.form-header {
    padding: 30px;
    background-color: #0d5946;
    color: #e6b800;
    text-align: center;
    border-bottom: 1px solid #cccccc;
}

.form-header h2 {
    font-size: 26px;
    margin: 0;
}

.form-body {
    padding: 40px;
    background-color: #f0f3f5;
}

.input-group {
    margin-bottom: 20px;
}

.input-group input {
    width: 100%;
    padding: 10px;
    margin-top: 6px;
    border: 5px solid #ccc;
    border-radius: 5px;
    font-size: 15px;
}

.form-footer {
    display: flex;
    justify-content: flex-end;
    padding: 10px 10px;
    background-color: #f1f1f1;
    border-top: 1px solid #cccccc;
}

#submitBtn {
    padding: 10px 20px;
    background-color: #1BBA93;
    font-size: 16px;
    border: none;
    border-radius: 5px;
    color: white;
    cursor: pointer;
    transition: background-color 0.3s ease;
}

#submitBtn:hover {
    background-color: #169c7b;
}
</style>

</head>
<body>

<section class="Add-New-Page">
		
		<form class="add-user" name="editUserForm" action="UpdateProfileServlet" method="POST" onsubmit="return validateForm()">
		
		
		<div class="form-header">
				<h2> Edit User Details  </h2>
			</div>

	<div class="form-body">
	
		<input type="hidden" name="action" value="update">
		<input type="hidden" name="id" value="${users.id}">
	
		<div class="row">
			<div class="input-group">
				Fullname: <br>
				<input type = "text"  id="name" name="name" value="${users.name}" required><br><br>
			</div>

			<div class="row">
				<div class="input-group">
					Email: <br>
					<input type ="email" name="email" id="email" value="${users.email}" required>  <br> <br>
				</div>
			</div>

			<div class="row">
				<div class="input-group">
					Mobile-Number: <br>
					<input type="text" name="mobile" id="mobile" value="${users.mobile}" required><br><br>
				</div>
			</div>

			<div class="row">
				<div class="input-group">
					Username: <br>
					<input type="text" name="username" id="username" value="${users.username}" required><br><br>
				</div>
			</div>
			
			

			
			</div>

			<div class="form-footer">
				<input type="submit" id="submitBtn" value="Update">
			</div>

	</div>
		</form>
		
	</section>

</body>
</html>