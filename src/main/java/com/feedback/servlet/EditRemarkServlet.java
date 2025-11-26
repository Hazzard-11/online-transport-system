package com.feedback.servlet;

import com.feedback.InquiryFeedback;
import com.feedback.InquiryFeedbackDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import javax.servlet.RequestDispatcher;
import java.io.IOException;

@WebServlet("/editRemark")
public class EditRemarkServlet extends HttpServlet {
    private InquiryFeedbackDAO dao;

    public void init() {
        dao = new InquiryFeedbackDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            String deleteFlag = request.getParameter("delete");

            if ("true".equalsIgnoreCase(deleteFlag)) {
                // Perform DELETE operation
                boolean success = dao.deleteEntry(id);
                if (success) {
                    System.out.println("✅ Deleted inquiry ID: " + id);
                } else {
                    System.out.println("⚠️ Failed to delete inquiry ID: " + id);
                }
                response.sendRedirect("viewFeedback");
            } else {
                // Normal edit behavior
                InquiryFeedback entry = dao.getById(id);
                request.setAttribute("entry", entry);
                RequestDispatcher dispatcher = request.getRequestDispatcher("editReply.jsp");
                dispatcher.forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }

}
