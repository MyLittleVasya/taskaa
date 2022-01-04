<#import "parts/common.ftlh" as c>
<#include "parts/security.ftlh">

<@c.page>
    <div class="sm-15" align="center">
        <#if message??>
            <div class="alert alert-danger w-25" role="alert">
                ${message?ifExists}
            </div>
        </#if>
        <form action="/taskAdder" method="post">
            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
            <div>
                <label> Task name:  </label>
                <div>
                    <input class="input-group-text" type="text" name="taskName" placeholder="Name"/>
                </div>
            </div>
            <div>
                <label> Description:</label>
                <div>
                    <input class="input-group-text" type="text" name="description" placeholder="Description"/>
                </div>
            </div>
            <label for="exampleDataList" class="form-label">Executor of the task</label>
            <div>
            <input class="form-control-sm-10 input-group-text" list="datalistOptions" name="executor" placeholder="Type to search...">
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
                <button type="submit" class="btn btn-primary btn-my m-2">Add task</button>
    </form>
    </div>
</@c.page>