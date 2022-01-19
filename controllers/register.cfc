<cfcomponent>
    <cffunction  name="postUser" access="remote">
        <cfif structKeyExists(form, 'submit')> 
            <cfset userObj = EntityNew("user")> 
            <cfset userObj.setFirstName(form.firstName)>  
            <cfset userObj.setLastName(form.lastName)>  
            <cfset userObj.setUserName(form.userName)>  
            <cfset userObj.setPassword(hash(form.password))>  
            <cfset userObj.setEmail(form.email)>
            <cfset EntitySave(userObj)>
            <cflocation  url="../pages/login.cfm" addtoken="false">
        </cfif>
    </cffunction>
</cfcomponent>