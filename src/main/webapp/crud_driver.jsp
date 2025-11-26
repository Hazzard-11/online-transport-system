<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="java.util.List"%>
<%@ page import="com.driver.Model.Driver"%>
<html>
<head>
<title>Driver List</title>
<style>
body {
	font-family: Arial, sans-serif;
	margin: 20px;
	line-height: 1.6;
}

.header {
	background-color: #ffffff; /* White header */
	padding: 20px;
	margin-bottom: 20px;
	border-bottom: 1px solid #e2e8f0; /* Light border */
	box-shadow: 0 1px 3px 0 rgba(0, 0, 0, 0.1), 0 1px 2px -1px
		rgba(0, 0, 0, 0.1); /* Subtle shadow */
}

.header h1 {
	margin: 0;
	color: #2d3748; /* Dark heading color */
	font-size: 1.875rem; /* Larger heading */
	font-weight: 600;
}

h2 {
	color: #333;
	margin-bottom: 20px;
}

table {
	width: 100%;
	border-collapse: collapse;
	table-layout: fixed;
}

th, td {
	padding: 10px 8px;
	border: 1px solid #ddd;
	text-align: left;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
}

th {
	background-color: #f8f9fa;
	font-weight: 600;
	color: #333;
}

tr:nth-child(even) {
	background-color: #f9f9f9;
}

tr:hover {
	background-color: #f1f1f1;
}

.actions {
	white-space: nowrap;
	width: 120px;
}

a.button {
	padding: 5px 10px;
	margin: 2px;
	text-decoration: none;
	color: white;
	border-radius: 4px;
	font-size: 13px;
	display: inline-block;
}

a.update {
	background-color: #4CAF50;
}

a.update:hover {
	background-color: #45a049;
}

a.delete {
	background-color: #f44336;
}

a.delete:hover {
	background-color: #d32f2f;
}

.no-data {
	text-align: center;
	padding: 20px;
	color: #666;
}

/* Column width adjustments */
th:nth-child(1), td:nth-child(1) {
	display: none;
} /* Hide ID column */
th:nth-child(2), td:nth-child(2) {
	width: 10%;
} /* Name */
th:nth-child(3), td:nth-child(3) {
	width: 6%;
} /* Gender */
th:nth-child(4), td:nth-child(4) {
	width: 8%;
} /* DOB */
th:nth-child(5), td:nth-child(5) {
	width: 8%;
} /* Phone */
th:nth-child(6), td:nth-child(6) {
	width: 12%;
} /* Address */
th:nth-child(7), td:nth-child(7) {
	width: 10%;
} /* Email */
th:nth-child(8), td:nth-child(8) {
	width: 8%;
} /* Vehicle Model */
th:nth-child(9), td:nth-child(9) {
	width: 8%;
} /* Reg Number */
th:nth-child(10), td:nth-child(10) {
	width: 8%;
} /* VIN */
th:nth-child(11), td:nth-child(11) {
	width: 5%;
} /* Years */
th:nth-child(12), td:nth-child(12) {
	width: 8%;
} /* Vehicle Type */
th:nth-child(13), td:nth-child(13) {
	width: 7%;
} /* Medical */
th:nth-child(14), td:nth-child(14) {
	width: 7%;
} /* Accidents */
th:nth-child(15), td:nth-child(15) {
	width: 15%;
} /* Actions */
</style>
</head>
<body>
	<header class="header">
		<h1>Admin Dashboard</h1>
	</header>

	<h2>All Drivers</h2>

	<table>
		<thead>
			<tr>
				<th>ID</th>
				<!-- This will be hidden but kept for data structure -->
				<th>Name</th>
				<th>Gender</th>
				<th>DOB</th>
				<th>Phone</th>
				<th>Address</th>
				<th>Email</th>
				<th>Vehicle Model</th>
				<th>Reg Number</th>
				<th>VIN</th>
				<th>Years</th>
				<th>Vehicle Type</th>
				<th>Medical</th>
				<th>Accidents</th>
				<th>Actions</th>
			</tr>
		</thead>
		<tbody>
			<%
			List<Driver> drivers = (List<Driver>) request.getAttribute("driverList");
			if (drivers != null && !drivers.isEmpty()) {
				for (Driver d : drivers) {
			%>
			<tr>
				<td><%=d.getId()%></td>
				<!-- Hidden column -->
				<td title="<%=d.getName()%>"><%=d.getName()%></td>
				<td><%=d.getGender()%></td>
				<td><%=d.getDateOfBirth()%></td>
				<td><%=d.getPhone()%></td>
				<td title="<%=d.getAddress()%>"><%=d.getAddress()%></td>
				<td title="<%=d.getEmail()%>"><%=d.getEmail()%></td>
				<td title="<%=d.getVehicleModel()%>"><%=d.getVehicleModel()%></td>
				<td><%=d.getRegNumber()%></td>
				<td title="<%=d.getVin()%>"><%=d.getVin()%></td>
				<td><%=d.getYears()%></td>
				<td><%=d.getVehicleType()%></td>
				<td><%=d.getMedical()%></td>
				<td><%=d.getAccidents()%></td>
				<td class="actions"><a href="editDriver?id=<%=d.getId()%>"
					class="button update">Update</a> <a
					href="deleteDriver?id=<%=d.getId()%>" class="button delete"
					onclick="return confirm('Are you sure you want to delete this driver?');">Delete</a>
				</td>
			</tr>
			<%
			}
			} else {
			%>
			<tr>
				<td colspan="15" class="no-data">No drivers found.</td>
			</tr>
			<%
			}
			%>
		</tbody>
	</table>

</body>
</html>