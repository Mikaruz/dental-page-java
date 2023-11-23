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
import model.Appointment;
import model.Controller;
import model.ToothAppointment;

@WebServlet(name = "PatientAppointmentServlet", urlPatterns = {"/PatientAppointmentServlet"})
public class PatientAppointmentServlet extends HttpServlet {
Controller controller = new Controller();
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int appointmentId = Integer.parseInt(request.getParameter("appointmentId"));
        Appointment appointment = controller.getAppointment(appointmentId);
        List<ToothAppointment> toothAppointmentList = new ArrayList<ToothAppointment>();
        List<ToothAppointment> myToothAppointmentList = new ArrayList<ToothAppointment>();
        
        toothAppointmentList = controller.getToothAppointmentList();
        
        for (ToothAppointment toothAppointment : toothAppointmentList) {
            if (toothAppointment.getAppointments().getAppointmentId() == appointmentId ) {
                myToothAppointmentList.add(toothAppointment);
            }
        }
        
        HttpSession mySession = request.getSession();
        mySession.setAttribute("appointment", appointment);
         mySession.setAttribute("myToothAppointmentList", myToothAppointmentList);
        response.sendRedirect("AppointmentPatientDetails.jsp");
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

 
    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
