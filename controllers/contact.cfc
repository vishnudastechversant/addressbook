<cfcomponent>
    <cffunction  name="contact" access="remote">
        <cfif structKeyExists(form, 'id')> 
            <cfif form.id GT 0> 
                <cfset contactObj = EntityLoad("contact",form.id,true)> 
            <cfelse>
                <cfset contactObj = EntityNew("contact")> 
            </cfif>
            <cfif structKeyExists(form, 'photo') and form.photo != ""  and form.photoChange == 0> 
                <cffile 
                    action="upload"
                    fileField="photo"
                    allowedExtensions="jpg,png,gif"
                    destination="E:\Work\Coldfusion\cfusion\wwwroot\addressbook\contactImages"
                    nameConflict='MakeUnique'
                    result='fileUploadResult'>
                <cfset contactObj.setPhoto(fileUploadResult.serverFile)>
            </cfif>
            <cfset contactObj.setTitle(form.title)>  
            <cfset contactObj.setFirstName(form.firstName)>  
            <cfset contactObj.setLastName(form.lastName)>
            <cfset contactObj.setAddress(form.address)>
            <cfset contactObj.setPhone(form.phone)>
            <cfset contactObj.setGender(form.gender)>
            <cfset contactObj.setDob(form.dob)>
            <cfset contactObj.setEmail(form.email)>
            <cfset contactObj.setCity(form.city)>
            <cfset contactObj.setState(form.state)>
            <cfset contactObj.setCountry(form.country)>
            <cfset contactObj.setPincode(form.pincode)>
            <cfset contactObj.setUserCreated(session.user.userId)>
            <cfset EntitySave(contactObj)>
        </cfif>
        <cflocation  url="../pages/contact.cfm" addtoken="false">
    </cffunction>
    <cffunction  name="getContact" access="remote" returnformat="json" output="false">
        <cfargument name="id" type="numeric" required="true" />
        <cfset contactObj = entityLoad("contact",id)>
        <cfreturn contactObj>
    </cffunction>
    <cffunction  name="deleteContact" access="remote" returnformat="json" output="false">
        <cfargument name="id" type="numeric" required="true" />
        <cfset contactObj = entityLoad("contact",id,true)>
        <cfset EntityDelete(contactObj)>
        <cfreturn true>
    </cffunction>
</cfcomponent>