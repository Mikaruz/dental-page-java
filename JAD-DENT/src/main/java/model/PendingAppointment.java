
package model;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
public class PendingAppointment  implements Serializable{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int pendingAppointmentId;
    
    private String name;
    private String lastName;
    private String dni;
    private String email;
    private String phoneNumber;
    
    @Temporal(TemporalType.DATE)
    private Date date;
    
    private String speciality;
    private String reason;
    
    public PendingAppointment(){
    }

    public PendingAppointment(int pendingAppointmentId, String name, String lastName, String dni, String phoneNumber, String email, Date date, String speciality, String reason) {
        this.pendingAppointmentId = pendingAppointmentId;
        this.name = name;
        this.lastName = lastName;
        this.dni = dni;
        this.phoneNumber = phoneNumber;
        this.email = email;
        this.date = date;
        this.speciality = speciality;
        this.reason = reason;
    }

    public int getPendingAppointmentId() {
        return pendingAppointmentId;
    }

    public void setPendingAppointmentId(int pendingAppointmentId) {
        this.pendingAppointmentId = pendingAppointmentId;
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

    public String getDni() {
        return dni;
    }

    public void setDni(String dni) {
        this.dni = dni;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getSpeciality() {
        return speciality;
    }

    public void setSpeciality(String speciality) {
        this.speciality = speciality;
    }

    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }
    
    
    
}
