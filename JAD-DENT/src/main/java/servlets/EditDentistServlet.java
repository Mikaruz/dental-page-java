package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Controller;
import model.Dentist;
import model.UserAdmin;
import org.mindrot.jbcrypt.BCrypt;

@WebServlet(name = "EditDentistServlet", urlPatterns = {"/EditDentistServlet"})
public class EditDentistServlet extends HttpServlet {
    Controller controller = new Controller();
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int dentistId = Integer.parseInt(request.getParameter("dentistId"));
        int userId = Integer.parseInt(request.getParameter("userId"));
        
        Dentist dentist = controller.getDentist(dentistId);
        UserAdmin user = controller.getUser(userId);

        
        HttpSession mySession = request.getSession();
        mySession.setAttribute("editDentist", dentist);
        mySession.setAttribute("editUser", user);

        
        response.sendRedirect("editDentist.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String name = request.getParameter("name");
        String lastName = request.getParameter("lastname");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String specialty = request.getParameter("specialty");
        String username = email;
        String userRole = "dentista";
        String hashedPassword = BCrypt.hashpw(password, BCrypt.gensalt());
        
        
        UserAdmin user = (UserAdmin) request.getSession().getAttribute("editUser");
        user.setUsername(username);
        user.setPassword(hashedPassword);
        user.setUserRole(userRole);
        
        Dentist dentist = (Dentist) request.getSession().getAttribute("editDentist");
        dentist.setName(name);
        dentist.setLastName(lastName);
        
        
        dentist.setSpecialty(specialty);
        
        controller.editDentist(dentist);
        controller.editUser(user);
        
        
        response.sendRedirect("CreateDentistServlet");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
