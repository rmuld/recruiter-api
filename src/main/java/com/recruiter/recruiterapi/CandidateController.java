package com.recruiter.recruiterapi;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class CandidateController {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @GetMapping("/candidates")
    public List<Candidate> getCandidates() {
        List<Candidate> candidates = jdbcTemplate.query("select * from candidate", (row, count) -> {
                    int id = row.getInt("id");
                    String candidateFirstName = row.getString("firstname");
                    String candidateLastName = row.getString("lastname");
                    String candidatePersonalId = row.getString("personalid");
                    String candidateEmail = row.getString("email");
                    int candidatePhone = row.getInt("phone");
                    String candidateAddress = row.getString("address");

                    Candidate candidate = new Candidate();
                    candidate.setId(id);
                    candidate.setFirstname(candidateFirstName);
                    candidate.setLastname(candidateLastName);
                    candidate.setPersonalid(candidatePersonalId);
                    candidate.setEmail(candidateEmail);
                    candidate.setPhone(candidatePhone);
                    candidate.setAddress(candidateAddress);

                    List<Language> candidateLanguages = this.getLanguages(candidate.getId());
                    candidate.setLanguages(candidateLanguages);

                    List<Job> candidateJobs = this.getJob(candidate.getId());
                    candidate.setJobs(candidateJobs);

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
                    language.setCandidateId(candidateId);
                    language.setLanguageName(candidateLanguageName);
                    language.setLanguageLevel(candidateLanguageLevel);

                    return language;
                }
        );
        return languages;

    }

    private List<Job> getJob(int candidateId) {
        List<Job> jobs = jdbcTemplate.query("select * from job_title where candidate_id = ?", new Object[]{candidateId}, (row, count) -> {
                    String candidateJobName = row.getString("job_name");

                    Job job = new Job();
                    job.setCandidateId(candidateId);
                    job.setJobName(candidateJobName);

                    return job;
                }
        );
        return jobs;

    }

    @PostMapping("/candidate")
    public void addCandidate(@RequestBody Candidate candidate) {
        jdbcTemplate.update("insert into candidate(firstname, lastname, personalid, email, phone, address) values(?, ?, ?, ?, ?, ?)",
                candidate.getFirstname(), candidate.getLastname(), candidate.getPersonalid(),
                candidate.getEmail(), candidate.getPhone(), candidate.getAddress());
    }

    public void addLanguage(@RequestBody Language language) {
        jdbcTemplate.update("insert into language(language_name, language_level, candidate_id) values(?, ?, ?)",
                language.getLanguageName(), language.getLanguageLevel(), language.getCandidateId());
    }
}
