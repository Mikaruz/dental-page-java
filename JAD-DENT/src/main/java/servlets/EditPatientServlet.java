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
import model.Patient;
import model.UserAdmin;

@WebServlet(name = "EditPatientServlet", urlPatterns = {"/EditPatientServlet"})
public class EditPatientServlet extends HttpServlet {
    Controller controller = new Controller();
    
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        
        int patientId = Integer.parseInt(request.getParameter("patientid"));
        int userId = Integer.parseInt(request.getParameter("userid"));
        
        Patient patient = controller.getPatient(patientId);
        UserAdmin user = controller.getUser(userId);

        
        HttpSession mySession = request.getSession();
        mySession.setAttribute("editPatient", patient);
        mySession.setAttribute("editUser", user);

        
        response.sendRedirect("editPatient.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String name = request.getParameter("name");
        String lastName = request.getParameter("lastname");
        String phoneNumber = request.getParameter("phonenumber");
        
        Patient patient = (Patient) request.getSession().getAttribute("editPatient");
        patient.setName(name);
        patient.setLastName(lastName);
        patient.setPhoneNumber(phoneNumber);
        
        controller.editPatient(patient); 
        response.sendRedirect("CreatePatientServlet");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
