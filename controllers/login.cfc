<cfcomponent>
    <cffunction  name="loginUser" access="remote">
        <cfif structKeyExists(form, 'submit')>
            <cfset userData = entityLoad("user",{userName:form.username,password:hash(form.password)})>
            <cfdump  var="#arrayIsEmpty(userData)#">
             <cfif arrayIsEmpty(userData)> 
                <cflocation  url="../pages/login.cfm" addtoken="false">
            <cfelse>
                <cfset session.user["userId"] = userData["1"].id>    
                <cfset session.user["name"] = userData["1"].getName()>
                <cflocation  url="../pages/contact.cfm" addtoken="false">
            </cfif>
        </cfif>
    </cffunction>
    <cffunction  name="logout" access="remote">
        <cfset structClear(session.user) />
        <cflocation  url="../pages/login.cfm" addtoken="false">
    </cffunction>
</cfcomponent>