package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Controller;
import persistence.exceptions.NonexistentEntityException;

@WebServlet(name = "DeleteDentistServlet", urlPatterns = {"/DeleteDentistServlet"})
public class DeleteDentistServlet extends HttpServlet {
    Controller controller = new Controller();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int dentistId = Integer.parseInt(request.getParameter("dentistId"));
        int userId = Integer.parseInt(request.getParameter("userId"));
        
        try {
            controller.deleteDentist(dentistId, userId);
            
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(DeleteDentistServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        response.sendRedirect("CreateDentistServlet");
    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
