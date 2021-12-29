package com.example.ProjectTasks.controller;


import com.example.ProjectTasks.domain.Task;
import com.example.ProjectTasks.repos.TaskRepo;
import com.example.ProjectTasks.repos.UserRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Map;

@Controller
public class TaskController {

    @Autowired
    private TaskRepo taskRepo;
    @Autowired
    private UserRepo userRepo;


    @GetMapping("/taskAdder")
    @PreAuthorize("hasAuthority('ADMIN')")
    public String userList(Model model){
        model.addAttribute("users", userRepo.findAll());
        return "taskAdder";
    }

    @PostMapping("/taskAdder")
    @PreAuthorize("hasAuthority('ADMIN')")
    public String addTask(
            @RequestParam String taskName,
            @RequestParam String description,
            @RequestParam String executor
            ){
        Task task = new Task(taskName, description, userRepo.findByUsername(executor));
        taskRepo.save(task);
        return "redirect:/taskAdder";
    }

    @GetMapping("/taskList")
    public String tasks(Map<String, Object> model){
        Iterable<Task> tasks = taskRepo.findAll();
        model.put("tasks", tasks);
        return "taskList";

    }

}
