package model;

import java.util.List;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import model.Parent;

@Generated(value="EclipseLink-2.7.12.v20230209-rNA", date="2023-09-20T11:40:28")
@StaticMetamodel(Patient.class)
public class Patient_ extends Person_ {

    public static volatile SingularAttribute<Patient, String> previousProcedures;
    public static volatile SingularAttribute<Patient, List> appointments;
    public static volatile SingularAttribute<Patient, Boolean> flossesTeeth;
    public static volatile SingularAttribute<Patient, Boolean> takesMedications;
    public static volatile SingularAttribute<Patient, Boolean> hadDentalProcedures;
    public static volatile SingularAttribute<Patient, Boolean> hasAllergies;
    public static volatile SingularAttribute<Patient, String> allergiesDescription;
    public static volatile SingularAttribute<Patient, Boolean> brushesTeethRegularly;
    public static volatile SingularAttribute<Patient, String> medicationsList;
    public static volatile SingularAttribute<Patient, Parent> hasParent;

}