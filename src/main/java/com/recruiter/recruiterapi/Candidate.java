package com.recruiter.recruiterapi;

import java.util.ArrayList;
import java.util.List;

public class Candidate {
    private int id;
    private String firstname;
    private String lastname;
    private String personalid;
    private String email;
    private String adress;
    private int phone;
    private List<Language> languages = new ArrayList<>();

    public int getId() { return id; }
    public void setId(int id) {
        this.id = id;
    }

    public String getFirstname() {return firstname; }
    public void setFirstname(String firstname) {this.firstname = firstname;}

    public String getLastname() {return lastname;}
    public void setLastname(String lastname) {this.lastname = lastname;}

    public String getPersonalid() {return personalid;}
    public void setPersonalid(String personalid) {this.personalid = personalid;}

    public String getEmail() {return email;}
    public void setEmail(String email) {this.email = email;}

    public String getAdress() {return adress;}
    public void setAdress(String adress) {this.adress = adress;}

    public int getPhone() {return phone;}
    public void setPhone(int phone) {this.phone = phone;}

    public List<Language> getLanguages() { return languages; }
    public void setLanguages(List<Language> languages) {this.languages = languages;}
}