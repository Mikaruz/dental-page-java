package model;

import org.mindrot.jbcrypt.BCrypt;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Set;
import persistence.ControllerPersistence;
import persistence.exceptions.NonexistentEntityException;

public class Controller {
    ControllerPersistence controllerPersistence = new ControllerPersistence();
    
    public UserAdmin createUser(String username, String password, String userRole){
        UserAdmin user = new UserAdmin();
        user.setUsername(username);
        user.setPassword(password);
        user.setUserRole(userRole);

        return user;
    }
    
    public Schedule createSchedule(String beginTime, String endTime){
        Schedule schedule = new Schedule();
        schedule.setBeginTime(beginTime);
        schedule.setEndTime(endTime);
        
        return schedule;
    }
    
    public void createPatient(String name, String lastName, String email, String password, String dni, String phoneNumber){
        String username = email;
        String userRole = "patient";
        
        String hashedPassword = BCrypt.hashpw(password, BCrypt.gensalt());
        UserAdmin user = createUser(username, hashedPassword, userRole);
        
        Patient patient = new Patient();
        patient.setName(name);
        patient.setLastName(lastName);
        patient.setDni(dni);
        patient.setPhoneNumber(phoneNumber);
        patient.setUser(user);
        
        controllerPersistence.createUser(user); 
        controllerPersistence.createPatient(patient);
    }
    
    public Patient createPendingPatient(String name, String lastName, String email, String password, String dni, String phoneNumber){
        String username = email;
        String userRole = "patient";
        
        String hashedPassword = BCrypt.hashpw(password, BCrypt.gensalt());
        UserAdmin user = createUser(username, hashedPassword, userRole);
        
        Patient patient = new Patient();
        patient.setName(name);
        patient.setLastName(lastName);
        patient.setDni(dni);
        patient.setPhoneNumber(phoneNumber);
        patient.setUser(user);
        
        controllerPersistence.createUser(user); 
        controllerPersistence.createPatient(patient);
        
        return patient;
    }
    
    public void createPendingAppointment(String name, String lastName, String dni, String phoneNumber, String email, Date date, String speciality, String reason){
        PendingAppointment pendingappointment = new PendingAppointment();
        
        pendingappointment.setName(name);
        pendingappointment.setLastName(lastName);
        pendingappointment.setDni(dni);
        pendingappointment.setPhoneNumber(phoneNumber);
        pendingappointment.setEmail(email);
        pendingappointment.setDate(date);
        pendingappointment.setSpeciality(speciality);
        pendingappointment.setReason(reason);
        
        controllerPersistence.createPendingAppointment(pendingappointment);
        
    }
    
    public void createDentist(String name, String lastName, String specialty, String email, String password, String beginTime, String endTime){
        String username = email;
        String userRole = "dentist";
        
        String hashedPassword = BCrypt.hashpw(password, BCrypt.gensalt());
        
        UserAdmin user = createUser(username, hashedPassword, userRole);
        Schedule schedule = createSchedule(beginTime, endTime);
        
        
        
        Dentist dentist = new Dentist();
        dentist.setName(name);
        dentist.setLastName(lastName);
        dentist.setSpecialty(specialty);
        dentist.setUser(user);
        dentist.setSchedule(schedule);
        
        
        controllerPersistence.createUser(user);
        controllerPersistence.createSchedule(schedule);
        controllerPersistence.createDentist(dentist);
        
    }
    
    public void createAppointment(Dentist dentist, Patient patient, Date turnDate, String turnTime, String dentalIssue, double price, String status, String observations, String aditional) {
        Appointment appointment = new Appointment();
        
        appointment.setDentist(dentist);
        appointment.setPatient(patient);
        appointment.setTurnDate(turnDate);
        appointment.setTurnTime(turnTime);
        appointment.setDentalIssue(dentalIssue);
        appointment.setPrice(price);
        appointment.setStatus(status);
        appointment.setAditional(aditional);
        appointment.setObservations(observations);
        
        controllerPersistence.createAppointment(appointment);
    }
    
    public int createAndReturnIdAppointment(Dentist dentist, Patient patient, Date turnDate, String turnTime, String dentalIssue, double price, String status, String observations, String aditional) {
        Appointment appointment = new Appointment();
        
        appointment.setDentist(dentist);
        appointment.setPatient(patient);
        appointment.setTurnDate(turnDate);
        appointment.setTurnTime(turnTime);
        appointment.setDentalIssue(dentalIssue);
        appointment.setPrice(price);
        appointment.setStatus(status);
        appointment.setAditional(aditional);
        appointment.setObservations(observations);
        
        return controllerPersistence.createAndReturnIdAppointment(appointment);
    }
    
    public void createToothAppointment(String name, Appointment appointment){
        ToothAppointment toothAppointment = new ToothAppointment();
        
        toothAppointment.setName(name);
        toothAppointment.setAppointments(appointment);
        
        controllerPersistence.createToothAppointment(toothAppointment);
    }
    
    
    public List<Dentist> getDentistList(){
        controllerPersistence.getDentistList();
        
        return controllerPersistence.getDentistList();
    }
    
    public List<Administrator> getAdministratorList(){
        return controllerPersistence.getAdministratorList();
    }
    
    public List<Patient> getPatientList(){
        controllerPersistence.getPatientList();
        
        return controllerPersistence.getPatientList();
    }

    public void deleteDentist(int dentistId, int userId) throws NonexistentEntityException {
        controllerPersistence.deleteDentist(dentistId);
        controllerPersistence.deleteUser(userId);
    }
    
    public Dentist getDentist(int dentistId){
        return controllerPersistence.getDentist(dentistId);
    }
    
    public UserAdmin getUser(int userId){
        return controllerPersistence.getUser(userId);
    }
    
    public PendingAppointment getPendingAppointment(int pendingAppointmentId){
        return controllerPersistence.getPendingAppointment(pendingAppointmentId);
    }
    
    public void editDentist(Dentist dentist){
        controllerPersistence.editDentist(dentist);
    }
    
    public void editAppointment(Appointment appointment){
        controllerPersistence.editAppointment(appointment);
    }
    
    public void editSchedule(Schedule schedule){
        controllerPersistence.editSchedule(schedule);
    }
    
    public void editUser(UserAdmin user){
        controllerPersistence.editUser(user);
    }
    
    public void editPatient(Patient patient){
        controllerPersistence.editPatient(patient);
    }

    public Patient getPatient(int patientId) {
        return controllerPersistence.getPatient(patientId);
    }
    
    public Schedule getSchedule(int scheduleId){
        return controllerPersistence.getSchedule(scheduleId);
    }
    
    public Administrator getAdministrator(int administratorId){
        return controllerPersistence.getAdministrator(administratorId);
    }
    
    public Appointment getAppointment(int appointmentId){
        return controllerPersistence.getAppointment(appointmentId);
    }

    

    public List<Appointment> getAppointmentList() {
        controllerPersistence.getAppointmentList();
        
        return controllerPersistence.getAppointmentList();
    }

    public List<PendingAppointment> getPendingAppointmentList(){
        controllerPersistence.getPendingAppointmentList();
        
        return controllerPersistence.getPendingAppointmentList();
    }

    public void deletePendingAppointment(int pendingAppointmentId) {
        controllerPersistence.deletePendingAppointment(pendingAppointmentId);
    }

    public void deletePatient(int patientId, int userId) {
        controllerPersistence.deletePatient(patientId);
        controllerPersistence.deleteUser(userId);
    }
    
    public void deleteAppointment(int appointmentId){
        controllerPersistence.deleteAppointment(appointmentId);
    }
    
}
