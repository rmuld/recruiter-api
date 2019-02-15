package com.recruiter.recruiterapi;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/users")
public class UserController {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private BCryptPasswordEncoder passwordEncoder;

    public UserController() {
    }

    @PostMapping("/sign-up")
    public void signUp(@RequestBody User user) {
        String username = user.getUsername();
        String password = passwordEncoder.encode(user.getPassword()); //siin kohas tehakse minu parool sigrimigriks, mis läheb andmebaasi
        userRepository.addUser(username, password);
    }
}
