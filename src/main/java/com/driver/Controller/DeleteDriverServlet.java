package com.driver.Controller;

import com.driver.DAO.DriverDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import java.io.IOException;

@WebServlet("/deleteDriver")
public class DeleteDriverServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
	private DriverDAO driverDAO;

    @Override
    public void init() {
        driverDAO = new DriverDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));
        driverDAO.deleteDriver(id);

        response.sendRedirect("drivers"); // Redirect to list after deletion
    }
}
