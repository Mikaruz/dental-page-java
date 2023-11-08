package model;

import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import model.Appointment;
import model.UserAdmin;

@Generated(value="EclipseLink-2.7.12.v20230209-rNA", date="2023-11-08T16:04:50")
@StaticMetamodel(Patient.class)
public class Patient_ { 

    public static volatile SingularAttribute<Patient, String> lastName;
    public static volatile ListAttribute<Patient, Appointment> appointments;
    public static volatile SingularAttribute<Patient, String> phoneNumber;
    public static volatile SingularAttribute<Patient, Integer> patientId;
    public static volatile SingularAttribute<Patient, String> name;
    public static volatile SingularAttribute<Patient, Date> birthDate;
    public static volatile SingularAttribute<Patient, UserAdmin> user;
    public static volatile SingularAttribute<Patient, String> dni;

}