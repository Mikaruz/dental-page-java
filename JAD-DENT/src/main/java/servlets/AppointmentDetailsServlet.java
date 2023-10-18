
package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import static model.Appointment_.dentist;
import model.Controller;
import model.Dentist;
import model.Patient;


@WebServlet(name = "AppointmentDetailsServlet", urlPatterns = {"/AppointmentDetailsServlet"})
public class AppointmentDetailsServlet extends HttpServlet {
    Controller controller = new Controller();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String patientIdParameter = request.getParameter("patientId");
        
        
        
        
        int patientId;

        if (patientIdParameter != null) {
            // Si patientIdParameter no es null, intenta convertirlo a un entero
            
                patientId = Integer.parseInt(patientIdParameter);
            
        } else {
            // Si patientIdParameter es null, usa nuevoPacienteId en su lugar
            patientId = (int) request.getSession().getAttribute("patientId");
        }
        Patient patient = controller.getPatient(patientId);
        HttpSession mySession = request.getSession();
        mySession.setAttribute("appointmentPatient", patient);
        response.sendRedirect("addAppointment.jsp");
    }

 
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        int patientId = Integer.parseInt(request.getParameter("patientid"));
        int specialtyNumber = Integer.parseInt(request.getParameter("specialty"));
        String specialty = "";
      
        switch(specialtyNumber){
            case 1:
                specialty = "Odontologia general";
                break;
            case 2:
                specialty = "Endodoncia";    
                break;

            case 3:
                specialty = "Cirugia bucomaxilofacial";
                break;
            default:
                System.out.println("Error");
        }
        
        String dentalIssue = request.getParameter("dentalIssue");
        Patient patient = controller.getPatient(patientId);
        List<Dentist> dentistList = new ArrayList<Dentist>();
        dentistList = controller.getDentistList();
        List<Dentist> newDentistList = new ArrayList<Dentist>();

       for (Dentist dentist : dentistList) {
                
                
                if (dentist.getSpecialty().equals(specialty)) {
                  newDentistList.add(dentist);
                }
            }  
        
        HttpSession mySession = request.getSession();
        mySession.setAttribute("patient", patient);
        mySession.setAttribute("specialty", specialty);
        mySession.setAttribute("dentalIssue", dentalIssue); 
        mySession.setAttribute("dentistList", newDentistList); 
        response.sendRedirect("detailsAppointment.jsp");
    }

  
    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
