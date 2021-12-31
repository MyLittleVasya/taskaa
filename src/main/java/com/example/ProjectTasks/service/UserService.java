package com.example.ProjectTasks.service;

import com.example.ProjectTasks.domain.Role;
import com.example.ProjectTasks.domain.User;
import com.example.ProjectTasks.repos.UserRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.util.Collections;
import java.util.UUID;

@Service
public class UserService  implements UserDetailsService {
    @Autowired
    private UserRepo userRepo;
    @Autowired
    private MailService mailService;
    @Autowired
    private PasswordEncoder passwordEncoder;
    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        return userRepo.findByUsername(username);
    }

    public void updateProfile(User user, String password) {
        String userPassword = user.getPassword();
        boolean passwordChanged = (password != null && !password.equals(userPassword));
        if (!StringUtils.isEmpty(password)) {
            if (passwordChanged) {
                user.setPassword(passwordEncoder.encode(password));
            }
        }
        userRepo.save(user);
    }

    public boolean addUser(User user){
        User userFromDb = userRepo.findByUsername(user.getUsername());
        if (userFromDb != null){
            return false;
        }
        user.setActive(false);
        user.setRoles(Collections.singleton(Role.USER));
        user.setActivationCode(UUID.randomUUID().toString());
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        userRepo.save(user);
        if (!StringUtils.isEmpty(user.getEmail())){
            String message = String.format(
                    "Hello, %s! \n" +
                            "Welcome to TaskA! \n"+
                            "Visit next link to activate your account \n"+
                            "http://fitmestest.herokuapp.com/activate/%s",
                    user.getUsername(),
                    user.getActivationCode()

            );
            mailService.send(user.getEmail(), "Activate your account", message);
        }
        return true;
    }

    public boolean activateUser(String code){
       User user =  userRepo.findByActivationCode(code);
        if (user == null){
            return false;
        }
        user.setActivationCode(null);
        user.setActive(true);
        userRepo.save(user);
        return true;
    }

}
