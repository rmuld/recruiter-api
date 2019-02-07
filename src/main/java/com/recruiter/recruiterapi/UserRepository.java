package com.recruiter.recruiterapi;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class UserRepository {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    public void addUser(String username, String password) {
        jdbcTemplate.update("insert into user (username, password) value (?, ?)", username, password);
    }

    public User getUser(String username) {
        return jdbcTemplate.queryForObject("select * from user where username = ?",
                new Object[]{username},
                (row, count) -> {
                    User user = new User();
                    user.setId(row.getInt("id"));
                    user.setUsername(row.getString("username"));
                    user.setPassword(row.getString("password"));
                    return user;
                });
    }
}

