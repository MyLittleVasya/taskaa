<#import "parts/common.ftlh" as c>
<#include "parts/security.ftlh">

<@c.page>
    <label>${message?ifExists}</label>
    <form action="/taskAdder" method="post">
        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
        <div class="row mb-3">
            <label> Task name:  </label>
            <div class="col-sm-10 ">
                <input type="text" name="taskName" placeholder="Name"/>
            </div>
        </div>
        <div class="row mb-3 h-75">
            <label> Description:</label>
            <div class="col-sm-10">
                <input type="text" name="description" placeholder="Description"/>
            </div>
        </div>
        <label for="exampleDataList" class="form-label">Executor of the task</label>
        <div>
        <input class="form-control-sm-10" list="datalistOptions" name="executor" placeholder="Type to search...">
        <datalist id="datalistOptions">
            <#list users as user>
                <#if isAdmin>
                        <#if !(user.isAdmin())>
                            <option value=${user.username}>
                        </#if>
                </#if>
                <#if isTeamlead>
                        <#if !(user.isAdmin()) && !(user.isTeamLead())>
                            <option value=${user.username}>
                        </#if>
                </#if>
            </#list>
        </datalist>
        </div>
        <div><button type="submit" class="btn btn-primary bg-success m-2">Add task</button></div>
        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
    </form>






</@c.page>