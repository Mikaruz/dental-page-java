package model;

import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import model.UserAdmin;

@Generated(value="EclipseLink-2.7.12.v20230209-rNA", date="2023-11-08T17:36:10")
@StaticMetamodel(Administrator.class)
public class Administrator_ { 

    public static volatile SingularAttribute<Administrator, String> lastName;
    public static volatile SingularAttribute<Administrator, Integer> administratorId;
    public static volatile SingularAttribute<Administrator, String> name;
    public static volatile SingularAttribute<Administrator, UserAdmin> user;

}