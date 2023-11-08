package servlets;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Appointment;
import model.Controller;
import model.Dentist;
import model.Patient;

@WebServlet(name = "CreateAppointmentPatientServlet", urlPatterns = {"/CreateAppointmentPatientServlet"})
public class CreateAppointmentPatientServlet extends HttpServlet {
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
                patientId = Integer.parseInt(patientIdParameter);     
        } else {
            patientId = (int) request.getSession().getAttribute("patientId");
        }
        
        List<Dentist> dentistList = new ArrayList<Dentist>();
        dentistList = controller.getDentistList();
        
        Patient patient = controller.getPatient(patientId);
        
        HttpSession mySession = request.getSession();
        mySession.setAttribute("appointmentPatient", patient);
        mySession.setAttribute("dentistList", dentistList);

        response.sendRedirect("addAppointment.jsp");
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int dentistId = Integer.parseInt(request.getParameter("dentistid"));
            Dentist dentist = controller.getDentist(dentistId);
            
            int patientId = Integer.parseInt(request.getParameter("patientid"));
            Patient patient = controller.getPatient(patientId);
            
            String date = request.getParameter("turndate");
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            Date turnDate = sdf.parse(date);
            
            String aditional = request.getParameter("aditional");
            if (aditional == null) {      
                aditional = "";
            }
            
            String turnTime = request.getParameter("turntime");
            String observations = request.getParameter("observations");
            String specialty = request.getParameter("specialty");
            String dentalIssue = request.getParameter("dentalIssue");
            
            List<Appointment> appointmentList = new ArrayList<Appointment>();
            appointmentList = controller.getAppointmentList();
            
            String status = "pending";
            String aditionalPaid = "null";
            int dentalNumber = 0;
            double price = 0;
            double aditionalPrice;  
            
            
            

            System.out.println("DENTALISSUE" +dentalIssue);
            System.out.println("ESPECIALIDAD"+ specialty);
            
            
            String[] teeth = request.getParameterValues("tooth");
            if (teeth != null) {
                for (String opcion : teeth) {
                    System.out.println("Diente Nº: " + opcion);
                    dentalNumber++;
                }
            }
            
            System.out.println(dentalNumber);
            System.out.println(aditional);
            
            
            
            boolean isDuplicateAppointment = false;
            
            switch(aditional){
                case "one":
                    aditionalPrice = 50;
                    aditionalPaid = "Tratamiento de Gengivitis por " + dentalNumber + " dientes.";
                    break;
                case "two":
                    aditionalPrice = 80;
                    aditionalPaid = "Tratamiento de Periondinitis por " + dentalNumber + " dientes.";
                    break;
                case "three":
                     aditionalPaid = "Se añadio Fluor";
                    aditionalPrice = 20;
                    break;
                case "four":
                    aditionalPrice = 0;
                    break;
                default:
                    aditionalPrice = 0;
            }
            
            
            
            
         
            
            
            
            switch (specialty) {
                case "Odontologia general":
                    
                    switch(dentalIssue){
                        case "Profilaxis":
                            price = 50 + aditionalPrice;
                            break;
                        case "Blanqueamiento dental":
                            price = 50;
                            break;
                        case "Tratamiento de enfermedades de encias":
                            price = aditionalPrice * dentalNumber;
                            
                            break;
                        case "Ortodoncia":
                            price = 100;
                            break;
                        case "Implantes dentales":
                            price = 50 * dentalNumber;
                            aditionalPaid = "Tratamiento por " + dentalNumber + " dientes";
                            break;
                    }
                    
                    break;
                case "Endodoncia":
                    price = 60 * dentalNumber;
                     aditionalPaid = "Tratamiento por " + dentalNumber + " dientes";
                    break;
                case "Cirugia bucomaxilofacial":
                    price = 80 * dentalNumber;
                     aditionalPaid = "Tratamiento por " + dentalNumber + " dientes";
                    break;
            
                default:
                    // Opción predeterminada en caso de selección inválida
                    price = 0.0;
                    break;
            }
            
            
            for (Appointment existingAppointment : appointmentList) {
                
                
                if (existingAppointment.getDentist().getDentistId() == dentistId &&
                    existingAppointment.getTurnDate().equals(turnDate) &&
                    existingAppointment.getTurnTime().equals(turnTime)) {
                    // Si ya existe una cita con la misma fecha, hora y dentista
                    
                    
                    isDuplicateAppointment = true;
                    break;  // Termina la iteración porque ya encontramos un duplicado
                }
            }   
            
            if (isDuplicateAppointment) {
                // Muestra un mensaje de error al usuario
                request.setAttribute("errorMessage", "Ya existe una cita programada para esta fecha y hora con el mismo dentista.");
                request.getRequestDispatcher("error.jsp").forward(request, response);
            } else {
                
                
                controller.createAppointment(dentist, patient, turnDate, turnTime, dentalIssue, price, status, observations, aditionalPaid);
                
                response.sendRedirect("AppointmentServlet");
    }
        } catch (ParseException ex) {
            Logger.getLogger(CreateAppointmentPatientServlet.class.getName()).log(Level.SEVERE, null, ex);
            request.setAttribute("errorMessage", ex);
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
