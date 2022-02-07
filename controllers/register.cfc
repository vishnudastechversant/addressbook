<cfcomponent>
    <cffunction  name="registerUser" access="remote">
        <cfif structKeyExists(form, 'submit')> 
            <cfset   userDetailExist = ormExecuteQuery( "FROM user WHERE email = '#form.email#'" ) />
            <cfif arrayIsEmpty(userDetailExist )>
                <cftry>
                    <cfquery datasource = "addressBook" name='registerUser'>
                        INSERT INTO user (first_name, last_name, username, password, email ) 
                        VALUES (<cfqueryparam value="#form.firstName#">,
                        <cfqueryparam value="#form.lastName#" cfsqltype="cf_sql_varchar">,
                        <cfqueryparam value="#form.userName#" cfsqltype="cf_sql_varchar">,
                        <cfqueryparam value="#hash(form.password)#" cfsqltype="cf_sql_varchar">,
                        <cfqueryparam value="#form.email#" cfsqltype="cf_sql_varchar">)
                    </cfquery>
                <cfcatch type="exception">
                    <cflocation  url="../pages/register.cfm" addtoken="false">
                </cfcatch>
                </cftry>
                <cflocation  url="../pages/login.cfm" addtoken="false">
            <cfelse>
                <cflocation  url="../pages/register.cfm" addtoken="false">
            </cfif>
        </cfif>
    </cffunction>
</cfcomponent>