package vehicle;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/EditVehicleServlet")
public class EditVehicleServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private VehicleDAO vehicleDAO;

    public void init() {
        vehicleDAO = new VehicleDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));

        Vehicle vehicle = vehicleDAO.getVehicleById(id);

        if (vehicle != null) {
            request.setAttribute("vehicle", vehicle);
            request.getRequestDispatcher("EditVehicle.jsp").forward(request, response);
        } else {
            request.setAttribute("errorMessage", "Vehicle not found.");
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }
}
