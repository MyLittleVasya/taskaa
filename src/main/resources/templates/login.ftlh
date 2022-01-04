<#import "parts/common.ftlh" as c>
<#import "parts/login.ftlh" as l>

<@c.page>
    <div align="center">
    ${message?ifExists}
        <@l.login "/login" false/>
    </div>
</@c.page>
