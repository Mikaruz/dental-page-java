package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Administrator;
import model.Appointment;
import model.Controller;
import model.Patient;
import org.mindrot.jbcrypt.BCrypt;


@WebServlet(name = "LoginPatientServlet", urlPatterns = {"/LoginPatientServlet"})
public class LoginPatientServlet extends HttpServlet {

    Controller controller = new Controller();
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    
     @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        String urlDB = "jdbc:mysql://localhost:3306/jad_dent?serverTimezone=UTC";
        String userDB = "root";
        String passwordDB = "";

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection(urlDB, userDB, passwordDB);

        // Consulta SQL para buscar el usuario por correo electrónico
        String sql = "SELECT USERID, PASSWORD FROM useradmin WHERE USERNAME = ? AND USERROLE = 'patient'";
        PreparedStatement preparedStatement = conn.prepareStatement(sql);
        preparedStatement.setString(1, email);
        ResultSet resultSet = preparedStatement.executeQuery();

        if (resultSet.next()) {
            // Se encontró un usuario con el correo electrónico proporcionado

            // Recupera el hash de la contraseña almacenada en la base de datos
            String dbHashedPassword = resultSet.getString("PASSWORD");

            // Verifica si la contraseña ingresada coincide con el hash almacenado
            if (BCrypt.checkpw(password, dbHashedPassword)) {
                int userId = resultSet.getInt("USERID");
                
                List<Patient> patientList = new ArrayList<Patient>();
                List<Appointment> appointmentList = new ArrayList<Appointment>();
                
                List<Appointment> appointmentPatientList = new ArrayList<Appointment>();
                String name = "";
                int patientId = 0;
                
                patientList = controller.getPatientList();
                appointmentList = controller.getAppointmentList();
        
                for (Patient patient : patientList) {
                    if (patient.getUser().getUserId() == userId) {
                        // El usuario autenticado tiene el mismo userId que un administrador
                        name = patient.getName();
                        patientId = patient.getPatientId();
                        break;
                    }
                }
                
                for(Appointment appointment: appointmentList){
                   if(appointment.getPatient().getPatientId() == patientId){
                       
                       
                     
                       appointmentPatientList.add(appointment);
                   }
                   
                }
                Appointment lastAppointment = null;
                
                if (!appointmentPatientList.isEmpty()) {
                    lastAppointment = appointmentPatientList.get(appointmentPatientList.size() - 1);
                    // Ahora tienes el último elemento en la variable 'ultimoAppointment'
                }
                
                // El inicio de sesión es exitoso, la contraseña es válida
                // Puedes establecer una sesión o redireccionar al usuario a la página de inicio
                HttpSession mySession = request.getSession();
                
                mySession.setAttribute("patient", name);
                mySession.setAttribute("userId", userId);
                mySession.setAttribute("patientId", patientId);
                mySession.setAttribute("appointmentPatientList", appointmentPatientList);
                mySession.setAttribute("lastAppointment", lastAppointment);
                
                response.sendRedirect("dashboardPatient.jsp"); 
            } else {
                // Las credenciales son incorrectas, muestra un mensaje de error
                request.setAttribute("mensajeError", "Credenciales incorrectas");
                request.getRequestDispatcher("loginPatient.jsp").forward(request, response);
            }
        } else {
            // No se encontró un usuario con el correo electrónico proporcionado
            // Muestra un mensaje de error
            request.setAttribute("mensajeError", "Usuario no encontrado");
            request.getRequestDispatcher("loginPatient.jsp").forward(request, response);
        }

        conn.close();
    } catch (ClassNotFoundException | SQLException e) {
        e.printStackTrace();
        // Manejar excepciones aquí
    }
}


    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
