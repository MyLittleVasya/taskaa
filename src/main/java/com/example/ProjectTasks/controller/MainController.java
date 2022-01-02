package com.example.ProjectTasks.controller;

import com.example.ProjectTasks.domain.User;
import com.example.ProjectTasks.repos.UserRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class MainController {
    @Autowired
    private UserRepo userRepo;
    /*Start page on / address*/
    @GetMapping("/")
    public String greeting(String name, Model model) {
        return "greeting";
    }

    @GetMapping("/login")
    public String login(){
        return "login";
    }

    @PostMapping("/*")
    public String startSession(
            @AuthenticationPrincipal User user
    ) {
        if (!user.isSessionStarted())
            user.setSessionStarted(true);
        else
            user.setSessionStarted(false);
        userRepo.save(user);
        return "redirect:/";
    }
}

