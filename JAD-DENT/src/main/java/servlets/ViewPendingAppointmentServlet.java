package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Controller;
import model.PendingAppointment;

@WebServlet(name = "ViewPendingAppointmentServlet", urlPatterns = {"/ViewPendingAppointmentServlet"})
public class ViewPendingAppointmentServlet extends HttpServlet {
    Controller controller = new Controller();
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int pendingAppointmentId = Integer.parseInt(request.getParameter("pendingappointmentid"));
        
        PendingAppointment pendingAppointment = controller.getPendingAppointment(pendingAppointmentId);


        HttpSession mySession = request.getSession();
        mySession.setAttribute("pendingAppointment", pendingAppointment);
        


        response.sendRedirect("viewPendingAppointment.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
