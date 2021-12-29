package com.example.ProjectTasks.domain;

import org.springframework.security.core.GrantedAuthority;

public enum Role implements GrantedAuthority {
    USER, TEAMLEAD, ADMIN;

    @Override
    public String getAuthority() {
        return name();
    }
}
