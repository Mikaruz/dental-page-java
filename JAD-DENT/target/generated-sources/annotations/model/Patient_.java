package model;

import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import model.Appointment;
import model.Parent;

@Generated(value="EclipseLink-2.7.12.v20230209-rNA", date="2023-09-20T15:36:13")
@StaticMetamodel(Patient.class)
public class Patient_ { 

    public static volatile SingularAttribute<Patient, String> lastName;
    public static volatile ListAttribute<Patient, Appointment> appointments;
    public static volatile SingularAttribute<Patient, Integer> patientId;
    public static volatile SingularAttribute<Patient, Boolean> hasAllergies;
    public static volatile SingularAttribute<Patient, String> allergiesDescription;
    public static volatile SingularAttribute<Patient, Date> birthDate;
    public static volatile SingularAttribute<Patient, String> previousProcedures;
    public static volatile SingularAttribute<Patient, String> phoneNumber;
    public static volatile SingularAttribute<Patient, Boolean> flossesTeeth;
    public static volatile SingularAttribute<Patient, Boolean> takesMedications;
    public static volatile SingularAttribute<Patient, Boolean> hadDentalProcedures;
    public static volatile SingularAttribute<Patient, String> name;
    public static volatile SingularAttribute<Patient, Boolean> brushesTeethRegularly;
    public static volatile SingularAttribute<Patient, String> dni;
    public static volatile SingularAttribute<Patient, String> medicationsList;
    public static volatile SingularAttribute<Patient, Parent> hasParent;

}