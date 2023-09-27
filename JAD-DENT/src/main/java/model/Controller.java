package model;

import org.mindrot.jbcrypt.BCrypt;
import java.util.ArrayList;
import java.util.List;
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
    
    public List<Dentist> getDentistList(){
        controllerPersistence.getDentistList();
        
        return controllerPersistence.getDentistList();
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
    
    public void editDentist(Dentist dentist){
        controllerPersistence.editDentist(dentist);
    }
    
    public void editUser(UserAdmin user){
        controllerPersistence.editUser(user);
    }
    
}
