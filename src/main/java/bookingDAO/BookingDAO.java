package bookingDAO;

import java.sql.*;
import java.util.*;
import bookingModel.TravelBooking;

public class BookingDAO {
    private String jdbcURL = "jdbc:mysql://localhost:3306/travelbooking?useSSL=false&serverTimezone=UTC";
    private String jdbcUsername = "root";
    private String jdbcPassword = "root";

    private static final String INSERT_SQL = "INSERT INTO travel_bookings " +
            "(pickup_location, destination, ride_date, ride_time, vehicle_type, passengers, payment_method, status) " +
            "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
    
    private static final String SELECT_BY_ID = "SELECT * FROM travel_bookings WHERE id = ?";
    private static final String SELECT_ALL = "SELECT * FROM travel_bookings";
    private static final String DELETE_SQL = "DELETE FROM travel_bookings WHERE id = ?";
    private static final String UPDATE_SQL = "UPDATE travel_bookings SET " +
            "pickup_location=?, destination=?, ride_date=?, ride_time=?, " +
            "vehicle_type=?, passengers=?, payment_method=?, status=? WHERE id=?";

    static {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new ExceptionInInitializerError("MySQL JDBC Driver not found");
        }
    }

    protected Connection getConnection() throws SQLException {
        return DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
    }

    public int insertBookingAndGetId(TravelBooking booking) throws SQLException {
        try (Connection conn = getConnection(); 
             PreparedStatement stmt = conn.prepareStatement(INSERT_SQL, Statement.RETURN_GENERATED_KEYS)) {
            
            stmt.setString(1, booking.getPickupLocation());
            stmt.setString(2, booking.getDestination());
            stmt.setString(3, booking.getRideDate());
            stmt.setString(4, booking.getRideTime());
            stmt.setString(5, booking.getVehicleType());
            stmt.setInt(6, booking.getPassengers());
            stmt.setString(7, booking.getPaymentMethod());
            stmt.setString(8, booking.getStatus());
            stmt.executeUpdate();
            
            try (ResultSet generatedKeys = stmt.getGeneratedKeys()) {
                if (generatedKeys.next()) {
                    return generatedKeys.getInt(1);
                }
            }
        }
        throw new SQLException("Creating booking failed, no ID obtained.");
    }

    public TravelBooking selectBooking(int id) throws SQLException {
        TravelBooking booking = null;
        try (Connection conn = getConnection(); 
             PreparedStatement stmt = conn.prepareStatement(SELECT_BY_ID)) {
            
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();
            
            if (rs.next()) {
                booking = new TravelBooking();
                booking.setId(rs.getInt("id"));
                booking.setPickupLocation(rs.getString("pickup_location"));
                booking.setDestination(rs.getString("destination"));
                booking.setRideDate(rs.getString("ride_date"));
                booking.setRideTime(rs.getString("ride_time"));
                booking.setVehicleType(rs.getString("vehicle_type"));
                booking.setPassengers(rs.getInt("passengers"));
                booking.setPaymentMethod(rs.getString("payment_method"));
                booking.setStatus(rs.getString("status"));
            }
        }
        return booking;
    }
    
    public int getLastInsertedId() throws SQLException {
        try (Connection conn = getConnection();
             Statement stmt = conn.createStatement()) {
            ResultSet rs = stmt.executeQuery("SELECT LAST_INSERT_ID()");
            if (rs.next()) {
                return rs.getInt(1);
            }
            return -1;
        }
    }

    public List<TravelBooking> selectAllBookings() throws SQLException {
        List<TravelBooking> bookings = new ArrayList<>();
        try (Connection conn = getConnection(); 
             PreparedStatement stmt = conn.prepareStatement(SELECT_ALL)) {
            
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                TravelBooking booking = new TravelBooking();
                booking.setId(rs.getInt("id"));
                booking.setPickupLocation(rs.getString("pickup_location"));
                booking.setDestination(rs.getString("destination"));
                booking.setRideDate(rs.getString("ride_date"));
                booking.setRideTime(rs.getString("ride_time"));
                booking.setVehicleType(rs.getString("vehicle_type"));
                booking.setPassengers(rs.getInt("passengers"));
                booking.setPaymentMethod(rs.getString("payment_method"));
                booking.setStatus(rs.getString("status"));
                bookings.add(booking);
            }
        }
        return bookings;
    }

    public boolean deleteBooking(int id) throws SQLException {
        try (Connection conn = getConnection(); 
             PreparedStatement stmt = conn.prepareStatement(DELETE_SQL)) {
            
            stmt.setInt(1, id);
            return stmt.executeUpdate() > 0;
        }
    }

    public boolean updateBooking(TravelBooking booking) throws SQLException {
        try (Connection conn = getConnection(); 
             PreparedStatement stmt = conn.prepareStatement(UPDATE_SQL)) {
            
            stmt.setString(1, booking.getPickupLocation());
            stmt.setString(2, booking.getDestination());
            stmt.setString(3, booking.getRideDate());
            stmt.setString(4, booking.getRideTime());
            stmt.setString(5, booking.getVehicleType());
            stmt.setInt(6, booking.getPassengers());
            stmt.setString(7, booking.getPaymentMethod());
            stmt.setString(8, booking.getStatus());
            stmt.setInt(9, booking.getId());
            
            return stmt.executeUpdate() > 0;
        }
    }
}