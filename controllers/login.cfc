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
        <cfif structKeyExists(session, "user")>
            <cfset structClear(session.user) />
        </cfif>
        <cflocation  url="../pages/login.cfm" addtoken="false">
    </cffunction>
    <cffunction  name="google" access="remote"> 
        <cfoauth
            Type="Google"
            clientid="1066162450733-2052tgb4va1mklhpvr8t1evodqn9otgf.apps.googleusercontent.com" 
            scope="https://www.googleapis.com/auth/userinfo.email+https://www.googleapis.com/auth/userinfo.profile"
            secretkey="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" 
            result="resultUser"  
            redirecturi="http://localhost:8500/addressbook/controllers/login.cfc?method=google">
            <cfset   userDetailExist = ormExecuteQuery( "FROM user WHERE email = '#resultUser.other.email#'" ) />
            <cfif arrayIsEmpty(userDetailExist )>
                <cfset  userObj = entityNew('user')/>
                <cfset  userObj.setFirstName("#resultUser.other.given_name#")/>
                <cfset  userObj.setLastName("#resultUser.other.family_name#")/>
                <cfset  userObj.setUserName("#resultUser.other.given_name#")/>
                <cfset  userObj.setEmail("#resultUser.other.email#")/>
                <cfset EntitySave(userObj) />
                <cfset  userDetailExist = ormExecuteQuery( "FROM user WHERE id = '#userObj.getid()#'" ) />
            </cfif>
            <cfset session.user["userId"] = userDetailExist["1"].id>    
            <cfset session.user["name"] = userDetailExist["1"].getName()>
            <cflocation  url="../controllers/login.cfc?method=authenticateRedirect" addtoken="false">
    </cffunction>
    <cffunction  name="facebook" access="remote" returnformat="plain" returntype ="boolean" output="false"> 
        <cfargument name="email" type="string" required="true" />
        <cfargument name="first_name" type="string" required="true" />
        <cfargument name="last_name" type="string" required="true" />
            <cfset   userDetailExist = ormExecuteQuery( "FROM user WHERE email = '#email#'" ) />
            <cfif arrayIsEmpty(userDetailExist )>
                <cfset  userObj = entityNew('user')/>
                <cfset  userObj.setFirstName("#first_name#")/>
                <cfset  userObj.setLastName("#last_name#")/>
                <cfset  userObj.setUserName("#first_name#")/>
                <cfset  userObj.setEmail("#email#")/>
                <cfset EntitySave(userObj) />
                <cfset session.user["userId"] = userObj.getid()>    
                <cfset session.user["name"] = userObj.getName()>
            <cfelse>
                <cfset session.user["userId"] = userDetailExist["1"].id>    
                <cfset session.user["name"] = userDetailExist["1"].getName()>
            </cfif>
            <cfreturn true>
    </cffunction>
    <cffunction  name="authenticateRedirect" access="remote">
        <cfif structKeyExists(session, "user")>
            <cfif structKeyExists(session.user, "userId")>
            <cflocation  url="../pages/contact.cfm" addtoken="false">
            </cfif>
        </cfif>
        <cflocation  url="../pages/login.cfm" addtoken="false">
    </cffunction>
</cfcomponent>