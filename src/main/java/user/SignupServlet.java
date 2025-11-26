package user;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import util.DBConnection;

@WebServlet("/SignupServlet")
public class SignupServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String mobile = request.getParameter("mobile");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String role = request.getParameter("role");

        // Basic null checks
        if (name == null || email == null || mobile == null || username == null || password == null || role == null) {
            response.sendRedirect("error.jsp");
            return;
        }

        try (Connection connection = DBConnection.getConnection()) {
            // 1. Check if username already exists
            if (isUsernameExists(connection, username)) {
                request.setAttribute("errorMessage", "Username already exists. Please choose another one.");
                request.getRequestDispatcher("Sign-Up.jsp").forward(request, response);
                return;
            }

            // 2. Allow only ONE admin
            if (role.equalsIgnoreCase("admin") && isAdminExists(connection)) {
                request.setAttribute("errorMessage", "Admin already exists. Only one admin is allowed.");
                request.getRequestDispatcher("Sign-Up.jsp").forward(request, response);
                return;
            }
            
            // 3. Allow only ONE customer care agent
            if (role.equalsIgnoreCase("customerCare") && isCustomerCareAgentExists(connection)) {
                request.setAttribute("errorMessage", "Customer Care agent already exists. Only one admin is allowed.");
                request.getRequestDispatcher("Sign-Up.jsp").forward(request, response);
                return;
            }

            // 3. Insert the new user
            String sql = "INSERT INTO User (fullname, email, mobile, username, password, role) VALUES (?, ?, ?, ?, ?, ?)";
            try (PreparedStatement stmt = connection.prepareStatement(sql)) {
                stmt.setString(1, name);
                stmt.setString(2, email);
                stmt.setString(3, mobile);
                stmt.setString(4, username);
                stmt.setString(5, password);
                stmt.setString(6, role);

                int rowsInserted = stmt.executeUpdate();
                if (rowsInserted > 0) {
                    HttpSession session = request.getSession();
                   
                    session.setAttribute("name", name);
                    session.setAttribute("email", email);
                    session.setAttribute("mobile", mobile);
                    session.setAttribute("username", username);
                    session.setAttribute("password", password);
                    session.setAttribute("role", role);

                    // Role-based redirection
                    if ("admin".equalsIgnoreCase(role)) {
                        response.sendRedirect("admindashboard.jsp");
                    } 
                    else if ("customerCare".equalsIgnoreCase(role)){
                    	response.sendRedirect("feedback.jsp");
                    }
                    else {
                        response.sendRedirect("Sign-in.jsp");
                    }
                } else {
                    response.sendRedirect("error.jsp");
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Database error: " + e.getMessage());
            request.getRequestDispatcher("Sign-Up.jsp").forward(request, response);
        }
    }

    

	private boolean isUsernameExists(Connection connection, String username) throws SQLException {
        String query = "SELECT COUNT(*) FROM User WHERE username = ?";
        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setString(1, username);
            try (ResultSet rs = stmt.executeQuery()) {
                return rs.next() && rs.getInt(1) > 0;
            }
        }
    }

    private boolean isAdminExists(Connection connection) throws SQLException {
        String query = "SELECT COUNT(*) FROM User WHERE role = 'admin'";
        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            try (ResultSet rs = stmt.executeQuery()) {
                return rs.next() && rs.getInt(1) > 0;
            }
        }
    }
    
    private boolean isCustomerCareAgentExists(Connection connection) throws SQLException {
        String query = "SELECT COUNT(*) FROM User WHERE role = 'customerCare'";
        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            try (ResultSet rs = stmt.executeQuery()) {
                return rs.next() && rs.getInt(1) > 0;
            }
        }
    }
}
