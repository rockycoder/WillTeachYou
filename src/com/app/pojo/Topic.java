package com.app.pojo;

//topic for a student to study e.g. C.S -> DataStructures in Java
public class Topic {

    private String title;
    private String description;

    public Topic(String title, String description) {
        this.title = title;
        this.description = description;
    }

    public Topic() {
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}