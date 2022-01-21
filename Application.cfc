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
}