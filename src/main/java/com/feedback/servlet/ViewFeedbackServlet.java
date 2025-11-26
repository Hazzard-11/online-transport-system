package com.feedback.servlet;

import com.feedback.InquiryFeedback;
import com.feedback.InquiryFeedbackDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import javax.servlet.RequestDispatcher;
import java.io.IOException;
import java.util.List;

@WebServlet("/viewFeedback")
public class ViewFeedbackServlet extends HttpServlet {
    private InquiryFeedbackDAO dao;

    public void init() {
        dao = new InquiryFeedbackDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            List<InquiryFeedback> list = dao.getAllFeedback();
            request.setAttribute("feedbackList", list);
            RequestDispatcher dispatcher = request.getRequestDispatcher("feedback.jsp");
            dispatcher.forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }
}
