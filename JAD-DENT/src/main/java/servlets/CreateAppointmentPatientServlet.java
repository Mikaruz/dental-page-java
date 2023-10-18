package servlets;

import java.io.IOException;
import java.io.PrintWriter;
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
            // Si patientIdParameter no es null, intenta convertirlo a un entero
            
                patientId = Integer.parseInt(patientIdParameter);
            
        } else {
            // Si patientIdParameter es null, usa nuevoPacienteId en su lugar
            patientId = (int) request.getSession().getAttribute("patientId");
        }
        
        
        
        List<Dentist> dentistList = new ArrayList<Dentist>();
        dentistList = controller.getDentistList();
        
        Patient patient = controller.getPatient(patientId);
        
        HttpSession mySession = request.getSession();
        mySession.setAttribute("appointmentPatient", patient);
        mySession.setAttribute("dentistList", dentistList);
        
        if (mySession.getAttribute("speciality") != null) {
            // El atributo "speciality" está presente, puedes obtener su valor
            String speciality = (String) mySession.getAttribute("speciality");
            mySession.setAttribute("speciality", speciality);
            System.out.println(speciality);
            // Haz lo que necesites con la variable "speciality"
        } else {
            // El atributo "speciality" no está presente en la sesión, puedes manejarlo de alguna manera
        }

        
        
        response.sendRedirect("addAppointment.jsp");
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String date = request.getParameter("turndate");
            String turnTime = request.getParameter("turntime");
            
            double price = 0;
            String status = "pending";
            
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            Date turnDate = sdf.parse(date);
            
            List<Appointment> appointmentList = new ArrayList<Appointment>();
            
            appointmentList = controller.getAppointmentList();
            
            int dentistId = Integer.parseInt(request.getParameter("dentistid"));
            int patientId = Integer.parseInt(request.getParameter("patientid"));
            
            Dentist dentist = controller.getDentist(dentistId);
            
            
            Patient patient = controller.getPatient(patientId);
            String observations = request.getParameter("observations");
          
            String specialty = request.getParameter("specialty");
            String dentalIssue = request.getParameter("dentalIssue");
           String aditional = request.getParameter("aditional");
           
           String aditionalPaid = "null";

        if (aditional == null) {
            // El parámetro es nulo, puedes manejarlo aquí, por ejemplo, asignando un valor predeterminado o lanzando una excepción.
            // Aquí un ejemplo de asignar un valor predeterminado:
            aditional = "Valor predeterminado";
        }
            System.out.println(dentalIssue);
            System.out.println(specialty);
            
            
            int aditionalPrice = 0;
            
            
            
            System.out.println(aditional);
            
            String dentalNumberParam = request.getParameter("number");
            int dentalNumber = 0; // Valor predeterminado o valor de error si el parámetro es nulo

            if (dentalNumberParam != null && !dentalNumberParam.isEmpty()) {
                try {
                    dentalNumber = Integer.parseInt(dentalNumberParam);
                } catch (NumberFormatException e) {
                    // Manejo de error si el valor no es un número válido
                    // Puedes registrar el error o tomar medidas específicas aquí
                }
            }
            
            
            boolean isDuplicateAppointment = false;
            
            switch(aditional){
                case "one":
                    aditionalPrice = 50;
                    aditionalPaid = "Tratamiento de Gengivitis";
                    break;
                case "two":
                    aditionalPrice = 80;
                    aditionalPaid = "Tratamiento de Periondinitis";
                    break;
                case "three":
                     aditionalPaid = "Se añadio Fluor";
                    aditionalPrice = 20;
                    break;
                case "four":
                    aditionalPrice = 0;
                    break;
                    
                
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
                            price = aditionalPrice;
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
                // Crea la cita si no hay duplicados
                
                controller.createAppointment(dentist, patient, turnDate, turnTime, dentalIssue, price, status, observations, aditionalPaid);
                response.sendRedirect("AppointmentServlet");
    }
        } catch (ParseException ex) {
            Logger.getLogger(CreateAppointmentPatientServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
