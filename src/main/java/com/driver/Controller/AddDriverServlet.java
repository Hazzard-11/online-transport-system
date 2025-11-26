package com.driver.Controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.driver.Model.Driver;
import com.driver.DAO.DriverDAO;

import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet("/submit-driver")
public class AddDriverServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private DriverDAO driverDAO;
    private static final Logger logger = Logger.getLogger(AddDriverServlet.class.getName());

    @Override
    public void init() {
        try {
            driverDAO = new DriverDAO();
            logger.log(Level.INFO, "DriverDAO initialized successfully");
        } catch (Exception e) {
            logger.log(Level.SEVERE, "Error initializing DriverDAO", e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        logger.log(Level.INFO, "Received driver registration request");

        // Log all received parameters for debugging
        logRequestParameters(request);

        Driver driver = new Driver();
        try {
            // Set driver properties from request parameters
            driver.setName(request.getParameter("name"));
            driver.setGender(request.getParameter("gender"));
            driver.setDateOfBirth(request.getParameter("dateOfBirth"));
            driver.setPhone(request.getParameter("phone"));
            driver.setAddress(request.getParameter("address"));
            driver.setEmail(request.getParameter("email"));
            driver.setVehicleModel(request.getParameter("vehicleModel"));
            driver.setRegNumber(request.getParameter("regNumber"));
            driver.setVin(request.getParameter("vin"));

            String yearsParam = request.getParameter("years");
            try {
                driver.setYears((yearsParam != null && !yearsParam.isEmpty()) ? Integer.parseInt(yearsParam) : 0);
            } catch (NumberFormatException e) {
                logger.log(Level.WARNING, "Invalid years format: {0}, defaulting to 0", yearsParam);
                driver.setYears(0);
            }

            driver.setVehicleType(request.getParameter("vehicleType"));
            driver.setMedical(request.getParameter("medical"));
            driver.setAccidents(request.getParameter("accidents"));

            logger.log(Level.INFO, "Attempting to save driver: {0}", driver.toString());

            boolean isSuccess = driverDAO.saveDriver(driver);

            response.setContentType("text/html");
            response.setCharacterEncoding("UTF-8");

            if (isSuccess) {
                logger.log(Level.INFO, "Driver successfully saved: {0}", driver.getName());
                response.getWriter().write("<script type='text/javascript'>"
                    + "alert('Driver successfully added!');"
                    + "window.location.href = 'index.jsp';"
                    + "</script>");
            } else {
                logger.log(Level.SEVERE, "Failed to save driver: {0}", driver.getName());
                response.getWriter().write("<script type='text/javascript'>"
                    + "alert('An error occurred while saving the driver.');"
                    + "window.location.href = 'index.jsp';"
                    + "</script>");
            }

        } catch (Exception e) {
            logger.log(Level.SEVERE, "Unexpected error processing driver registration", e);
            response.getWriter().write("<script type='text/javascript'>"
                + "alert('An unexpected error occurred. Please try again.');"
                + "window.location.href = 'index.jsp';"
                + "</script>");
        }
    }

    private void logRequestParameters(HttpServletRequest request) {
        StringBuilder params = new StringBuilder("Request Parameters:\n");
        request.getParameterMap().forEach((key, values) -> {
            params.append(key).append(": ");
            for (String value : values) {
                params.append(value).append(" ");
            }
            params.append("\n");
        });
        logger.log(Level.FINE, params.toString());
    }
}