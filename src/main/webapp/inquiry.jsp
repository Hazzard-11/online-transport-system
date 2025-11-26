<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ include file="components/header.jsp" %>
<%@ include file="components/navbar.jsp" %>
<link rel="stylesheet" href="css/style.css" />

<!DOCTYPE html>
<html>
<head>
    <title>Submit Inquiry / Feedback</title>
</head>
<body>
    <h2>Submit Inquiry or Feedback</h2>
    <form action="submitInquiry" method="post">
        Name: <input type="text" name="name" required /><br/>
        Email: <input type="email" name="email" required /><br/>
        Role:
        <select name="role" required>
            <option value="passenger">Passenger</option>
            <option value="driver">Driver</option>
        </select><br/>
        Message:<br/>
        <textarea name="message" rows="5" cols="40" required></textarea><br/>
        <input type="submit" value="Submit" />
    </form>
    <%
        if (request.getParameter("success") != null) {
            out.println("<p style='color:green;'>Feedback submitted successfully!</p>");
        }
    %>
</body>
</html>

<%@ include file="components/footer.jsp" %>