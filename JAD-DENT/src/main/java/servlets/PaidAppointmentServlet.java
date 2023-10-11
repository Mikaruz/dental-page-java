package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Appointment;
import model.Controller;
import model.Patient;

@WebServlet(name = "PaidAppointmentServlet", urlPatterns = {"/PaidAppointmentServlet"})
public class PaidAppointmentServlet extends HttpServlet {

    Controller controller = new Controller();
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        
        int appointmentId = Integer.parseInt(request.getParameter("appointmentid"));
        int patientId = Integer.parseInt(request.getParameter("patientid"));
        
        
        Patient patient = controller.getPatient(patientId);
        Appointment appointment = controller.getAppointment(appointmentId);
        
        double igv = appointment.getPrice() * 0.18;
        
        HttpSession mySession = request.getSession();
        
        
        
        mySession.setAttribute("paidPatient", patient);
        mySession.setAttribute("paidAppointment", appointment);
        mySession.setAttribute("igv", igv);
        response.sendRedirect("paidAppointment.jsp");
    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String status = "paid";
        Appointment appointment = (Appointment) request.getSession().getAttribute("paidAppointment");
        appointment.setStatus(status);
        
        controller.editAppointment(appointment);
        response.sendRedirect("AppointmentServlet");
    }

   
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
