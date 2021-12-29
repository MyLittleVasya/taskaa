<#import "parts/common.ftlh" as c>
<#include "parts/security.ftlh">
<@c.page>
<#list tasks as task>
    <#if name == task.executor.getUsername()>
                <div class="card" style="width: 18rem;">
                    <div class="card-body">
                        <h5 class="card-title">${task.name}</h5>
                        <p class="card-text">${task.description}</p>
                        <a href="#" class="btn btn-primary">Go somewhere</a>
                    </div>
                </div>
    </#if>

</#list>

</@c.page>