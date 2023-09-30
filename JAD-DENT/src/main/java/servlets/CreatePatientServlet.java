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
import model.Controller;
import model.Dentist;
import model.Patient;

@WebServlet(name = "CreatePatientServlet", urlPatterns = {"/CreatePatientServlet"})
public class CreatePatientServlet extends HttpServlet {
    Controller controller = new Controller();
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Patient> patientList = new ArrayList<Patient>();
        
        patientList = controller.getPatientList();
        
        HttpSession mySession = request.getSession();
        mySession.setAttribute("patientList", patientList);
        
        response.sendRedirect("patient.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String name = request.getParameter("name");
        String lastName = request.getParameter("lastname");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        
        
        String dni = request.getParameter("dni");
        String phoneNumber = request.getParameter("phonenumber");
        
        controller.createPatient(name, lastName, email, password, dni, phoneNumber);

        response.sendRedirect("CreatePatientServlet");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
