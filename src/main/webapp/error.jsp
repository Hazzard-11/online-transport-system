<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ include file="components/header.jsp" %>
<%@ include file="components/navbar.jsp" %>
<link rel="stylesheet" href="css/style.css" />

<!DOCTYPE html>
<html>
<head><title>Error</title></head>
<body>
    <h2 style="color:red;">Something went wrong!</h2>
    <p>Please go back and try again.</p>
</body>
</html>

<%
    Exception ex = (Exception) request.getAttribute("javax.servlet.error.exception");
    if (ex != null) {
        out.println("<h3 style='color:red;'>Internal Error:</h3>");
        out.println("<pre>");
        ex.printStackTrace(new java.io.PrintWriter(out));
        out.println("</pre>");
    }
%>

<%@ include file="components/footer.jsp" %>