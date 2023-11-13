package model;

import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.12.v20230209-rNA", date="2023-11-13T15:51:58")
@StaticMetamodel(PendingAppointment.class)
public class PendingAppointment_ { 

    public static volatile SingularAttribute<PendingAppointment, Date> date;
    public static volatile SingularAttribute<PendingAppointment, String> lastName;
    public static volatile SingularAttribute<PendingAppointment, String> speciality;
    public static volatile SingularAttribute<PendingAppointment, String> reason;
    public static volatile SingularAttribute<PendingAppointment, String> phoneNumber;
    public static volatile SingularAttribute<PendingAppointment, Integer> pendingAppointmentId;
    public static volatile SingularAttribute<PendingAppointment, String> name;
    public static volatile SingularAttribute<PendingAppointment, String> dni;
    public static volatile SingularAttribute<PendingAppointment, String> email;

}