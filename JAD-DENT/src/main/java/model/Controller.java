package model;

import java.util.ArrayList;
import java.util.List;
import persistence.ControllerPersistence;

public class Controller {
    ControllerPersistence controllerPersistence = new ControllerPersistence();
    
    public UserAdmin createUser(String username, String password, String userRole){
        UserAdmin user = new UserAdmin();
        user.setUsername(username);
        user.setPassword(password);
        user.setUserRole(userRole);

        return user;
    }
    
    public void createDentist(String name, String lastName, String specialty, String email, String password){
        String username = email;
        String userRole = "dentist";
        
        UserAdmin user = createUser(username, password, userRole);
        
        Dentist dentist = new Dentist();
        dentist.setName(name);
        dentist.setLastName(lastName);
        dentist.setSpecialty(specialty);
        dentist.setUser(user);
        
        controllerPersistence.createUser(user);
        controllerPersistence.createDentist(dentist);
    }
    
    public List<Dentist> getDentistList(){
        controllerPersistence.getDentistList();
        
        return controllerPersistence.getDentistList();
    }
}
