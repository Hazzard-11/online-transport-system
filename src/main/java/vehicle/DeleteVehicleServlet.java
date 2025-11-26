package vehicle;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/DeleteVehicleServlet")
public class DeleteVehicleServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private VehicleDAO vehicleDAO;

    public void init() {
        vehicleDAO = new VehicleDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        boolean success = vehicleDAO.deleteVehicle(id);

        if (success) {
            // Refresh vehicle list and redirect to display page
            request.setAttribute("vehicles", vehicleDAO.getAllVehicles());
            request.getRequestDispatcher("vehicledisplay.jsp").forward(request, response);
        } else {
            request.setAttribute("errorMessage", "Failed to delete vehicle.");
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }
}
