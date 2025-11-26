<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Inter', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f7fafc; /* Light background */
            color: #1a202c; /* Dark text */
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
        }

        .header {
            background-color: #ffffff; /* White header */
            padding: 20px;
            margin-bottom: 20px;
            border-bottom: 1px solid #e2e8f0; /* Light border */
            box-shadow: 0 1px 3px 0 rgba(0, 0, 0, 0.1), 0 1px 2px -1px rgba(0, 0, 0, 0.1); /* Subtle shadow */
        }

        .header h1 {
            margin: 0;
            color: #2d3748; /* Dark heading color */
            font-size: 1.875rem; /* Larger heading */
            font-weight: 600;
        }

        .main-content {
            display: grid;
            grid-template-columns: 250px 1fr; /* Sidebar width, Main content width */
            gap: 20px;
        }

        .sidebar {
            background-color: #ffffff; /* White sidebar */
            padding: 20px;
            border-radius: 0.5rem; /* Rounded corners */
            box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -2px rgba(0, 0, 0, 0.1); /* Shadow */
        }

        .sidebar ul {
            list-style-type: none;
            padding: 0;
            margin: 0;
        }

        .sidebar li {
            margin-bottom: 15px;
        }

        .sidebar a {
            display: block;
            padding: 10px;
            text-decoration: none;
            color: #4a5568; /* Gray link color */
            font-weight: 500; /* Medium font weight */
            border-radius: 0.375rem; /* Rounded corners */
            transition: background-color 0.3s ease, color 0.3s ease; /* Smooth transition */
        }

        .sidebar a:hover {
            background-color: #f0f4f8; /* Light hover background */
            color: #2d3748; /* Darker hover text */
        }

        .sidebar a.active {
            background-color: #4299e1; /* Blue active background */
            color: #ffffff; /* White active text */
            font-weight: 600; /* Bold active text */
        }

        .dashboard-content {
            background-color: #ffffff; /* White content background */
            padding: 20px;
            border-radius: 0.5rem; /* Rounded corners */
            box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -2px rgba(0, 0, 0, 0.1); /* Shadow */
        }

        .dashboard-content h2 {
            margin-bottom: 20px;
            color: #2d3748; /* Dark heading */
            font-size: 1.5rem;
            font-weight: 600;
        }

        .card {
            background-color: #ffffff;
            padding: 20px;
            border-radius: 0.5rem;
            margin-bottom: 20px;
            box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -2px rgba(0, 0, 0, 0.1);
        }

        .card h3 {
            margin-top: 0;
            margin-bottom: 10px;
            color: #2d3748;
            font-size: 1.25rem;
            font-weight: 600;
        }

        .card p {
            margin: 0;
            color: #718096; /* Gray text */
        }

        .grid-container {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr)); /* Responsive grid */
            gap: 20px;
            margin-top: 20px;
        }
        .info-card {
             background-color: #ffffff;
            padding: 20px;
            border-radius: 0.5rem;
            margin-bottom: 20px;
            box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -2px rgba(0, 0, 0, 0.1);
            display: flex;
            align-items: center;
            gap: 1rem;
        }

        .info-card i{
            font-size: 2rem;
            color: #4299e1;
        }

         @media (max-width: 768px) {
            .main-content {
                grid-template-columns: 1fr; /* Stack on smaller screens */
            }
            .sidebar {
                margin-bottom: 20px;
            }
        }

        /* Add this CSS for the scrollable sections */
        .dashboard-content {
            overflow-y: auto;
            max-height: 500px; /* Adjust as needed */
            position: relative; /* Needed for absolute positioning of the scrollbar */
            padding-bottom: 70px; /* Add padding at the bottom for the scrollbar */
        }

        /* Style for the scrollbar */
        .dashboard-content::-webkit-scrollbar {
            width: 8px;  /* Width of the scrollbar */
        }

        .dashboard-content::-webkit-scrollbar-track {
            background: #f1f3f5;  /* Track background */
            border-radius: 0.5rem;
        }

        .dashboard-content::-webkit-scrollbar-thumb {
            background-color: #cbd5e0;  /* Color of the scrollbar thumb */
            border-radius: 0.5rem;
            border: 2px solid #f1f3f5;  /* Add a border to the thumb */
        }

        .dashboard-content::-webkit-scrollbar-thumb:hover {
            background-color: #a0aec0;  /* Hover color */
        }
        #users-section, #products-section, #orders-section, #settings-section{
            display: none;
        }
        .active-section{
            display: block;
        }

    </style>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" integrity="sha512-9usAa10IRO0HhonpyAIVpjrylPvoDwiPUiKdWk5t3PyolY1cOd4DSE0Ga+ri4AuTroPR5aQvXU9xC6qOPnzFeg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>
    <div class="container">

        <main class="main-content">
            <aside class="sidebar">
                <ul>
                    <li><a href="#dashboard-overview" class="active">Dashboard</a></li>
                    <li><a href="/drivers">Users</a></li>

                    <li><a href="#settings-section">Settings</a></li>
                </ul>
            </aside>
            <div class="dashboard-content">
            
                <%@ include file="crud_driver.jsp" %>
                
            </div>
        </main>
    </div>
    <script>
        document.querySelectorAll('.sidebar a').forEach(anchor => {
            anchor.addEventListener('click', function (e) {
                e.preventDefault();

                // Remove active class from all links
                document.querySelectorAll('.sidebar a').forEach(link => {
                    link.classList.remove('active');
                });

                // Add active class to the clicked link
                this.classList.add('active');

                // Hide all sections
                document.querySelectorAll('.dashboard-content > section').forEach(section => {
                    section.classList.remove('active-section');
                });

                // Show the selected section
                const targetId = this.getAttribute('href').substring(1); // Remove the '#'
                document.getElementById(targetId).classList.add('active-section');
            });
        });
    </script>
</body>
</html>
