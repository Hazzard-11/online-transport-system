<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Vehicle Details</title>
<style>
    body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background-color: #f4f7f9;
        margin: 0;
        padding: 0;
    }

    .container {
        max-width: 700px;
        margin: 50px auto;
        background-color: #fff;
        padding: 30px 40px;
        border-radius: 12px;
        box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
    }

    h2 {
        text-align: center;
        margin-bottom: 30px;
        color: #2c3e50;
    }

    table {
        width: 100%;
        border-collapse: collapse;
    }

    td {
        padding: 12px 8px;
        font-size: 16px;
    }

    td:first-child {
        font-weight: bold;
        color: #34495e;
        width: 35%;
    }

    td:last-child {
        color: #2c3e50;
    }

    tr:not(:last-child) {
        border-bottom: 1px solid #ecf0f1;
    }
</style>
</head>
<body>
	<h2>Vehicle Details</h2>
		<table>
        <tr>
            <td><strong>ID:</strong></td>
            <td>${vehicle.id}</td>
        </tr>
        <tr>
            <td><strong>Vehicle Name:</strong></td>
            <td>${vehicle.name}</td>
        </tr>
        <tr>
            <td><strong>Vehicle Type:</strong></td>
            <td>${vehicle.type}</td>
        </tr>
        <tr>
            <td><strong>Vehicle Plate Number:</strong></td>
            <td>${vehicle.plateNumber}</td>
        </tr>
        <tr>
            <td><strong>Capacity:</strong></td>
            <td>${vehicle.capacity}</td>
        </tr>
    </table>
</body>
</html>