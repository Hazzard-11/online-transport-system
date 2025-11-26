package vehicle;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import util.DBConnection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


public class VehicleDAO {
    public boolean insertVehicle(String name, String type, String plateNumber, int capacity) {
        Connection conn = null;
        PreparedStatement stmt = null;
        boolean success = false;
        
        try {
            conn = DBConnection.getConnection();
            String sql = "INSERT INTO Vehicle (name, type, plateNumber, capacity) VALUES (?, ?, ?, ?)";
            
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, name);
            stmt.setString(2, type);
            stmt.setString(3, plateNumber);
            stmt.setInt(4, capacity);
            
            
            int rowsInserted = stmt.executeUpdate();
            
            if (rowsInserted > 0) {
                success = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (stmt != null) {
                    stmt.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        
        return success;
    }
    
    
    public Vehicle getVehicleByDetails(String name, String type, String plateNumber, int capacity) {
    	Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        Vehicle vehicle = null;
         
        try {
            conn = DBConnection.getConnection();
            String sql = "SELECT id, name, type, plateNumber, capacity FROM Vehicle WHERE name=? AND type=? AND plateNumber=? AND capacity=?";
            stmt = conn.prepareStatement(sql);
             
            stmt.setString(1, name);
            stmt.setString(2, type);
            stmt.setString(3, plateNumber);
            stmt.setInt(4, capacity);
            
             
            rs = stmt.executeQuery();
             
            if (rs != null && rs.next()) {
            	int id = rs.getInt("id");
            	 vehicle = new Vehicle(
            		id,
            		rs.getString("name"),
            		rs.getString("type"),
            		rs.getString("plateNumber"),
            		rs.getInt("capacity")
            		
                 );
             }
         
        } catch (SQLException e) {
             e.printStackTrace();
        } finally {
        	try {
        		if (rs != null) {
                    rs.close();
                }
                if (stmt != null) {
                    stmt.close();
                }
                if (conn != null) {
                    conn.close();
                }
        	} catch (SQLException e) {
        		e.printStackTrace();
            }
        }
         
        return vehicle;
    }
    public Vehicle getVehicleById(int id) {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        Vehicle vehicle = null;
         
        try {
            conn = DBConnection.getConnection();
            String sql = "SELECT name, type, plateNumber, capacity FROM Vehicle WHERE id=?";
            stmt = conn.prepareStatement(sql);
             
            stmt.setInt(1, id);
             
            rs = stmt.executeQuery();
             
            if (rs != null && rs.next()) {
            	 vehicle = new Vehicle(
                    id,
                    rs.getString("name"),
                    rs.getString("type"),
                    rs.getString("plateNumber"),
                    rs.getInt("capacity")
                    
                );
            }
        } catch (SQLException e) {
             e.printStackTrace();
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (stmt != null) {
                    stmt.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
         
        return vehicle;
    }
    
    public boolean updateVehicle(int id, String name, String type, String plateNumber, int capacity) {
        Connection conn = null;
        PreparedStatement stmt = null;
        boolean success = false;
        
        try {
            conn = DBConnection.getConnection();
            
            String sql = "UPDATE Vehicle SET name=?, type=?, plateNumber=?, capacity=? WHERE id=?";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, name);
            stmt.setString(2, type);
            stmt.setString(3, plateNumber);
            stmt.setInt(4, capacity);
            stmt.setInt(5, id);
            
            int rowsUpdated = stmt.executeUpdate();
            
            if (rowsUpdated > 0) {
                success = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (stmt != null) {
                    stmt.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        
        return success;
    }
    
    public boolean deleteVehicle(int id) {
        Connection conn = null;
        PreparedStatement stmt = null;
        boolean success = false;
        
        try {
            conn = DBConnection.getConnection();
          
            String sql = "DELETE FROM Vehicle WHERE id=?";
            stmt = conn.prepareStatement(sql);
            
            stmt.setInt(1, id);
            
            int rowsDeleted = stmt.executeUpdate();
            
            if (rowsDeleted > 0) {
                success = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (stmt != null) {
                    stmt.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        
        return success;
    }
    
    public static List<Vehicle> getAllVehicles() {
        List<Vehicle> vehicles = new ArrayList<>();
        String sql = "SELECT id, name, type, plateNumber, capacity FROM Vehicle";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                vehicles.add(new Vehicle(
                    rs.getInt("id"),
                    rs.getString("name"),
                    rs.getString("type"),
                    rs.getString("plateNumber"),
                    rs.getInt("capacity")
                ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return vehicles;
    }
}
