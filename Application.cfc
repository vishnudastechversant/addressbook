component {

    this.name = "addressBook";
    this.applicationTimeout = CreateTimeSpan(10, 0, 0, 0); //10 days
    this.datasource = "addressBook";
    this.sessionStorage = "addressBook"
    this.sessionManagement = true;
    this.sessionTimeout = CreateTimeSpan(0, 10, 0, 0); //30 minutes
    this.ormenabled = "true";
    this.ormsettings={logsql="true", datasource = "addressBook"};
    this.invokeImplicitAccessor = true;

    function onRequestStart(requestname){ 
        if(!structKeyExists(session, "user") or !structKeyExists(session.user, "userId") ){
            if(!(find("login",requestname) > 0 or find("register",requestname) > 0)){
               location("/addressbook/pages/login.cfm",false);
            }
            return true;
        }else{
            if(find("contact",requestname) > 0 and find("login.cfc",requestname) == 0){
                return true;
            }
            if( find("login.cfc",requestname) > 0) {
                if( structKeyExists(url, "method") and url.method == 'logout'){
                    return true;
                }
            }
            location("/addressbook/pages/contact.cfm",false);
        }
    }
}