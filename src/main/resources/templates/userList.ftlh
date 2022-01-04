<#import "parts/common.ftlh" as c>
<@c.page>
    <div class="row row-cols-4">
        <#list users as user>
            <#if !user.isAdmin()>
                <div class="card col m-1">
                    <div class="card-body">
                         <p>Username:   <h5>${user.username}</h5></p>
                         <p>Roles:   <h5><#list user.roles as role>${role}<#sep>, </#list></h5></p>
                         <form action="/user/${user.id}">
                             <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                            <button class="btn btn-primary btn-my m-2" type="submit">Edit</button>
                         </form>
                    </div>
                </div>
            </#if>
        </#list>
    </div>
</@c.page>