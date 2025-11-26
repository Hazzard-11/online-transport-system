package com.driver.Controller;

import com.driver.DAO.DriverDAO;
import com.driver.Model.Driver;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import java.io.IOException;

@WebServlet("/updateDriver")
public class UpdateDriverServlet extends HttpServlet {

    private DriverDAO driverDAO;

    @Override
    public void init() {
        driverDAO = new DriverDAO();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));

        Driver driver = new Driver();
        driver.setName(request.getParameter("name"));
        driver.setGender(request.getParameter("gender"));
        driver.setDateOfBirth(request.getParameter("dob"));
        driver.setPhone(request.getParameter("phone"));
        driver.setAddress(request.getParameter("address"));
        driver.setEmail(request.getParameter("email"));
        driver.setVehicleModel(request.getParameter("vehicleModel"));
        driver.setRegNumber(request.getParameter("regNumber"));
        driver.setVin(request.getParameter("vin"));
        driver.setYears(Integer.parseInt(request.getParameter("years")));
        driver.setVehicleType(request.getParameter("vehicleType"));
        driver.setMedical(request.getParameter("medical"));
        driver.setAccidents(request.getParameter("accidents"));

        driverDAO.updateDriver(id, driver);

        response.sendRedirect("drivers"); // Go back to list
    }
}

