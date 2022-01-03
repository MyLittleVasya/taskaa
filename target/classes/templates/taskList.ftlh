<#import "parts/common.ftlh" as c>
<#include "parts/security.ftlh">
<@c.page>
<#list tasks as task>
    <#if name == task.executor.getUsername()>
        <#if !task.isDone()>
            <form method="post">
                <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                <input type="hidden" name="taskId" value="${task.id}"/>
                    <div class="card" style="width: 18rem;">
                        <div class="card-body">
                            <h5 class="card-title">${task.name}</h5>
                            <p class="card-text">${task.description}</p>
                            <#if sessionStarted>
                            <button type="submit" class="btn btn-primary btn-my m-2">Task is done</button>
                            </#if>
                        </div>
                    </div>
            </form>
        </#if>
    </#if>
</#list>

</@c.page>