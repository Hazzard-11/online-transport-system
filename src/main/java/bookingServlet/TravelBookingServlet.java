package bookingServlet;

import bookingDAO.BookingDAO;
import bookingModel.TravelBooking;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.annotation.WebServlet;

@WebServlet("/TravelBookingServlet/*")
public class TravelBookingServlet extends HttpServlet {
    private BookingDAO bookingDAO;

    public void init() {
        bookingDAO = new BookingDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String action = request.getPathInfo();
        
        try {
            if (action == null || action.equals("/") || action.equals("/list")) {
                listBookings(request, response);
            } else {
                switch (action) {
                    case "/new":
                        showNewForm(request, response);
                        break;
                    case "/insert":
                        insertBooking(request, response);
                        break;
                    case "/delete":
                        deleteBooking(request, response);
                        break;
                    case "/edit":
                        showEditForm(request, response);
                        break;
                    case "/update":
                        updateBooking(request, response);
                        break;
                    case "/search":
                        searchBooking(request, response);
                        break;
                    default:
                        listBookings(request, response);
                        break;
                }
            }
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }

    private void listBookings(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
        List<TravelBooking> list = bookingDAO.selectAllBookings();
        request.setAttribute("listBookings", list);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/bookinglist.jsp");
        dispatcher.forward(request, response);
    }

    private void showNewForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("/bookingform.jsp");
        dispatcher.forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        TravelBooking existing = bookingDAO.selectBooking(id);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/bookingform.jsp");
        request.setAttribute("booking", existing);
        dispatcher.forward(request, response);
    }

    private void insertBooking(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        TravelBooking booking = new TravelBooking();
        booking.setPickupLocation(request.getParameter("pickupLocation"));
        booking.setDestination(request.getParameter("destination"));
        booking.setRideDate(request.getParameter("rideDate"));
        booking.setRideTime(request.getParameter("rideTime"));
        booking.setVehicleType(request.getParameter("vehicleType"));
        booking.setPassengers(Integer.parseInt(request.getParameter("passengers")));
        booking.setPaymentMethod(request.getParameter("paymentMethod"));
        booking.setStatus("Pending");
        
        // Use the new method that returns the ID
        int newId = bookingDAO.insertBookingAndGetId(booking);
        
        // Redirect to show this specific booking
        response.sendRedirect(request.getContextPath() + "/TravelBookingServlet/search?id=" + newId);
    }

    private void updateBooking(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        TravelBooking booking = new TravelBooking();
        booking.setId(id);
        booking.setPickupLocation(request.getParameter("pickupLocation"));
        booking.setDestination(request.getParameter("destination"));
        booking.setRideDate(request.getParameter("rideDate"));
        booking.setRideTime(request.getParameter("rideTime"));
        booking.setVehicleType(request.getParameter("vehicleType"));
        booking.setPassengers(Integer.parseInt(request.getParameter("passengers")));
        booking.setPaymentMethod(request.getParameter("paymentMethod"));
        booking.setStatus("Pending");
        
        bookingDAO.updateBooking(booking);
        response.sendRedirect(request.getContextPath() + "/TravelBookingServlet/list");
    }

    private void deleteBooking(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        bookingDAO.deleteBooking(id);
        response.sendRedirect(request.getContextPath() + "/TravelBookingServlet/list");
    }

    private void searchBooking(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            TravelBooking booking = bookingDAO.selectBooking(id);
            
            if (booking != null) {
                request.setAttribute("booking", booking);
            } else {
                request.setAttribute("error", "Booking not found");
            }
            
            RequestDispatcher dispatcher = request.getRequestDispatcher("/bookinglist.jsp");
            dispatcher.forward(request, response);
        } catch (NumberFormatException e) {
            request.setAttribute("error", "Invalid booking ID");
            RequestDispatcher dispatcher = request.getRequestDispatcher("/bookinglist.jsp");
            dispatcher.forward(request, response);
        }
    }
}