<cfcomponent>
    <cffunction  name="contact" access="remote">
        <cfdump  var="#form#">
        <cfdump  var="#session.user.userId#">
        <cfif structKeyExists(form, 'submit')> <cffile 
                action="upload"
                fileField="photo"
                allowedExtensions="jpg,png,gif"
                destination="E:\Work\Coldfusion\cfusion\wwwroot\addressbook\contactImages"
                nameConflict='MakeUnique'
                result='fileUploadResult'>
            <cfif structKeyExists(form, 'id') and form.id GT 0> 
                <cfset contactObj = EntityNew("contact",form.id)> 
            <cfelse>
                <cfset contactObj = EntityNew("contact")> 
            </cfif>
            <cfset contactObj.setTitle(form.title)>  
            <cfset contactObj.setFirstName(form.firstName)>  
            <cfset contactObj.setLastName(form.lastName)>
            <cfset contactObj.setAddress(form.address)>
            <cfset contactObj.setPhone(form.phone)>
            <cfset contactObj.setPhoto(fileUploadResult.serverFile)>
            <cfset contactObj.setGender(form.gender)>
            <cfset contactObj.setDob(form.dob)>
            <cfset contactObj.setCity(form.city)>
            <cfset contactObj.setState(form.state)>
            <cfset contactObj.setCountry(form.country)>
            <cfset contactObj.setPincode(form.pincode)>
            <cfset contactObj.setUserCreated(session.user.userId)>
            <cfset EntitySave(contactObj)>
        </cfif>
        <cflocation  url="../pages/contact.cfm" addtoken="false">
    </cffunction>
</cfcomponent>