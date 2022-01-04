<#macro login path isRegisterForm>
    <form action="${path}" method="post">
        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
            <label> User Name :  </label>
                <input class="input-group-text" type="text" name="username" placeholder="username"/>
            <label>Password:</label>
                <input class="input-group-text" type="password" name="password" placeholder="password"/>
        <#if isRegisterForm>
            <label> email:</label>
                <input class="input-group-text" type="email" name="email" placeholder="example@ex.com"/>
        </#if>
        <div><button type="submit" class="btn btn-primary btn-my m-2">Sign in</button></div>
        <#if !isRegisterForm>
            <a href = "/registration">Registration</a>
        </#if>
    </form>
</#macro>

<#macro logout>

    <form action="/logout" method="post">
        <button type="submit" class="btn btn-primary btn-my m-2">Sign out</button>
        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
    </form>

</#macro>