<cfcomponent>
        <cfdump  var="#form#">   
    <cfif structKeyExists(form, 'submit')> 
        <cfdump  var="#form#">   
        <cfset userObj = EntityNew("user")> 
        <cfset userObj.setFirstName(form.firstName)>  
        <cfset userObj.setLastName(form.lastName)>  
        <cfset userObj.setUserName(form.userName)>  
        <cfset userObj.setPassword(form.password)>  
        <cfset userObj.setEmail(form.email)>
        <cfset userObj.setPhone("985845555")>
        <cfset userObj.setProfileImage("985845555")>
        <cfset userObj.setCreatedAt("1642492137")>
        <cfset userObj.setUpdatedAt("1642492137")>
        <cfset EntitySave(userObj)>
    </cfif>
</cfcomponent>