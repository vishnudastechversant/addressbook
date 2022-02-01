component {

    this.name = "addressBook";
    this.applicationTimeout = CreateTimeSpan(10, 0, 0, 0); //10 days
    this.datasource = "addressBook";
    this.sessionStorage = "addressBook"
    this.sessionManagement = true;
    this.sessionTimeout = CreateTimeSpan(0, 10, 0, 0);
    this.ormenabled = "true";
    this.ormsettings={logsql="true", datasource = "addressBook"};
    this.invokeImplicitAccessor = true;

    function onRequestStart(requestname){ 
        if(!structKeyExists(session, "user") or !structKeyExists(session.user, "userId") ){
            if(!(find("login",requestname) > 0 or find("register",requestname) > 0)){
               location("/addressbook/pages/login.cfm",false);
            }
        }
    }
}