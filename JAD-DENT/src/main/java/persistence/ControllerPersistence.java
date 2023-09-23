package persistence;

import java.util.ArrayList;
import java.util.List;
import model.Dentist;
import model.UserAdmin;

public class ControllerPersistence {
//    AppointmentJpaController appointmentJpa = new AppointmentJpaController();
    DentistJpaController dentistJpa = new DentistJpaController();
//    ParentJpaController parentJpa = new ParentJpaController();
//    PatientJpaController patientJpa = new PatientJpaController();
//    ScheduleJpaController scheduleJpa = new ScheduleJpaController();
    UserAdminJpaController userJpa = new UserAdminJpaController();
    
    public void createUser(UserAdmin user){
        userJpa.create(user);
    }
    
    public void createDentist(Dentist dentist){
        dentistJpa.create(dentist);
    }
    
    public List<Dentist> getDentistList(){
        return dentistJpa.findDentistEntities();
    }
}
