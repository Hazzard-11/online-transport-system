<%@ page import="com.driver.Model.Driver" %>
<%
    Driver driver = (Driver) request.getAttribute("driver");
%>

<html>
<head>
    <title>Update Driver</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            line-height: 1.6;
            margin: 0;
            padding: 20px;
            background-color: #f5f5f5;
            color: #333;
        }
        .container {
            max-width: 800px;
            margin: 0 auto;
            background: white;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
        }
        h2 {
            color: #2c3e50;
            margin-top: 0;
            padding-bottom: 10px;
            border-bottom: 1px solid #eee;
        }
        .form-group {
            margin-bottom: 15px;
        }
        label {
            display: block;
            margin-bottom: 5px;
            font-weight: 600;
            color: #555;
        }
        input[type="text"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 16px;
            box-sizing: border-box;
        }
        input[type="text"]:focus {
            border-color: #3498db;
            outline: none;
            box-shadow: 0 0 5px rgba(52, 152, 219, 0.3);
        }
        .btn-submit {
            background-color: #3498db;
            color: white;
            border: none;
            padding: 12px 20px;
            font-size: 16px;
            border-radius: 4px;
            cursor: pointer;
            margin-top: 10px;
            transition: background-color 0.3s;
        }
        .btn-submit:hover {
            background-color: #2980b9;
        }
        .two-columns {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 20px;
        }
        @media (max-width: 600px) {
            .two-columns {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Update Driver</h2>
        <form action="updateDriver" method="post">
            <input type="hidden" name="id" value="<%= driver.getId() %>" />
            
            <div class="two-columns">
                <div class="form-group">
                    <label for="name">Name:</label>
                    <input type="text" id="name" name="name" value="<%= driver.getName() %>" required>
                </div>
                
                <div class="form-group">
                    <label for="gender">Gender:</label>
                    <input type="text" id="gender" name="gender" value="<%= driver.getGender() %>" required>
                </div>
                
                <div class="form-group">
                    <label for="dob">Date of Birth:</label>
                    <input type="text" id="dob" name="dob" value="<%= driver.getDateOfBirth() %>" required>
                </div>
                
                <div class="form-group">
                    <label for="phone">Phone:</label>
                    <input type="text" id="phone" name="phone" value="<%= driver.getPhone() %>" required>
                </div>
                
                <div class="form-group">
                    <label for="email">Email:</label>
                    <input type="text" id="email" name="email" value="<%= driver.getEmail() %>" required>
                </div>
                
                <div class="form-group">
                    <label for="address">Address:</label>
                    <input type="text" id="address" name="address" value="<%= driver.getAddress() %>" required>
                </div>
                
                <div class="form-group">
                    <label for="vehicleModel">Vehicle Model:</label>
                    <input type="text" id="vehicleModel" name="vehicleModel" value="<%= driver.getVehicleModel() %>" required>
                </div>
                
                <div class="form-group">
                    <label for="regNumber">Registration Number:</label>
                    <input type="text" id="regNumber" name="regNumber" value="<%= driver.getRegNumber() %>" required>
                </div>
                
                <div class="form-group">
                    <label for="vin">VIN:</label>
                    <input type="text" id="vin" name="vin" value="<%= driver.getVin() %>" required>
                </div>
                
                <div class="form-group">
                    <label for="years">Years Experience:</label>
                    <input type="text" id="years" name="years" value="<%= driver.getYears() %>" required>
                </div>
                
                <div class="form-group">
                    <label for="vehicleType">Vehicle Type:</label>
                    <input type="text" id="vehicleType" name="vehicleType" value="<%= driver.getVehicleType() %>" required>
                </div>
                
                <div class="form-group">
                    <label for="medical">Medical Status:</label>
                    <input type="text" id="medical" name="medical" value="<%= driver.getMedical() %>" required>
                </div>
                
                <div class="form-group">
                    <label for="accidents">Accidents:</label>
                    <input type="text" id="accidents" name="accidents" value="<%= driver.getAccidents() %>" required>
                </div>
            </div>
            
            <input type="submit" class="btn-submit" value="Update Driver">
        </form>
    </div>
</body>
</html>