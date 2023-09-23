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
        
        dentistList = controller.getDentistList();
        
        HttpSession mySession = request.getSession();
        mySession.setAttribute("dentistList", dentistList);
        System.out.println("Lista: " + dentistList.get(0));
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

        controller.createDentist(name, lastName, specialty, email, password);

        response.sendRedirect("index.jsp");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
