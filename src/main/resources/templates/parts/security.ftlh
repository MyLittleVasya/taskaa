<#assign
know = Session.SPRING_SECURITY_CONTEXT??
>
<#if know>
    <#assign
    user = Session.SPRING_SECURITY_CONTEXT.authentication.principal
    name = user.getUsername()
    isAdmin = user.isAdmin()
    isTeamlead = user.isTeamLead()
    isActive = true
    salary = user.getSalary()
    sessionStarted = user.isSessionStarted()

    >
    <#else>
    <#assign
    name = "unknown"
    isAdmin = false
    isActive = false
    sessionStarted = false
    isTeamlead = false
    >
</#if>