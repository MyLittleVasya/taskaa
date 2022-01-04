<#import "parts/common.ftlh" as c>
<@c.page>
    <div class="sm-10" align="center">
    <form action="/user" method="post">
        Username:
        <input class="input-group-text" type="text" value="${user.username}" name="username">
        <div class="roles_class mt-2" align="left">
            <#list roles as role>
                <div>
                    <label><input class="form-check-input mt-0" type="checkbox" name="${role}" ${user.roles?seq_contains(role)?string("checked", "")}/>
                        ${role}</label>
                </div>
            </#list>
        </div>
        <p>Payment: <input class="input-group-text" type="number" value="${payment}" name="payment"></p>
        <p>Salary: <input class="input-group-text" type="number" value="${salary}" name="salary"></p>
        <button class="btn btn-primary btn-my m-2" type="submit">Save changes</button>
        <input type="hidden" value="${user.id}" name="userId">
        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
    </form>
    </div>
</@c.page>