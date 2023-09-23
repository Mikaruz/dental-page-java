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
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
public class Patient implements Serializable {
   
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int patientId;
    
    private String dni;
    private String name;
    private String lastName;
    private String phoneNumber;
    
    @Temporal(TemporalType.DATE)
    private Date birthDate;
    
    private boolean brushesTeethRegularly;
    private boolean flossesTeeth;
    private boolean hasAllergies;
    private String allergiesDescription;
    private boolean hadDentalProcedures;
    private String previousProcedures;
    private boolean takesMedications;
    private String medicationsList;
    
    @OneToOne
    private Parent hasParent;
    
    @OneToMany (mappedBy = "patient")
    private List<Appointment> appointments;

    public Patient() {
    }

    public Patient(int patientId, String dni, String name, String lastName, String phoneNumber, Date birthDate, boolean brushesTeethRegularly, boolean flossesTeeth, boolean hasAllergies, String allergiesDescription, boolean hadDentalProcedures, String previousProcedures, boolean takesMedications, String medicationsList, Parent hasParent, List<Appointment> appointments) {
        this.patientId = patientId;
        this.dni = dni;
        this.name = name;
        this.lastName = lastName;
        this.phoneNumber = phoneNumber;
        this.birthDate = birthDate;
        this.brushesTeethRegularly = brushesTeethRegularly;
        this.flossesTeeth = flossesTeeth;
        this.hasAllergies = hasAllergies;
        this.allergiesDescription = allergiesDescription;
        this.hadDentalProcedures = hadDentalProcedures;
        this.previousProcedures = previousProcedures;
        this.takesMedications = takesMedications;
        this.medicationsList = medicationsList;
        this.hasParent = hasParent;
        this.appointments = appointments;
    }

    public int getPatientId() {
        return patientId;
    }

    public void setPatientId(int patientId) {
        this.patientId = patientId;
    }

    public String getDni() {
        return dni;
    }

    public void setDni(String dni) {
        this.dni = dni;
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

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public Date getBirthDate() {
        return birthDate;
    }

    public void setBirthDate(Date birthDate) {
        this.birthDate = birthDate;
    }

    public boolean isBrushesTeethRegularly() {
        return brushesTeethRegularly;
    }

    public void setBrushesTeethRegularly(boolean brushesTeethRegularly) {
        this.brushesTeethRegularly = brushesTeethRegularly;
    }

    public boolean isFlossesTeeth() {
        return flossesTeeth;
    }

    public void setFlossesTeeth(boolean flossesTeeth) {
        this.flossesTeeth = flossesTeeth;
    }

    public boolean isHasAllergies() {
        return hasAllergies;
    }

    public void setHasAllergies(boolean hasAllergies) {
        this.hasAllergies = hasAllergies;
    }

    public String getAllergiesDescription() {
        return allergiesDescription;
    }

    public void setAllergiesDescription(String allergiesDescription) {
        this.allergiesDescription = allergiesDescription;
    }

    public boolean isHadDentalProcedures() {
        return hadDentalProcedures;
    }

    public void setHadDentalProcedures(boolean hadDentalProcedures) {
        this.hadDentalProcedures = hadDentalProcedures;
    }

    public String getPreviousProcedures() {
        return previousProcedures;
    }

    public void setPreviousProcedures(String previousProcedures) {
        this.previousProcedures = previousProcedures;
    }

    public boolean isTakesMedications() {
        return takesMedications;
    }

    public void setTakesMedications(boolean takesMedications) {
        this.takesMedications = takesMedications;
    }

    public String getMedicationsList() {
        return medicationsList;
    }

    public void setMedicationsList(String medicationsList) {
        this.medicationsList = medicationsList;
    }

    public Parent getHasParent() {
        return hasParent;
    }

    public void setHasParent(Parent hasParent) {
        this.hasParent = hasParent;
    }

    public List<Appointment> getAppointments() {
        return appointments;
    }

    public void setAppointments(List<Appointment> appointments) {
        this.appointments = appointments;
    }

    
}
