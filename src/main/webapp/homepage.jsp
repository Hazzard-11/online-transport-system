<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="components/header.jsp" %>
<%@ include file="components/navbar.jsp" %>
<html> 
<head> <meta charset="UTF-8"> 
<title style="animation: fadeInUp 1.2s ease-in-out; display:inline-block;">Online Transport System</title> 
<style> 
	.home-container { display: flex; justify-content: center; align-items: center; height: 80vh; padding-top: 30px; text-align: center; }
	    .welcome-text {
        font-size: 48px;
        font-weight: bold;
        color: #004085;
        animation: fadeInUp 1.2s ease-in-out;
    }

    @keyframes fadeInUp {
        from {
            opacity: 0;
            transform: translateY(40px);
        }
        to {
            opacity: 1;
            transform: translateY(0);
        }
    }
</style>
</head> 
<body> 
<div class="home-container"> 
<h1 class="welcome-text">Welcome to the Online Transport System</h1> 
</div>

<%@ include file="components/footer.jsp" %>
</body> 
</html>