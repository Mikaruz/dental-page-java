package model;

import java.util.Date;
import java.util.List;

public class Patient extends Person {
    private int patientId;
    private boolean brushesTeethRegularly;
    private boolean flossesTeeth;
    private boolean hasAllergies;
    private String allergiesDescription;
    private boolean hadDentalProcedures;
    private String previousProcedures;
    private boolean takesMedications;
    private String medicationsList;
    private Parent hasParent;
    private List<Appointment> appointments;

    public Patient() {
    }

    public Patient(int patientId, boolean brushesTeethRegularly, boolean flossesTeeth, boolean hasAllergies, String allergiesDescription, boolean hadDentalProcedures, String previousProcedures, boolean takesMedications, String medicationsList, Parent hasParent, List<Appointment> appointments, String dni, String name, String lastName, String phoneNumber, String address, Date birthDate) {
        super(dni, name, lastName, phoneNumber, address, birthDate);
        this.patientId = patientId;
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
