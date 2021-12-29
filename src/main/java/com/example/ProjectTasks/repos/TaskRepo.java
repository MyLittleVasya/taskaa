package com.example.ProjectTasks.repos;

import com.example.ProjectTasks.domain.Task;
import com.example.ProjectTasks.domain.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface TaskRepo extends JpaRepository<Task, Long> {
    Task findByExecutor(User user);
}
