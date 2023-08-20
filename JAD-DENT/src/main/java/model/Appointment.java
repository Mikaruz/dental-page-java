package model;

import java.util.Date;

public class Appointment {
    private int appointmentId;
    private Date turnDate;
    private String turnTime;
    private String condition;

    public Appointment() {
    }

    public Appointment(int appointmentId, Date turnDate, String turnTime, String condition) {
        this.appointmentId = appointmentId;
        this.turnDate = turnDate;
        this.turnTime = turnTime;
        this.condition = condition;
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

    public String getCondition() {
        return condition;
    }

    public void setCondition(String condition) {
        this.condition = condition;
    }
}
