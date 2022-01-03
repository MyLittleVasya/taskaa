package com.example.ProjectTasks.repos;


import com.example.ProjectTasks.domain.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepo extends JpaRepository<User, Long> {
    User findByUsername(String username);
    User findById(long id);
    User findByActivationCode(String code);
}
