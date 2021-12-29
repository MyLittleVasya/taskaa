<#macro login path isRegisterForm>
    <form action="${path}" method="post">
        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
        <div class="row mb-3">
            <label> User Name :  </label>
            <div class="col-sm-10">
                <input type="text" name="username" placeholder="username"/>
            </div>
        </div>
        <div class="row mb-3">
            <label> Password:</label>
            <div class="col-sm-10">
                <input type="password" name="password" placeholder="password"/>
            </div>
        </div>
        <#if isRegisterForm>
        <div class="row mb-3">
            <label> email:</label>
            <div class="col-sm-10">
                <input type="email" name="email" placeholder="example@ex.com"/>
            </div>
        </div>
        </#if>
        <div><button type="submit" class="btn btn-primary bg-success m-2">Sign in</button></div>
        <a href = "/registration">Registration</a>
    </form>
</#macro>

<#macro logout>

    <form action="/logout" method="post">
        <button type="submit" class="btn btn-primary btn-my m-2">Sign out</button>
        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
    </form>

</#macro>