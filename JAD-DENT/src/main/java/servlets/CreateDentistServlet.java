package servlets;

import java.util.ArrayList;
import java.util.List;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Appointment;
import model.Controller;
import model.Dentist;

@WebServlet(name = "CreateDentistServlet", urlPatterns = {"/CreateDentistServlet"})
public class CreateDentistServlet extends HttpServlet {

    Controller controller = new Controller();
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
    }
    

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Dentist> dentistList = new ArrayList<Dentist>();
        List<Appointment> appointmentList = new ArrayList<Appointment>();
        dentistList = controller.getDentistList();
        appointmentList = controller.getAppointmentList();
        
        HttpSession mySession = request.getSession();
        mySession.setAttribute("dentistList", dentistList);
        mySession.setAttribute("appointmentList", appointmentList);
        response.sendRedirect("dentist.jsp");
    } 

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String name = request.getParameter("name");
        String lastName = request.getParameter("lastname");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String specialty = request.getParameter("specialty");
        String beginTime = request.getParameter("begintime");
        String endTime = request.getParameter("endtime");


        controller.createDentist(name, lastName, specialty, email, password, beginTime, endTime);

        response.sendRedirect("CreateDentistServlet");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
