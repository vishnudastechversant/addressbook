<cfcomponent>
    <cffunction  name="registerUser" access="remote">
        <cfif structKeyExists(form, 'submit')> 
            <cfquery datasource = "addressBook" name='registerUser'>
                INSERT INTO user (first_name, last_name, username, password, email ) 
                VALUES (<cfqueryparam value="#form.firstName#">,<cfqueryparam value="#form.lastName#">,<cfqueryparam value="#form.userName#">,<cfqueryparam value="#hash(form.password)#">,<cfqueryparam value="#form.email#">)
            </cfquery>
            <cflocation  url="../pages/login.cfm" addtoken="false">
        </cfif>
    </cffunction>
</cfcomponent>