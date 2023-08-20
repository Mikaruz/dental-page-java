package model;

import java.util.Date;
import java.util.List;

public class Dentist extends Person {
    private int dentistId;
    private String specialty;
    private List<Appointment> appointments;
    private User user;
    private Schedule schedule; 

    public Dentist() {
    }

    public Dentist(int dentistId, String specialty, List<Appointment> appointments, User user, Schedule schedule, String dni, String name, String lastName, String phoneNumber, String address, Date birthDate) {
        super(dni, name, lastName, phoneNumber, address, birthDate);
        this.dentistId = dentistId;
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

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Schedule getSchedule() {
        return schedule;
    }

    public void setSchedule(Schedule schedule) {
        this.schedule = schedule;
    }
}
