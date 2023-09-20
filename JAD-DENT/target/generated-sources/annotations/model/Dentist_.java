package model;

import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import model.Appointment;
import model.Schedule;
import model.User;

@Generated(value="EclipseLink-2.7.12.v20230209-rNA", date="2023-09-20T15:36:13")
@StaticMetamodel(Dentist.class)
public class Dentist_ { 

    public static volatile SingularAttribute<Dentist, Integer> dentistId;
    public static volatile SingularAttribute<Dentist, String> lastName;
    public static volatile SingularAttribute<Dentist, Schedule> schedule;
    public static volatile SingularAttribute<Dentist, String> specialty;
    public static volatile ListAttribute<Dentist, Appointment> appointments;
    public static volatile SingularAttribute<Dentist, String> name;
    public static volatile SingularAttribute<Dentist, User> user;

}