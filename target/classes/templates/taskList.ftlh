<#import "parts/common.ftlh" as c>
<#include "parts/security.ftlh">
<@c.page>
    <div class="row row-cols-4">
            <#list tasks as task>
                    <#if name == task.executor.getUsername()>
                        <#if !task.isDone()>
                            <div class="col m-1">
                            <form method="post">
                                <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                                <input type="hidden" name="taskId" value="${task.id}"/>
                                    <div class="card">
                                        <div class="card-body">
                                            <h5 class="card-title">${task.name}</h5>
                                            <p class="card-text">${task.description}</p>
                                            <#if sessionStarted>
                                            <button type="submit" action="confirm" class="btn btn-primary btn-my m-2">Task is done</button>
                                            </#if>
                                        </div>
                                    </div>
                            </form>
                            </div>
                        </#if>
                </#if>
            </#list>
    </div>
</@c.page>