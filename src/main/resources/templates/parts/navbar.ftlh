<#include "security.ftlh">
<#import "login.ftlh" as l>
<nav class="navbar navbar-expand-lg navbar-dark bg-success mb-3">
    <div class="container-fluid">
        <a class="navbar-brand" href="/">TaskA</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <#if isAdmin>
                <li class="nav-item">
                    <a class="nav-link" aria-current="page" href="/user">User list</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" aria-current="page" href="/taskAdder">Add task</a>
                </li>
                </#if>
                <#if isActive>
                <#if !(isAdmin)>
                <li class="nav-item">
                    <a class="nav-link" aria-current="page" href="/taskList">Tasks</a>
                </li>
                </#if>
                </#if>
            </ul>
            <div class="nav-item">
                <a class="nav-link" aria-current="page" href="user/profile">${name}</a>
            </div>
            <#if isActive>
            <@l.logout />
            </#if>
            <#if !isActive>
            <form action="/login">
            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
            <button type="submit" class="btn btn-primary btn-my m-2">Login</button>
            </form>
            </#if>
        </div>
    </div>
</nav>