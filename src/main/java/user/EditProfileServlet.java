package user;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/EditProfileServlet")
public class EditProfileServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private UserDAO userDAO;

    public void init() {
    	userDAO = new UserDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));

        User user = userDAO.getUserById(id);

        if (user != null) {
            request.setAttribute("user", user);
            request.getRequestDispatcher("EditProfile.jsp").forward(request, response);
        } else {
            request.setAttribute("errorMessage", "User not found.");
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }
}
