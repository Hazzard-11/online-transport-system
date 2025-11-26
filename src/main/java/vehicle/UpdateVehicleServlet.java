package vehicle;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/UpdateVehicleServlet")
public class UpdateVehicleServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private VehicleDAO vehicleDAO;

    public void init() {
        vehicleDAO = new VehicleDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            String name = request.getParameter("name");
            String type = request.getParameter("type");
            String plateNumber = request.getParameter("plateNumber");
            int capacity = Integer.parseInt(request.getParameter("capacity"));

            boolean success = vehicleDAO.updateVehicle(id, name, type, plateNumber, capacity);

            if (success) {
                // Reload updated vehicle list and forward to display page
                request.setAttribute("vehicles", vehicleDAO.getAllVehicles());
                request.getRequestDispatcher("vehicledisplay.jsp").forward(request, response);
            } else {
                request.setAttribute("errorMessage", "Vehicle update failed.");
                request.getRequestDispatcher("error.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "An error occurred while updating the vehicle.");
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }
}
