package com.example.ProjectTasks.controller;

import com.example.ProjectTasks.domain.Role;
import com.example.ProjectTasks.domain.User;
import com.example.ProjectTasks.repos.UserRepo;
import com.example.ProjectTasks.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;
import java.util.Map;
import java.util.Set;
import java.util.stream.Collectors;

@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    private UserRepo userRepo;

    @Autowired
    private UserService userService;


    @PreAuthorize("hasAuthority('ADMIN')")
    @GetMapping
    public String userList(Model model){
        model.addAttribute("users", userRepo.findAll());
        return "userList";
    }
    @PreAuthorize("hasAuthority('ADMIN')")
    @GetMapping("{user}")
    public String userEditForm(@PathVariable User user, Model model){
        model.addAttribute("user", user);
        model.addAttribute("roles", Role.values());
        model.addAttribute("payment", user.getPayPerTask());
        return "userEdit";
    }
    @PreAuthorize("hasAuthority('ADMIN')")
    @PostMapping
    public String userSave(
            @RequestParam("userId") User user,
            @RequestParam String username,
            @RequestParam Map<String, String> form,
            @RequestParam long payment
    ){
        user.setUsername(username);
        user.setPayPerTask(payment);
        Set<String> roles = Arrays.stream(Role.values())
                .map(Role::name)
                .collect(Collectors.toSet());
        user.getRoles().clear();
        for(String key:form.keySet()){
            if (roles.contains(key)){
                user.getRoles().add(Role.valueOf(key));
            }
        }
        userRepo.save(user);
        return "redirect:/user";
    }

    @GetMapping("profile")
    public String getProfile(Model model, @AuthenticationPrincipal User user){
        model.addAttribute("username", user.getUsername());
        return "profile";
    }

    @PostMapping("profile")
    public String updProfile(@AuthenticationPrincipal User user, @RequestParam String password){
        userService.updateProfile(user, password);
        return "redirect:/user/profile";
    }
}
