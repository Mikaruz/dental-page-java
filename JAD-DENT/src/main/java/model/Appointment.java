package model;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
public class Appointment implements Serializable{
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int appointmentId;
    
    @Temporal(TemporalType.DATE)
    private Date turnDate;
    
    private String turnTime;
    private String dentalIssue;
    
    @ManyToOne 
    @JoinColumn(name = "dentist_id")
    private Dentist dentist;
    
    @ManyToOne 
    @JoinColumn(name = "patient_id")
    private Patient patient;
    
    public Appointment() {
    }

    public Appointment(int appointmentId, Date turnDate, String turnTime, String condition) {
        this.appointmentId = appointmentId;
        this.turnDate = turnDate;
        this.turnTime = turnTime;
        this.dentalIssue = condition;
    }

    public int getAppointmentId() {
        return appointmentId;
    }

    public void setAppointmentId(int appointmentId) {
        this.appointmentId = appointmentId;
    }

    public Date getTurnDate() {
        return turnDate;
    }

    public void setTurnDate(Date turnDate) {
        this.turnDate = turnDate;
    }

    public String getTurnTime() {
        return turnTime;
    }

    public void setTurnTime(String turnTime) {
        this.turnTime = turnTime;
    }

    public String getDentalIssue() {
        return dentalIssue;
    }

    public void setDentalIssue(String dentalIssue) {
        this.dentalIssue = dentalIssue;
    }

    public Dentist getDentist() {
        return dentist;
    }

    public void setDentist(Dentist dentist) {
        this.dentist = dentist;
    }

    public Patient getPatient() {
        return patient;
    }

    public void setPatient(Patient patient) {
        this.patient = patient;
    }
    
    
}
