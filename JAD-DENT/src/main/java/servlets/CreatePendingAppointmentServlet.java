
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
import model.PendingAppointment;

@WebServlet(name = "CreatePendingAppointmentServlet", urlPatterns = {"/CreatePendingAppointmentServlet"})
public class CreatePendingAppointmentServlet extends HttpServlet {
    Controller controller = new Controller();
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       List<PendingAppointment> pendingAppointmentList = new ArrayList<PendingAppointment>();
       
       pendingAppointmentList = controller.getPendingAppointmentList();
       
       HttpSession mySession = request.getSession();
       mySession.setAttribute("pendingAppointmentList", pendingAppointmentList);
        
       response.sendRedirect("appointments.jsp");
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        try {
            String name = request.getParameter("name");
            String lastName = request.getParameter("lastname");
            String dni = request.getParameter("dni");
            String email = request.getParameter("email");
            String phoneNumber = request.getParameter("phonenumber");
            String date = request.getParameter("date");
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            Date turnDate = sdf.parse(date);
            String speciality = request.getParameter("speciality");
            String reason = request.getParameter("reason");
            
            controller.createPendingAppointment(name, lastName, dni, phoneNumber, email, turnDate, speciality, reason);
            response.sendRedirect("jaddent.jsp");
        } catch (ParseException ex) {
            Logger.getLogger(CreatePendingAppointmentServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
