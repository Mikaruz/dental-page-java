package servlets;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
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
import model.PendingAppointment;

@WebServlet(name = "DashboardServlet", urlPatterns = {"/DashboardServlet"})
public class DashboardServlet extends HttpServlet {
    Controller controller = new Controller();
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        LocalDate currentDate = LocalDate.now();
        DateTimeFormatter dbDateFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");

        int[] dayOfWeekAppointments = new int[7];
        
        List<Appointment> appointmentList = new ArrayList<Appointment>();
        List<PendingAppointment> pendingAppointmentList = new ArrayList<PendingAppointment>();
        appointmentList = controller.getAppointmentList();
        pendingAppointmentList = controller.getPendingAppointmentList();
        
        double totalAppointmentPrice = 0.0;
        int completeAppointments = 0;
        
        int firstDentalIssue = 0;
        int secondDentalIssue = 0;
        int thirdDentalIssue = 0;
        
        for (Appointment appointment : appointmentList) {
            
            String dateString = new SimpleDateFormat("yyyy-MM-dd").format(appointment.getTurnDate());

    // Parsear la fecha de la cadena
    LocalDate appointmentDate = LocalDate.parse(dateString, dbDateFormatter);

    // Calcular la diferencia en días entre la fecha de la cita y la fecha actual
    long daysDifference = currentDate.toEpochDay() - appointmentDate.toEpochDay();

    // Verificar si la cita está dentro de la misma semana
    if (daysDifference >= 0 && daysDifference <= 6) {
        // Obtener el día de la semana de la cita
        DayOfWeek dayOfWeek = appointmentDate.getDayOfWeek();

        // Obtener el índice del día de la semana (Lunes = 1, Martes = 2, ..., Domingo = 7)
        int dayIndex = dayOfWeek.getValue();

        // Incrementar el contador correspondiente al día de la semana
        dayOfWeekAppointments[dayIndex - 1]++;
    }
            
            if(appointment.getStatus().equals("paid")){
                completeAppointments++;
                totalAppointmentPrice += appointment.getPrice();
            }
            
            switch(appointment.getDentalIssue()){
               case "Tratamiento de conducto":
                   secondDentalIssue++;
                   break;
               case "Extraccion dental":
                   thirdDentalIssue++;
                   break;    
               default:
                   firstDentalIssue++;
            }
        }
        int totalPendingAppointments = pendingAppointmentList.size();
        
        
        
        HttpSession mySession = request.getSession();
               
        mySession.setAttribute("firstDentalIssue", firstDentalIssue);
        mySession.setAttribute("secondDentalIssue", secondDentalIssue);
        mySession.setAttribute("thirdDentalIssue", thirdDentalIssue);
        mySession.setAttribute("totalAppointmentPrice", totalAppointmentPrice);
        mySession.setAttribute("completeAppointments", completeAppointments);
        mySession.setAttribute("totalPendingAppointments", totalPendingAppointments);
        mySession.setAttribute("mondayAppointments", dayOfWeekAppointments[0]);
        mySession.setAttribute("tuesdayAppointments", dayOfWeekAppointments[1]);
        mySession.setAttribute("wednesdayAppointments", dayOfWeekAppointments[2]);
        mySession.setAttribute("thursdayAppointments", dayOfWeekAppointments[3]);
        mySession.setAttribute("fridayAppointments", dayOfWeekAppointments[4]);
        mySession.setAttribute("saturdayAppointments", dayOfWeekAppointments[5]);
        mySession.setAttribute("sundayAppointments", dayOfWeekAppointments[6]);
        response.sendRedirect("index.jsp");
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
