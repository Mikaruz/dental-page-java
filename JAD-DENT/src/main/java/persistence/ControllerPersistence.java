package persistence;

import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Administrator;
import model.Appointment;
import model.Dentist;
import model.Patient;
import model.PendingAppointment;
import model.Schedule;
import model.UserAdmin;
import persistence.exceptions.NonexistentEntityException;


public class ControllerPersistence {
    AppointmentJpaController appointmentJpa = new AppointmentJpaController();
    PendingAppointmentJpaController pendingAppointmentJpa = new PendingAppointmentJpaController();
    AdministratorJpaController administratorJpa = new AdministratorJpaController();
    DentistJpaController dentistJpa = new DentistJpaController();
//    ParentJpaController parentJpa = new ParentJpaController();
    PatientJpaController patientJpa = new PatientJpaController();
    ScheduleJpaController scheduleJpa = new ScheduleJpaController();
    UserAdminJpaController userJpa = new UserAdminJpaController();
    
    public void createUser(UserAdmin user) {
        userJpa.create(user);
    }
    
    public void deleteUser(int userId){
        try {
            userJpa.destroy(userId);
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(ControllerPersistence.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void createDentist(Dentist dentist) {
        dentistJpa.create(dentist);
    }
    
    public void createPatient(Patient patient){
        patientJpa.create(patient);
    }
    
    public void createSchedule(Schedule schedule){
        scheduleJpa.create(schedule);
    }
    
    public List<Dentist> getDentistList(){
        return dentistJpa.findDentistEntities();
    }
    
    public List<Patient> getPatientList(){
        return patientJpa.findPatientEntities();
    }

    public void deleteDentist(int dentistId) throws NonexistentEntityException {
        dentistJpa.destroy(dentistId);
    }
    
    public Dentist getDentist(int dentistId){
        return dentistJpa.findDentist(dentistId);
    }
    
    public Patient getPatient(int patientId){
        return patientJpa.findPatient(patientId);
    }
    
    public UserAdmin getUser(int userId){
        return userJpa.findUserAdmin(userId);
    }
    
    public Appointment getAppointment(int appointmentId){
        return appointmentJpa.findAppointment(appointmentId);
    }
    
    public Administrator getAdministrator(int administratorId){
        return administratorJpa.findAdministrator(administratorId);
    }
    
    public Schedule getSchedule(int scheduleId){
        return scheduleJpa.findSchedule(scheduleId);
    }
    
    public PendingAppointment getPendingAppointment(int pendingAppointmentId){
        return pendingAppointmentJpa.findPendingAppointment(pendingAppointmentId);
    }
    
    public void editAppointment(Appointment appointment){
        try {
            appointmentJpa.edit(appointment);
        } catch (Exception ex) {
            Logger.getLogger(ControllerPersistence.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void editDentist(Dentist dentist){
        try {
            dentistJpa.edit(dentist);
        } catch (Exception ex) {
            Logger.getLogger(ControllerPersistence.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void editPatient(Patient patient){
        try {
            patientJpa.edit(patient);
        } catch (Exception ex) {
            Logger.getLogger(ControllerPersistence.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void editUser(UserAdmin user){
        try {
            userJpa.edit(user);
        } catch (Exception ex) {
            Logger.getLogger(ControllerPersistence.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void editSchedule(Schedule schedule){
        try {
            scheduleJpa.edit(schedule);
        } catch (Exception ex) {
            Logger.getLogger(ControllerPersistence.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void createAppointment(Appointment appointment) {
        appointmentJpa.create(appointment);
    }

    public List<Appointment> getAppointmentList() {
        return appointmentJpa.findAppointmentEntities();
    }
    
    public List<Administrator> getAdministratorList(){
        return administratorJpa.findAdministratorEntities();
    }

    public List<PendingAppointment> getPendingAppointmentList(){
        return pendingAppointmentJpa.findPendingAppointmentEntities();
    }
    
    public void createPendingAppointment(PendingAppointment pendingappointment) {
        pendingAppointmentJpa.create(pendingappointment);
    }

    public void deletePendingAppointment(int pendingAppointmentId){
        try {
            pendingAppointmentJpa.destroy(pendingAppointmentId);
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(ControllerPersistence.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void deletePatient(int patientId) {
        try {
            patientJpa.destroy(patientId);
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(ControllerPersistence.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void deleteAppointment(int appointmentId){
        try {
            appointmentJpa.destroy(appointmentId);
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(ControllerPersistence.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}