package com.app.dto;

public class UserCredentials {

    private String emailMobile;
    private String password;

    public UserCredentials(String emailMobile, String password) {
        this.emailMobile = emailMobile;
        this.password = password;
    }

    public UserCredentials() {
    }

    public String getEmailMobile() {
        return emailMobile;
    }

    public void setEmailMobile(String emailMobile) {
        this.emailMobile = emailMobile;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}