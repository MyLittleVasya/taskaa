<#import "parts/common.ftlh" as c>
<#include "parts/security.ftlh">

<@c.page>
<div class="row row-cols-4">
    <#list doneTasks as task>
        <#if task.isDone()>
            <#if !task.isConfirmed()>
            <div class="col m-1">
                        <div class="card">
                            <div class="card-body">
                                <h5 class="card-title">${task.name}</h5>
                                <p class="card-text">${task.description}</p>
                                <p class="card-text">${task.executor.getUsername()}</p>
                                <form action="/doneTasks/confirm" method="post">
                                    <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                                    <input type="hidden" name="taskId" value="${task.id}"/>
                                    <button class="btn btn-primary btn-my m-2">Confirm Task</button>
                                </form>
                                <form action="/doneTasks/return" method="post">
                                    <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                                    <input type="hidden" name="taskId" value="${task.id}"/>
                                    <button class="btn btn-primary btn-my m-2">Return task</button>
                                </form>
                            </div>
                        </div>
            </div>
            </#if>
        </#if>
    </#list>
</div>
</@c.page>
