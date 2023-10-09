package model;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import model.UserAdmin;


@Entity
public class Administrator implements Serializable {
     @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int administratorId;
    private String name;
    private String lastName;
    private UserAdmin user;
    
    public Administrator(){
    }
    
    public Administrator(int administratorId, String name, String lastName, UserAdmin user) {
        this.administratorId = administratorId;
        this.name = name;
        this.lastName = lastName;
        this.user = user;
    }

    public int getAdministratorId() {
        return administratorId;
    }

    public void setAdministratorId(int administratorId) {
        this.administratorId = administratorId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public UserAdmin getUser() {
        return user;
    }

    public void setUser(UserAdmin user) {
        this.user = user;
    }
    
    
}
