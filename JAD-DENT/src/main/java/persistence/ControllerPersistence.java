package persistence;

import model.User;

public class ControllerPersistence {
    AppointmentJpaController appointmentJpa = new AppointmentJpaController();
    DentistJpaController dentistJpa = new DentistJpaController();
    ParentJpaController parentJpa = new ParentJpaController();
    PatientJpaController patientJpa = new PatientJpaController();
    ScheduleJpaController scheduleJpa = new ScheduleJpaController();
    UserJpaController userJpa = new UserJpaController();
    
    public void createUser(User user){
        
    }
}
