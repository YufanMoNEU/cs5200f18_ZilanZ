package edu.northeastern.cs5200.models;

import java.util.Collection;
import java.util.Date;

public class Developer extends Person {

    private String developerKey;

    public Developer(int id, String firstName, String lastName, String developerKey) {
        super(id, firstName, lastName);
        this.developerKey = developerKey;
    }

    public Developer(int id, String firstName, String lastName, String username, String password,
                     String email, Date dob, String developerKey) {
        super(id, firstName, lastName, username, password, email, dob);
        this.developerKey = developerKey;
    }

    public Developer(int id, String firstName, String lastName, String username, String password,
                     String email, Date dob, Collection<Phone> phones, Collection<Address> addresses,
                     String developerKey) {
        super(id, firstName, lastName, username, password, email, dob, phones, addresses);
        this.developerKey = developerKey;
    }

    public String getDeveloperKey() {
        return developerKey;
    }

    public void setDeveloperKey(String developerKey) {
        this.developerKey = developerKey;
    }

}
