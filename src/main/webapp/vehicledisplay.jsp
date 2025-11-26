<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Vehicle List</title>
</head>
<body>
 <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', sans-serif;
            background-color: #d0d9e1;
            color: #333;
        }

        .header {
            background-color: black;
            color: white;
            padding: 20px;
            text-align: center;
        }

        .container {
            display: flex;
            min-height: 89vh;
        }
        
        .main-content {
    flex: 1;
    padding: 30px;
}


        .sidebar {
            width: 220px;
            background-color: #1c1c1c;
            color: #fff;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            padding: 20px 0;
        }

        .sidebar h2 {
            text-align: center;
            margin-bottom: 20px;
            font-size: 20px;
            border-bottom: 1px solid #444;
            padding-bottom: 10px;
        }

        .nav-links {
            flex-grow: 1;
        }

        .nav-links a {
            display: block;
            color: #ccc;
            padding: 12px 20px;
            text-decoration: none;
            transition: background 0.3s;
        }

        .nav-links a:hover {
            background-color: #444;
            color: #fff;
        }
       
        
        .footer {
            text-align: center;
            padding: 10px;
            font-size: 14px;
            color: #aaa;
            background-color: #111;
        }
        
        h3 {
  			font-size: 25px;
  			font-weight: bold;
  			padding: 13px 5px;
  			margin: 2px;
		}

		.btn-add {
 			padding: 10px;
  			margin: 10px;
			background-color: black;
			font-size: 15px;
			border-radius: 5px;
			color: #bcf5e7;
			cursor: pointer;
			text-decoration: none;
		}

		.btn-add:hover {
  			background-color: #169c7b;
		}
		
		.table-container {
    margin: 30px 30px;
    overflow-x: auto;
    background-color: #fff;
    padding: 20px;
    border-radius: 10px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.08);
}

table {
    width: 100%;
    border-collapse: collapse;
    font-size: 16px;
    color: #333;
    background-color: #fff;
}

th, td {
    padding: 14px 18px;
    text-align: center;
    border-bottom: 1px solid #ddd;
}

th {
    background-color: #1DCD9F;
    color: #fff;
    text-transform: uppercase;
    letter-spacing: 0.5px;
}

tr:hover {
    background-color: #f2f2f2;
}

td a {
    text-decoration: none;
    color: #1DCD9F;
    margin: 0 5px;
    font-weight: 500;
}

td a:hover {
    color: #138c70;
    text-decoration: underline;
}
td form {
    display: inline;
}

#ebutton, #dbutton, #vbutton{
    border: none;
    color: white;
    padding: 8px 12px;
    margin: 0 5px;
    border-radius: 4px;
    cursor: pointer;
    font-size: 14px;
}

#ebutton {
    background-color: #cccc00;
}

#ebutton:hover {
    background-color: #999900;
}

#dbutton {
    background-color: #e74c3c;
}

#dbutton:hover {
    background-color: #c0392b;
}

#vbutton {
    background-color: #1DCD9F;
}

#vbutton:hover {
    background-color: #138c70;
}

    </style>
</head>
<body>

	<div class="header">
    	<h1>Admin Dashboard</h1>
	</div>

	<div class="container">
   	 	<div class="sidebar">
        	<div class="nav-links">
            	<h2>Menu</h2>
            		<a href="">Home</a>
            		<a href="AdminDashboard.jsp">Admin Dashboard</a>
            		<a href="VehicleServlet">Manage Vehicle</a>
            		<a href="#">View Bookings</a>
            		<a href="ProfileServlet">Manage Users</a>
            		<a href="#">View Reports</a>
            		<a href="#">Settings</a>
            		<a href="SignoutServlet">Logout</a>
        	</div>
        <div class="footer">
            &copy; 2025 Admin Panel
        </div>
    </div>
    
    <div class="main-content">
    	<h3>List of Vehicle Details:</h3>
    	<a class="btn-add" href="vehicle.jsp" action="VehicleServlet" role="button" onclick="addVehicle()">Add New Vehicle</a>
    
    

    <div class="table-container">
    <h2 style="color: #111; padding-bottom: 10px;">Vehicle List</h2>
    
    
 	<table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Type</th>
                <th>Plate-Number</th>
                <th>Capacity</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
        	<c:forEach var="v" items="${vehicles}">
            <tr>
    			<td>${v.id}</td>
    			<td>${v.name}</td>
    			<td>${v.type}</td>
    			<td>${v.plateNumber}</td>
    			<td>${v.capacity}</td>
    		<td>
    			<form action="ViewVehicleServlet" method="post">
        				<input type="hidden" name="id" value="${v.id}">
        				<button id="vbutton" type="submit">View</button>
        			</form>
    			<form action="EditVehicleServlet" method="post">
        				<input type="hidden" name="id" value="${v.id}">
        				<button id="ebutton" type="submit">Edit</button>
        			</form>
        			<form action="DeleteVehicleServlet" method="post" onsubmit="return confirmDelete()">
        				<input type="hidden" name="id" value="${v.id}">
        				<button id="dbutton" type="submit">Delete</button>
        			</form> 

          	</td>
		</tr>
		</c:forEach>
        </tbody>
    </table>


	
</div>

</div>



<script>
  function addVehicle() {
    //Redirect to vehicle.jsp page
    {
      window.location.href = 'ViewVehicleServlet';
    }
  }
  
  function confirmDelete() {
	    return confirm("Are you sure you want to delete this vehicle?");
	  }
  </script>
</body>
</html>