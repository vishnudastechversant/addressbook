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
                    <cfinvoke  method="fiveSecondTimer">
                    <cflocation  url="../pages/login.cfm" addtoken="false">
                <cfcatch type="exception">
                    <cflocation  url="../pages/register.cfm" addtoken="false">
                </cfcatch>
                </cftry>
            <cfelse>
                <cflocation  url="../pages/register.cfm" addtoken="false">
            </cfif>
        </cfif>
    </cffunction>
    <cffunction  name="fiveSecondTimer">
        <cfset startTime = now()>
        <cfloop index="i" from="#startTime#" to="#dateAdd("s", 5, startTime)#" step="#CreateTimeSpan(0,0,0,1)#">
            <cfdump  var="#i#">
        </cfloop>
    </cffunction>
</cfcomponent>