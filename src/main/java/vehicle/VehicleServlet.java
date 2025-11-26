package vehicle;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/VehicleServlet")
public class VehicleServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    private VehicleDAO vehicleDAO;

    public void init() {
    	vehicleDAO = new VehicleDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
   
    		try {
    	        String name = request.getParameter("name");
    	        String type = request.getParameter("type");
    	        String plateNumber = request.getParameter("plateNumber");
    	        int capacity = Integer.parseInt(request.getParameter("capacity"));

    	        boolean success = vehicleDAO.insertVehicle(name, type, plateNumber, capacity);

    	        if (success) {
    	        	List<Vehicle> vehicleList = vehicleDAO.getAllVehicles();
    	            request.setAttribute("vehicles", vehicleList);
    	            request.getRequestDispatcher("vehicledisplay.jsp").forward(request, response);
    	        } else {
    	            response.sendRedirect("error.jsp");
    	        }
    	    } catch (Exception e) {
    	        e.printStackTrace(); // Log error
    	        response.sendRedirect("error.jsp");
    	    }
 }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Vehicle> vehicleList = vehicleDAO.getAllVehicles();
        request.setAttribute("vehicles", vehicleList);
        request.getRequestDispatcher("vehicledisplay.jsp").forward(request, response);
    }
    
}
