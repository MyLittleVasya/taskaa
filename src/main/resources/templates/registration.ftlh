<#import "parts/common.ftlh" as c>
<#import "parts/login.ftlh" as l>

<@c.page>
<body>
<div align="center">
<#if message??>
        <div class="alert alert-danger w-25" role="alert">
                ${message?ifExists}
        </div>
</#if>
<@l.login "/registration" true/>
</div>
</body>
</@c.page>