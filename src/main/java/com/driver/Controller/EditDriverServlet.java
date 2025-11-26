package com.driver.Controller;

import com.driver.DAO.DriverDAO;
import com.driver.Model.Driver;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import javax.servlet.RequestDispatcher;

import java.io.IOException;

@WebServlet("/editDriver")
public class EditDriverServlet extends HttpServlet {

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
        Driver driver = driverDAO.getDriverById(id);

        request.setAttribute("driver", driver);
        RequestDispatcher dispatcher = request.getRequestDispatcher("update_driver.jsp");
        dispatcher.forward(request, response);
    }
}

