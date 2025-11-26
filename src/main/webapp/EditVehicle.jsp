<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Vehicle Details</title>
<script>
		function validateForm() {
			const form = document.forms["addVehicleForm"];
				const name = document.forms["addVehicleForm"]["name"].value.trim();
				const type = document.forms["addVehicleForm"]["type"].value.trim();
				const plateNumber = document.forms["addVehicleForm"]["plateNumber"].value.trim();
				const capacity = document.forms["addVehicleForm"]["capacity"].value.trim();
				
				// Validate Name
				if (name === "") {
						window.alert("Name must be filled out.");
						return false;
				}
		
				// Validate Type
				if (type === "") {
						window.alert("Type must be filled out.");
						return false;
				}
		
				// Validate Plate Number
				if (plateNumber === "") {
						window.alert("Plate number must be filled out");
						return false;
        		}
				
				// Validate Capacity
				if (!capacity || isNaN(capacity) || parseInt(capacity) <= 0) {
					alert("Capacity must be a valid number.");
					return false;
				}
				// If all validations pass, allow form submission
				return true;
		}
		
		function afterEditing() {
			window.location.href = "UpdateVehicleServlet";
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

.add-vehicle {
    flex: 1;
    max-width: 500px;
    border-radius: 45px;
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
		
		<form class="add-vehicle" name="addVehicleForm" action="UpdateVehicleServlet" method="POST" onsubmit="return validateForm()">
		
		
		<div class="form-header">
				<h2> Edit Vehicle Details  </h2>
			</div>

	<div class="form-body">
	
		<input type="hidden" name="action" value="update">
		<input type="hidden" name="id" value="${vehicle.id}">
	
		<div class="row">
			<div class="input-group">
				Vehicle_Name: <br>
				<input type = "text"  id="name" name="name" value="${vehicle.name}" required><br><br>
			</div>

			<div class="row">
				<div class="input-group">
					Vehicle type: <br>
					<input type ="text" name="type" id="type" value="${vehicle.type}" required>  <br> <br>
				</div>
			</div>

			<div class="row">
				<div class="input-group">
					Plate-Number: <br>
					<input type="text" name="plateNumber" id="plateNumber" value="${vehicle.plateNumber}" required maxlength="7"><br><br>
				</div>
			</div>

			<div class="row">
				<div class="input-group">
					Capacity: <br>
					<input type="number" name="capacity" id="capacity" value="${vehicle.capacity}" required><br><br>
				</div>
			</div>

			
			</div>

			<div class="form-footer">
				<input type="submit" id="submitBtn" value="Update" onclick="afterEditing()">
			</div>

	</div>
		</form>
		
	</section>

</body>
</html>