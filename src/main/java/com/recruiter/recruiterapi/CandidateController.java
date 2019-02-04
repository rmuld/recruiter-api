package com.recruiter.recruiterapi;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.jdbc.JdbcTemplateAutoConfiguration;
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
                    String candidateAdress = row.getString("adress");
                    int candidatePhone = row.getInt("phone");

                    Candidate candidate = new Candidate();
                    candidate.setId(id);
                    candidate.setFirstname(candidateFirstName);
                    candidate.setLastname(candidateLastName);
                    candidate.setPersonalid(candidatePersonalId);
                    candidate.setEmail(candidateEmail);
                    candidate.setAdress(candidateAdress);
                    candidate.setPhone(candidatePhone);

                    List<Language> candidateLanguages = this.getLanguages(candidate.getId());
                    candidate.setLanguages(candidateLanguages);

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

    @PostMapping("/candidate")
    public void addCandidate(@RequestBody Candidate candidate) {
        jdbcTemplate.update("insert into candidate(firstname, lastname, personalid, email, adress, phone) values(?, ?, ?, ?, ?, ?)",
                candidate.getFirstname(), candidate.getLastname(), candidate.getPersonalid(),
                candidate.getEmail(), candidate.getAdress(), candidate.getPhone());
    }

    @PostMapping("/language")
    public void addLanguage(@RequestBody Language language) {
        jdbcTemplate.update("insert into language(language_name, language_level, candidate_id) values(?, ?, ?)",
                language.getLanguageName(), language.getLanguageLevel(), language.getCandidateId());
    }
}
