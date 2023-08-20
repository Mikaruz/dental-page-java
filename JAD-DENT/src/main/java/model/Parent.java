package model;

import java.util.Date;

public class Parent extends Person {
    private int parentId;
    private String relationship;

    public Parent() {
    }

    public Parent(int parentId, String relationship, String dni, String name, String lastName, String phoneNumber, String address, Date birthDate) {
        super(dni, name, lastName, phoneNumber, address, birthDate);
        this.parentId = parentId;
        this.relationship = relationship;
    }

    public int getParentId() {
        return parentId;
    }

    public void setParentId(int parentId) {
        this.parentId = parentId;
    }

    public String getRelationship() {
        return relationship;
    }

    public void setRelationship(String relationship) {
        this.relationship = relationship;
    }
}
