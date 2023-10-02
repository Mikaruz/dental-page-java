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

@WebServlet(name = "EditAppointmentServlet", urlPatterns = {"/EditAppointmentServlet"})
public class EditAppointmentServlet extends HttpServlet {
    Controller controller = new Controller();
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int appointmentId = Integer.parseInt(request.getParameter("appointmentid"));
       
        int patientId = Integer.parseInt(request.getParameter("patientid"));
        
        
        List<Dentist> dentistList = new ArrayList<Dentist>();
        dentistList = controller.getDentistList();
        Patient patient = controller.getPatient(patientId);
        Appointment appointment = controller.getAppointment(appointmentId);
        
        HttpSession mySession = request.getSession();
        mySession.setAttribute("dentistList", dentistList);
        mySession.setAttribute("editPatient", patient);
        mySession.setAttribute("editAppointment", appointment);

        
        response.sendRedirect("editAppointment.jsp");
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String date = request.getParameter("turndate");
            String turnTime = request.getParameter("turntime");
            String dentalIssue = request.getParameter("dentalissue");
            
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            Date turnDate = sdf.parse(date);
            
            int dentistId = Integer.parseInt(request.getParameter("dentistid"));
            int patientId = Integer.parseInt(request.getParameter("patientid"));
            
            Dentist dentist = controller.getDentist(dentistId);
            
            
            Appointment appointment = (Appointment) request.getSession().getAttribute("editAppointment");
            appointment.setTurnDate(turnDate);
            appointment.setTurnTime(turnTime);
            appointment.setDentalIssue(dentalIssue);
            appointment.setDentist(dentist);
            response.sendRedirect("AppointmentServlet");
        } catch (ParseException ex) {
            Logger.getLogger(EditAppointmentServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
