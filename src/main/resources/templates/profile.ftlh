<#import "parts/common.ftlh" as c>
<@c.page>
    <h5>${username}</h5>
    <form method="post">
        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
        <div class="row mb-3">
            <label> Password:</label>
            <div class="col-sm-10">
                <input type="password" name="password" placeholder="password"/>
            </div>
        </div>
        <div><button type="submit" class="btn btn-primary bg-success m-2">Save</button></div>
    </form>
</@c.page>