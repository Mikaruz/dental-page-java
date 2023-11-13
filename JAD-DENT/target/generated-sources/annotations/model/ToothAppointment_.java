package model;

import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import model.Appointment;

@Generated(value="EclipseLink-2.7.12.v20230209-rNA", date="2023-11-13T13:14:51")
@StaticMetamodel(ToothAppointment.class)
public class ToothAppointment_ { 

    public static volatile SingularAttribute<ToothAppointment, Integer> toothAppointmentId;
    public static volatile SingularAttribute<ToothAppointment, String> name;
    public static volatile SingularAttribute<ToothAppointment, Appointment> appointment;

}