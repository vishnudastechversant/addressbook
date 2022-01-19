<cfcomponent>
    <cffunction  name="postUser" access="remote">
    <cfif structKeyExists(form, 'submit')> 
        <cfset userObj = EntityNew("user")> 
        <cfset userObj.setFirstName(form.firstName)>  
        <cfset userObj.setLastName(form.lastName)>  
        <cfset userObj.setUserName(form.userName)>  
        <cfset userObj.setPassword(form.password)>  
        <cfset userObj.setEmail(form.email)>
        <cfset EntitySave(userObj)>
    </cfif>
    </cffunction>
</cfcomponent>