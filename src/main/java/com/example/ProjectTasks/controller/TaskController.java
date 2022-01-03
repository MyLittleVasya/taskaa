package com.example.ProjectTasks.controller;


import com.example.ProjectTasks.domain.Task;
import com.example.ProjectTasks.domain.User;
import com.example.ProjectTasks.repos.TaskRepo;
import com.example.ProjectTasks.repos.UserRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

@Controller
public class TaskController {

    @Autowired
    private TaskRepo taskRepo;
    @Autowired
    private UserRepo userRepo;


    @GetMapping("/taskAdder")
    @PreAuthorize("hasAnyAuthority('ADMIN', 'TEAMLEAD')")
    public String userList(Model model){
        model.addAttribute("users", userRepo.findAll());
        return "taskAdder";
    }

    @PostMapping("/taskAdder")
    @PreAuthorize("hasAnyAuthority('ADMIN', 'TEAMLEAD')")
    public String addTask(
            @AuthenticationPrincipal User user,
            @RequestParam String taskName,
            @RequestParam String description,
            @RequestParam String executor,
            Model model
            ){
        model.addAttribute("users", userRepo.findAll());
        if (userRepo.findByUsername(executor) == null){
            model.addAttribute("message", "Executor doesn't exist!");
            return "taskAdder";
        }
        else {
            Task task = new Task(taskName, description, userRepo.findByUsername(executor));
            if (user.getId() == task.getExecutor().getId()) {
                model.addAttribute("message", "You can't");
                return "taskAdder";
            } else if (user.isAdmin()) {
                if (task.getExecutor().isAdmin()) {
                    model.addAttribute("message", "You don't have enough permissions");
                    return "taskAdder";
                }
            } else if (user.isTeamLead()) {
                if (task.getExecutor().isAdmin() || task.getExecutor().isTeamLead()) {
                    model.addAttribute("message", "You don't have enough permissions");
                    return "taskAdder";
                }
            }
            taskRepo.save(task);
            return "taskAdder";
        }
    }

    @GetMapping("/doneTasks")
    @PreAuthorize("hasAnyAuthority('ADMIN', 'TEAMLEAD')")
    public String getDoneTasks(Model model){
        Iterable<Task> tasks = taskRepo.findAll();
        model.addAttribute("doneTasks", tasks);
        return "doneTasks";
    }

    @PostMapping("/doneTasks")
    @PreAuthorize("hasAuthority('ADMIN')")
    public String getDoneTasks(@RequestParam long taskId){
        Task task = taskRepo.findById(taskId);
        User user = userRepo.findById(task.getExecutor().getId());
        task.setConfirmed(true);
        user.setSalary(user.getSalary()+user.getPayPerTask());
        userRepo.save(user);
        taskRepo.save(task);
        return "redirect:/doneTasks";
    }



    @PreAuthorize("hasAnyAuthority('USER', 'TEAMLEAD')")
    @GetMapping("/taskList")
    public String tasks(Map<String, Object> model){
        Iterable<Task> tasks = taskRepo.findAll();
        model.put("tasks", tasks);
        return "taskList";

    }
    @PreAuthorize("hasAnyAuthority('USER', 'TEAMLEAD')")
    @PostMapping("/taskList")
    public String taskIsDone(@RequestParam long taskId){
        Task task = taskRepo.findById(taskId);
        User executor = task.getExecutor();
        String pattern = "MM-dd-yyyy";
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern);
        String date = simpleDateFormat.format(new Date());
        task.setDate(date);
        if (!task.isDone())
            task.setDone(true);
        taskRepo.save(task);
        return "redirect:/taskList";
    }

}
