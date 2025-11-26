<%@ page import="com.feedback.InquiryFeedback" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="components/header.jsp" %>
<%@ include file="components/navbar.jsp" %>
<link rel="stylesheet" href="css/style.css" />

<%
    InquiryFeedback entry = (InquiryFeedback) request.getAttribute("entry");
%>
<html>
<head><title>Edit Remark</title></head>
<body>
<h2>Edit Remark for ID: <%= entry.getId() %></h2>
<form action="editRemark" method="post">
    <input type="hidden" name="id" value="<%= entry.getId() %>" />
    <textarea name="remark" rows="5" cols="40"><%= entry.getRemark() != null ? entry.getRemark() : "" %></textarea><br/>
    <input type="submit" value="Save Remark" />
</form>
</body>
</html>

<%@ include file="components/footer.jsp" %>