package model;

import persistence.ControllerPersistence;

public class Controller {
    ControllerPersistence controllerPersistence = new ControllerPersistence();
    
    public void createUser(int userId, String username, String password){
        User user = new User(userId, username, password);
        controllerPersistence.createUser(user);
    }
}
