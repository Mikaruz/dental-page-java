package model;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

@Entity
public class Dentist implements Serializable {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int dentistId;
    
    private String name;
    private String lastName;
    
    private String specialty;
    
    @OneToMany (mappedBy = "dentist")
    private List<Appointment> appointments;
    
    @OneToOne
    private UserAdmin user;
    
    @OneToOne
    private Schedule schedule; 

    public Dentist() {
    }

    public Dentist(int dentistId, String nombre, String apellido, String specialty, List<Appointment> appointments, UserAdmin user, Schedule schedule) {
        this.dentistId = dentistId;
        this.name = nombre;
        this.lastName = apellido;
        this.specialty = specialty;
        this.appointments = appointments;
        this.user = user;
        this.schedule = schedule;
    }
    

    public int getDentistId() {
        return dentistId;
    }

    public void setDentistId(int dentistId) {
        this.dentistId = dentistId;
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

    public String getSpecialty() {
        return specialty;
    }

    public void setSpecialty(String specialty) {
        this.specialty = specialty;
    }

    public List<Appointment> getAppointments() {
        return appointments;
    }

    public void setAppointments(List<Appointment> appointments) {
        this.appointments = appointments;
    }

    public UserAdmin getUser() {
        return user;
    }

    public void setUser(UserAdmin user) {
        this.user = user;
    }

    public Schedule getSchedule() {
        return schedule;
    }

    public void setSchedule(Schedule schedule) {
        this.schedule = schedule;
    }
}
