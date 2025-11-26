package user;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import util.DBConnection;

@WebServlet("/ProfileServlet")
public class ProfileServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
	private static final String String = null;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<User> users = new ArrayList<>();

        try (Connection connection = DBConnection.getConnection()) {
            String sql = "SELECT * FROM User";
            try (PreparedStatement statement = connection.prepareStatement(sql);
                 ResultSet resultSet = statement.executeQuery()) {

                while (resultSet.next()) {
                    User user = new User(0, sql, sql, sql, sql, sql, sql);
                    user.setId(resultSet.getInt("id"));
                    user.setName(resultSet.getString("fullname"));
                    user.setEmail(resultSet.getString("email"));
                    user.setMobile(resultSet.getString("mobile"));
                    user.setUsername(resultSet.getString("username"));
                    user.setPassword(resultSet.getString("password"));
                    user.setRole(resultSet.getString("role"));
                    users.add(user);
                }

                request.setAttribute("users", users);
                request.getRequestDispatcher("userdisplay.jsp").forward(request, response);

            }
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        }
    }
}
