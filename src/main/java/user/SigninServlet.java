package user;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import util.DBConnection;

@WebServlet("/SigninServlet")
public class SigninServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String selectedRole = request.getParameter("role");
        
     // ✅ Hardcoded Customer Care Agent Login
        if ("agent".equals(username) && "agent123".equals(password)) {
            if (!"customerCare".equalsIgnoreCase(selectedRole)) {
                request.setAttribute("errorMessage", "Incorrect role for hardcoded agent.");
                request.getRequestDispatcher("Sign-in.jsp").forward(request, response);
                return;
            }

            HttpSession session = request.getSession();
            session.setAttribute("username", "agent");
            session.setAttribute("role", "customerCare");

            response.sendRedirect("feedback.jsp");
            return;
        }


        try (Connection connection = DBConnection.getConnection()) {
            String sql = "SELECT * FROM User WHERE username = ?";
            try (PreparedStatement stmt = connection.prepareStatement(sql)) {
                stmt.setString(1, username);
                try (ResultSet rs = stmt.executeQuery()) {
                    if (rs.next()) {
                        String dbPassword = rs.getString("password");
                        String dbRole = rs.getString("role");

                        if (password.equals(dbPassword)) {
                            if (!dbRole.equalsIgnoreCase(selectedRole)) {
                                // Role mismatch
                                request.setAttribute("errorMessage", "Selected role does not match user role.");
                                request.getRequestDispatcher("Sign-in.jsp").forward(request, response);
                                return;
                            }

                            // Successful login
                            HttpSession session = request.getSession();
                            session.setAttribute("username", rs.getString("username"));
                            session.setAttribute("role", dbRole);

                            if ("admin".equalsIgnoreCase(dbRole)) {
                                response.sendRedirect("AdminDashboard.jsp");
                            } 
                            else if ("customerCare".equalsIgnoreCase(dbRole)) {
                            	response.sendRedirect("feedback.jsp");
                            }
                            else {
                                response.sendRedirect("home.jsp");
                            }
                        } else {
                            // Wrong password
                            request.setAttribute("errorMessage", "Incorrect password.");
                            request.getRequestDispatcher("Sign-in.jsp").forward(request, response);
                        }
                    } else {
                        // User not found
                        request.setAttribute("errorMessage", "User not found.");
                        request.getRequestDispatcher("Sign-in.jsp").forward(request, response);
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Internal error: " + e.getMessage());
            request.getRequestDispatcher("Sign-in.jsp").forward(request, response);
        }
    }
}
