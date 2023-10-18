package model;

import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import model.Dentist;
import model.Patient;

@Generated(value="EclipseLink-2.7.12.v20230209-rNA", date="2023-10-18T15:16:50")
@StaticMetamodel(Appointment.class)
public class Appointment_ { 

    public static volatile SingularAttribute<Appointment, Date> turnDate;
    public static volatile SingularAttribute<Appointment, String> turnTime;
    public static volatile SingularAttribute<Appointment, String> dentalIssue;
    public static volatile SingularAttribute<Appointment, Integer> appointmentId;
    public static volatile SingularAttribute<Appointment, Double> price;
    public static volatile SingularAttribute<Appointment, Patient> patient;
    public static volatile SingularAttribute<Appointment, String> observations;
    public static volatile SingularAttribute<Appointment, String> aditional;
    public static volatile SingularAttribute<Appointment, Dentist> dentist;
    public static volatile SingularAttribute<Appointment, String> status;

}