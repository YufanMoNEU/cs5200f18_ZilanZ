package edu.northeastern.cs5200.models;

public class Phone {

    private String phone;
    private Boolean isPrimary;

    private Person person;

    public Phone() {
    }

    public Phone(String phone, Boolean isPrimary, Person person) {
        this.phone = phone;
        this.isPrimary = isPrimary;
        this.person = person;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public boolean getPrimary() {
        return this.isPrimary;
    }

    public void setPrimary(Boolean primary) {
        isPrimary = primary;
    }

    public Person getPerson() {
        return person;
    }

    public void setPerson(Person person) {
        this.person = person;
    }
}
