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
import model.Dentist;
import model.PendingAppointment;

@WebServlet(name = "AppointmentServlet", urlPatterns = {"/AppointmentServlet"})
public class AppointmentServlet extends HttpServlet {
     Controller controller = new Controller();
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       List<Appointment> appointmentList = new ArrayList<Appointment>();
       List<PendingAppointment> pendingAppointmentList = new ArrayList<PendingAppointment>();
       
       appointmentList = controller.getAppointmentList();
       pendingAppointmentList = controller.getPendingAppointmentList();
       
       HttpSession mySession = request.getSession();
       mySession.setAttribute("pendingAppointmentList", pendingAppointmentList);
       
      
       mySession.setAttribute("appointmentList", appointmentList);
       
       
       response.sendRedirect("appointments.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        
        
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
