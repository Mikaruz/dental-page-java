package model;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

@Entity
public class ToothAppointment implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int toothAppointmentId;
    
    private String name;
    
    @ManyToOne 
    @JoinColumn(name = "APPOINTMENTID")
    private Appointment appointment;

    public ToothAppointment() {
    }

    public ToothAppointment(int toothAppointmentId, String name, Appointment appointment) {
        this.toothAppointmentId = toothAppointmentId;
        this.name = name;
        this.appointment = appointment;
    }

    public int getToothAppointmentId() {
        return toothAppointmentId;
    }

    public void setToothAppointmentId(int toothAppointmentId) {
        this.toothAppointmentId = toothAppointmentId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Appointment getAppointments() {
        return appointment;
    }

    public void setAppointments(Appointment appointment) {
        this.appointment = appointment;
    }
}
