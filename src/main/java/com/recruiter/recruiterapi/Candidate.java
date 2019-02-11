package com.recruiter.recruiterapi;

import java.util.ArrayList;
import java.util.List;

public class Candidate {
    private int id;
    private String firstname;
    private String lastname;
    private String personalid;
    private String email;
    private int phone;
    private String address;
    private String linkedin;
    private String comment;
    private String picture;
    private String job_title;

    private List<Language> languages = new ArrayList<>();
    private List<Education> educations = new ArrayList<>();
    private List<JobExperience> jobExperiences = new ArrayList<>();

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

    public int getPhone() {return phone;}
    public void setPhone(int phone) {this.phone = phone;}

    public String getAddress() {return address;}
    public void setAddress(String address) {this.address = address;}

    public String getLinkedin() { return linkedin; }
    public void setLinkedin(String linkedin) { this.linkedin = linkedin; }

    public String getComment() { return comment; }
    public void setComment(String comment) { this.comment = comment; }

    public String getPicture() { return picture; }
    public void setPicture(String picture) { this.picture = picture; }

    public String getJob_title() {return job_title;}
    public void setJob_title(String job_title) {this.job_title = job_title;}

    public List<Language> getLanguages() { return languages; }
    public void setLanguages(List<Language> languages) {this.languages = languages;}

    public List<Education> getEducations() { return educations; }
    public void setEducations(List<Education> educations) { this.educations = educations; }

    public List<JobExperience> getJobExperiences() { return jobExperiences; }
    public void setJobExperiences(List<JobExperience> jobExperiences) { this.jobExperiences = jobExperiences; }
}
