<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard</title>
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

        .main-content {
            flex: 1;
            padding: 30px;
        }

        .grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(240px, 1fr));
            gap: 20px;
            margin-top: 20px;
        }

        .card {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.08);
        }

        .card h3 {
            margin-bottom: 10px;
            font-size: 18px;
        }

        .card p {
            font-size: 16px;
        }
        
        .wide-card {
            grid-column: span 2;
            height: auto;
        }

        .footer {
            text-align: center;
            padding: 10px;
            font-size: 14px;
            color: #aaa;
            background-color: #111;
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
            <a href = "home.jsp">Home</a>
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
        <h2>Welcome, Admin!</h2>
        <p>Here’s an overview of your system statistics:</p>
        <div class="grid">
            <div class="card">
                <h3>Total Vehicles</h3>
                <p>10</p>
            </div>
            <div class="card">
                <h3>Today's Bookings</h3>
                <p>12</p>
            </div>
            <div class="card">
                <h3>Active Users</h3>
                <p>21</p>
            </div>
            <div class="card">
                <h3>Pending Approvals</h3>
                <p>5</p>
            </div>
            <div class="card">
                <h3>Monthly Revenue</h3>
                <p>Rs.12,500</p>
            </div>
            <div class="card">
                <h3>Reports Generated</h3>
                <p>8</p>
            </div>
            <div class="card wide-card">
                <h3>System Alerts</h3>
                <p>No critical issues reported. All systems operational.</p>
            </div>
	 	  
	 	  <div class="card wide-card">
                <h3>Quick Actions</h3>
                <p>
                    <a href="vehicle.jsp">➕ Add Vehicle</a> |
                    <a href="ProfileServlet">👥 Manage Users</a> |
                    <a href="#">📄 Generate Report</a>
                </p>
            </div>
            
        </div>
    </div>
    
    
</div>

</body>
</html>
