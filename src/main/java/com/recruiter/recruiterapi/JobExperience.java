package com.recruiter.recruiterapi;

public class JobExperience {
    private String company_name;
    private String position;
    private String job_duties;
    private String job_begin;
    private String job_end;

    public String getCompany_name() {return company_name;}
    public void setCompany_name(String company_name) {this.company_name = company_name;}

    public String getPosition() {return position;}
    public void setPosition(String position) {this.position = position;}

    public String getJob_duties() {return job_duties;}
    public void setJob_duties(String job_duties) {this.job_duties = job_duties; }

    public String getJob_begin() { return job_begin; }
    public void setJob_begin(String job_begin) { this.job_begin = job_begin; }

    public String getJob_end() { return job_end; }
    public void setJob_end(String job_end) { this.job_end = job_end; }



}
