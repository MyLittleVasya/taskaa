package com.example.ProjectTasks.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainController {

    /*Start page on / address*/
    @GetMapping("/")
    public String greeting(String name, Model model) {
        return "greeting";
    }

}

