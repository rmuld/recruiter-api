package com.recruiter.recruiterapi;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
public class CandidateController {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @GetMapping("/candidates")
    public List<Candidate> getCandidatesByJobTitle(@RequestParam String job_title) {
        List<Candidate> candidates = jdbcTemplate.query("select * from candidate where job_title=?", new Object[]{job_title}, (row, count) -> {

                    int id = row.getInt("id");
                    String candidateFirstName = row.getString("firstname");
                    String candidateLastName = row.getString("lastname");
                    String candidatePersonalId = row.getString("personalid");
                    String candidateEmail = row.getString("email");
                    String candidatePhone = row.getString("phone");
                    String candidateAddress = row.getString("address");
                    String candidateLinkedIn = row.getString("linkedin");
                    String candidateComment = row.getString("comment");
                    String candidatePicture = row.getString("picture");
                    String candidateJob_title = row.getString("job_title");

                    Candidate candidate = new Candidate();
                    candidate.setId(id);
                    candidate.setFirstname(candidateFirstName);
                    candidate.setLastname(candidateLastName);
                    candidate.setPersonalid(candidatePersonalId);
                    candidate.setEmail(candidateEmail);
                    candidate.setPhone(candidatePhone);
                    candidate.setAddress(candidateAddress);
                    candidate.setLinkedin(candidateLinkedIn);
                    candidate.setComment(candidateComment);
                    candidate.setPicture(candidatePicture);
                    candidate.setJob_title(candidateJob_title);

                    List<Language> candidateLanguages = this.getLanguages(candidate.getId());
                    candidate.setLanguages(candidateLanguages);

                    List<Education> candidateEducations = this.getEducations(candidate.getId());
                    candidate.setEducations(candidateEducations);

                    List<JobExperience> candidateJobExperiences = this.getJobExperiences(candidate.getId());
                    candidate.setJobExperiences(candidateJobExperiences);

                    return candidate;
                }
        );
        return candidates;
    }

    private List<Language> getLanguages(int candidateId) {
        List<Language> languages = jdbcTemplate.query("select * from language where candidate_id = ?", new Object[]{candidateId}, (row, count) -> {
                    String candidateLanguageName = row.getString("language_name");
                    String candidateLanguageLevel = row.getString("language_level");

                    Language language = new Language();
                    language.setLanguageName(candidateLanguageName);
                    language.setLanguageLevel(candidateLanguageLevel);

                    return language;
                }
        );
        return languages;

    }

    private List<Education> getEducations(int candidateId) {
        List<Education> educations = jdbcTemplate.query("select * from education where candidate_id = ?", new Object[]{candidateId}, (row, count) -> {
                    String candidateEducationLevel = row.getString("education_level");
                    String candidateSchoolName = row.getString("school_name");
                    String candidateSubject = row.getString("subject");
                    String candidateStudyBegin = row.getString("study_begin");
                    String candidateStudyEnd = row.getString("study_end");


                    Education education = new Education();
                    education.setEducation_level(candidateEducationLevel);
                    education.setSchool_name(candidateSchoolName);
                    education.setSubject(candidateSubject);
                    education.setStudy_begin(candidateStudyBegin);
                    education.setStudy_end(candidateStudyEnd);

                    return education;
                }
        );
        return educations;
    }

    private List<JobExperience> getJobExperiences(int candidateId) {
        List<JobExperience> jobExperiences = jdbcTemplate.query("select * from job_experience where candidate_id = ?", new Object[]{candidateId}, (row, count) -> {
                    String candidateCompanyName = row.getString("company_name");
                    String candidatePosition = row.getString("position");
                    String candidateJobDuties = row.getString("job_duties");
                    String candidateJobBegin = row.getString("job_begin");
                    String candidateJobEnd = row.getString("job_end");


                    JobExperience jobExperience = new JobExperience();
                    jobExperience.setCompany_name(candidateCompanyName);
                    jobExperience.setPosition(candidatePosition);
                    jobExperience.setJob_duties(candidateJobDuties);
                    jobExperience.setJob_begin(candidateJobBegin);
                    jobExperience.setJob_end(candidateJobEnd);

                    return jobExperience;
                }
        );
        return jobExperiences;
    }

    @PostMapping("/candidate")
    public void addCandidate(@RequestBody Candidate candidate) {
        jdbcTemplate.update("insert into candidate(firstname, lastname, personalid, email, phone, address, linkedin, picture, job_title) values(?, ?, ?, ?, ?, ?, ?, ?, ?)",
                candidate.getFirstname(), candidate.getLastname(), candidate.getPersonalid(),
                candidate.getEmail(), candidate.getPhone(), candidate.getAddress(), candidate.getLinkedin(), candidate.getPicture(), candidate.getJob_title());
        int id = jdbcTemplate.queryForObject("select max(id) from candidate", Integer.class);

        for (Language language : candidate.getLanguages()) {
            jdbcTemplate.update("insert into language(language_name, language_level, candidate_id) values(?, ?, ?)",
                    language.getLanguageName(), language.getLanguageLevel(), id);
        }
        for (Education education : candidate.getEducations()) {
            jdbcTemplate.update("insert into education(education_level, school_name, subject, study_begin, study_end, candidate_id) values (?, ?, ?, ?, ?, ?)",
                    education.getEducation_level(), education.getSchool_name(), education.getSubject(), education.getStudy_begin(), education.getStudy_end(), id);
        }

        for (JobExperience experience : candidate.getJobExperiences()) {
            jdbcTemplate.update("insert into job_experience(company_name, position, job_duties, job_begin, job_end, candidate_id) values (?, ?, ?, ?, ?, ?)",
                    experience.getCompany_name(), experience.getPosition(), experience.getJob_duties(), experience.getJob_begin(), experience.getJob_end(), id);
        }
    }

    @PostMapping("/comment")
    public void addComment(@RequestBody Candidate candidate) {
        jdbcTemplate.update("update candidate set comment=? where id=?",
                candidate.getComment(), candidate.getId());

    }
}