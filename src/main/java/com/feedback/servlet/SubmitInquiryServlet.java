package com.feedback.servlet;

import com.feedback.InquiryFeedback;
import com.feedback.InquiryFeedbackDAO;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/submitInquiry")
public class SubmitInquiryServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String role = request.getParameter("role");
        String message = request.getParameter("message");

        // Use constructor that matches your InquiryFeedback.java
        InquiryFeedback inquiry = new InquiryFeedback(name, email, role, message);

        InquiryFeedbackDAO dao = new InquiryFeedbackDAO();

        try {
            dao.insertInquiry(inquiry);
            System.out.println("✅ Inquiry inserted successfully.");
            response.sendRedirect("homepage.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("javax.servlet.error.exception", e);
            response.sendRedirect("error.jsp");
        }
    }
}
