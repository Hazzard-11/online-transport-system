package com.driver.Controller;

import com.driver.DAO.DriverDAO;
import com.driver.Model.Driver;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import javax.servlet.RequestDispatcher;

import java.io.IOException;
import java.util.List;

@WebServlet("/drivers") // URL pattern to trigger this servlet
public class DriverServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
	private DriverDAO driverDAO;

    @Override
    public void init() {
        driverDAO = new DriverDAO(); // initialize DAO
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<Driver> drivers = driverDAO.getAllDrivers(); // Retrieve all drivers
        request.setAttribute("driverList", drivers); // Attach list to request

        // Dispatch to JSP
        RequestDispatcher dispatcher = request.getRequestDispatcher("crud_driver.jsp");
        dispatcher.forward(request, response);
    }
}
