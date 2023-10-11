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


@WebServlet(name = "CreateNewPatientAppointmentServlet", urlPatterns = {"/CreateNewPatientAppointmentServlet"})
public class CreateNewPatientAppointmentServlet extends HttpServlet {
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
        
        int pendingAppointmentId = Integer.parseInt(request.getParameter("pendingappointmentid"));
        String name = request.getParameter("name");
        String lastName = request.getParameter("lastname");
        String email = request.getParameter("email");
        String dni = request.getParameter("dni");
        String password = name + dni;
        String speciality = request.getParameter("speciality");
        
        
        String phoneNumber = request.getParameter("phonenumber");
        
        Patient patient = controller.createPendingPatient(name, lastName, email, password, dni, phoneNumber);
        
        int patientId = patient.getPatientId();
        
        
        HttpSession mySession = request.getSession();
        
        
        mySession.setAttribute("patientId", patientId);
       

        
        controller.deletePendingAppointment(pendingAppointmentId);
        
        response.sendRedirect("CreateAppointmentPatientServlet");
        
        
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
