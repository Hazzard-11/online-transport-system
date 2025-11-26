<%@ page import="java.util.*, com.feedback.InquiryFeedback" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="components/header.jsp" %>
<%@ include file="components/navbar.jsp" %>
<link rel="stylesheet" href="css/style.css" />

<html>
<head><title>Feedback Management</title></head>
<body>
<h2>Inquiry & Feedback List</h2>
<table border="1">
    <tr>
        <th>ID</th><th>Name</th><th>Email</th><th>Role</th><th>Message</th><th>Status</th><th>Remark</th><th>Action</th>
    </tr>
<%
    List<InquiryFeedback> list = (List<InquiryFeedback>) request.getAttribute("feedbackList");
    for (InquiryFeedback fb : list) {
%>
    <tr>
        <td><%= fb.getId() %></td>
        <td><%= fb.getSenderName() %></td>
        <td><%= fb.getSenderEmail() %></td>
        <td><%= fb.getSenderRole() %></td>
        <td><%= fb.getMessage() %></td>
        <td><%= fb.getStatus() %></td>
        <td><%= fb.getRemark() == null ? "-" : fb.getRemark() %></td>
        <td>
            <a href="editRemark?id=<%= fb.getId() %>">Edit</a> |
            <a href="editRemark?id=<%= fb.getId() %>&delete=true" onclick="return confirm('Delete this entry?');">Delete</a>
        </td>
    </tr>
<% } %>
</table>
</body>
</html>

<%@ include file="components/footer.jsp" %>