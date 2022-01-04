<#import "parts/common.ftlh" as c>
<#include "parts/security.ftlh">
<@c.page>
    <div align="center">
    Your username in system:
    <h5>${username}</h5>
    Your current salary:<h3>${salary}$</h3>
    <form method="post">
        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
        <div class="row mb-3">
            <label> Password:</label>
            <div class="mt-2">
                <input type="password" name="password" placeholder="password"/>
            </div>
            <div class="mt-2">
                <input type="email" name="email" value="${user.getEmail()?ifExists}" placeholder="example@ex.com"/>
            </div>
        </div>
        <div><button type="submit" class="btn btn-primary btn-my" >Save</button></div>
    </form>
    </div>
</@c.page>