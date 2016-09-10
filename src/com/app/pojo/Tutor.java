package com.app.pojo;


public class Tutor extends User {

    String expertise;
    DateRange availability;

    public Tutor() {
        this.isTutor = true;
        this.isStudent = false;
    }

    public String getExpertise() {
        return expertise;
    }

    public void setExpertise(String expertise) {
        this.expertise = expertise;
    }

    public DateRange getAvailability() {
        return availability;
    }

    public void setAvailability(DateRange availability) {
        this.availability = availability;
    }
}