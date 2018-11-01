package edu.northeastern.cs5200.models;

import java.util.Date;

public class User extends Person {

    private Boolean approvedUser;
    private Boolean userAgreement;

    public User(int id, String firstName, String lastName) {
        super(id, firstName, lastName);
        this.userAgreement = false;
    }

    public User(int id, String firstName, String lastName, String username, String password, String email, Date dob) {
        super(id, firstName, lastName, username, password, email, dob);
        this.userAgreement = false;
    }

    public User(int id, String firstName, String lastName, String username, String password, String email, Date dob, Boolean userAgreement) {
        super(id, firstName, lastName, username, password, email, dob);
        this.userAgreement = userAgreement;
    }

    public Boolean getApprovedUser() {
        return approvedUser;
    }

    public void setApprovedUser(Boolean approvedUser) {
        this.approvedUser = approvedUser;
    }

    public Boolean getUserAgreement() {
        return userAgreement;
    }

    public void setUserAgreement(Boolean userAgreement) {
        this.userAgreement = userAgreement;
    }
}
