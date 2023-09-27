package persistence;

import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Dentist;
import model.Schedule;
import model.UserAdmin;
import persistence.exceptions.NonexistentEntityException;

public class ControllerPersistence {
//    AppointmentJpaController appointmentJpa = new AppointmentJpaController();
    DentistJpaController dentistJpa = new DentistJpaController();
//    ParentJpaController parentJpa = new ParentJpaController();
//    PatientJpaController patientJpa = new PatientJpaController();
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
    
    public void createSchedule(Schedule schedule){
        scheduleJpa.create(schedule);
    }
    
    public List<Dentist> getDentistList(){
        return dentistJpa.findDentistEntities();
    }

    public void deleteDentist(int dentistId) throws NonexistentEntityException {
        dentistJpa.destroy(dentistId);
    }
    
    public Dentist getDentist(int dentistId){
        return dentistJpa.findDentist(dentistId);
    }
    
    public UserAdmin getUser(int userId){
        return userJpa.findUserAdmin(userId);
    }
    
    public void editDentist(Dentist dentist){
        try {
            dentistJpa.edit(dentist);
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
}
