package user;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import util.DBConnection; // ✅ Fixed import
import user.User;

public class UserDAO {

	// Method to check if username already exists
    public static boolean isUsernameExists(Connection connection, String username) throws SQLException {
        String query = "SELECT COUNT(*) FROM User WHERE username = ?";
        try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setString(1, username);
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    int count = resultSet.getInt(1);
                    return count > 0; // If count > 0, the username exists
                }
            }
        }
        return false; // Username does not exist
    }

    public static boolean createUser(Connection conn, String name,  String email, String mobile, String username, String password, String role) throws SQLException {
        String query = "INSERT INTO User (name,  email, mobile, username, password, role) VALUES (?, ?, ?, ?, ?, ?)";
        try (PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, mobile);
            ps.setString(4, username);
            ps.setString(5, password);
            ps.setString(6, role);
            return ps.executeUpdate() > 0;
        }
    }

    public static ResultSet getUserByUsername(Connection connection, String username) throws SQLException {
        String query = "SELECT name,  email, mobile, username, password, role FROM User WHERE username = ?";
        PreparedStatement preparedStatement = connection.prepareStatement(query);
        preparedStatement.setString(1, username);
        return preparedStatement.executeQuery();
    }
    
    public User getUserById(int id) {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        User user = null;
         
        try {
            conn = DBConnection.getConnection();
            String sql = "SELECT name,  email, mobile, username, password, role FROM User WHERE id=?";
            stmt = conn.prepareStatement(sql);
             
            stmt.setInt(1, id);
             
            rs = stmt.executeQuery();
             
            if (rs != null && rs.next()) {
            	 user = new User(
                    id,
                    rs.getString("name"),
                    rs.getString("email"),
                    rs.getString("mobile"),
                    rs.getString("username"),
                    rs.getNString("password"),
                    rs.getNString("role")
                    
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
         
        return user;
    }
    
    
    public boolean updateUser(int id, String name, String email,  String mobile, String username, String password, String role) {
        Connection conn = null;
        PreparedStatement stmt = null;
        boolean success = false;
        
        try {
            conn = DBConnection.getConnection();
            
            String sql = "UPDATE User SET name=?,  email=?, mobile=?, username=?, password=?, role=? WHERE id=?";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, name);
            stmt.setString(3, email);
            stmt.setString(2, mobile);
            stmt.setString(4, username);
            stmt.setString(5, password);
            stmt.setString(6, role);
            stmt.setInt(7, id);
            
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
    
    public boolean deleteUser(int id) {
        Connection conn = null;
        PreparedStatement stmt = null;
        boolean success = false;
        
        try {
            conn = DBConnection.getConnection();
          
            String sql = "DELETE FROM User WHERE id=?";
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
    public List<User> getAllUsers() {
        List<User> users = new ArrayList<>();
        String sql = "SELECT id, name, email, mobile, username, password, role FROM User";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                users.add(new User(
                    rs.getInt("id"),
                    rs.getString("name"),
                    rs.getString("email"),
                    rs.getString("mobile"),
                    rs.getString("username"),
                    rs.getNString("password"),
                    rs.getNString("role")
                ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return users;
    }
}
