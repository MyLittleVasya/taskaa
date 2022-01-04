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
                    <li class="nav-item m-2">
                        <form action="/user">
                            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                            <button type="submit" class="btn btn-primary btn-my">User list</button>
                        </form>
                    </li>
                </#if>
                <#if isAdmin || isTeamlead>
                    <li class="nav-item m-2">
                        <form action="/taskAdder">
                            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                            <button type="submit" class="btn btn-primary btn-my">Add task</button>
                        </form>
                    </li>
                </#if>
                <#if isActive>
                    <#if !(isAdmin)>
                        <li class="nav-item m-2">
                            <form action="/taskList">
                                <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                                <button type="submit" class="btn btn-primary btn-my">Tasks</button>
                            </form>
                        </li>
                    </#if>
                </#if>
                <#if isActive>
                    <#if isAdmin || isTeamlead>
                        <li class="nav-item m-2">
                            <form action="/doneTasks">
                                <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                                <button type="submit" class="btn btn-primary btn-my">Done Tasks</button>
                            </form>
                        </li>
                    </#if>
                </#if>
            </ul>
            <#if isActive>
                <#if !sessionStarted>
                    <div class="nav-item m-2">
                        <form action="/session" method="post">
                            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                            <button type="submit" class="btn btn-primary btn-my">Start Session</button>
                        </form>
                    </div>
                <#else>
                    <div class="nav-item m-2">
                        <form action="/session" method="post">
                            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                            <button type="submit" class="btn btn-primary btn-my">End session</button>
                        </form>
                    </div>
                </#if>
            </#if>
            <div class="nav-item m-2">
                <form action="/profile">
                    <button type="submit" class="btn btn-primary btn-my">${name} profile</button>
                </form>
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