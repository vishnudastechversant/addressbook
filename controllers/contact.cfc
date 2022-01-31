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
        <cfset contact = entityLoadByPK("contact", id)>
        <cfset contact["titleData"] = contact.getTitleData()>
        <cfset contact["genderData"] = contact.getGenderData()>
        <cfset contact["cityData"] = contact.getCityData()>
        <cfset contact["stateData"] = contact.getStateData()>
        <cfset contact["countryData"] = contact.getCountryData()>
        <cfreturn contact>
    </cffunction>
    <cffunction  name="deleteContact" access="remote" returnformat="json" output="false">
        <cfargument name="id" type="numeric" required="true" />
        <cfset contactObj = entityLoad("contact",id,true)>
        <cfset EntityDelete(contactObj)>
        <cfreturn true>
    </cffunction>

     <cffunction  name="pdfdownload" access="remote">
        <cfset contactprint = EntityLoad("contact",{userCreated:EntityLoad("user",session.user.userId,true)}) />
        <cfdocument format="PDF"  filename="../files/file.pdf" overwrite="Yes">
        <table class="table">
            <thead>
                <tr>
                    <th scope="col">Name</th>
                    <th scope="col">Email</th>
                    <th scope="col">Phone Number</th>
                </tr>
            </thead>
            <tbody>
                <cfoutput>
                    <cfloop array="#contactprint#" index="i">
                        <tr>
                            <td>#i.firstName#  #i.lastName# </td>
                            <td>#i.email#</td>
                            <td>#i.phone#</td>
                        </tr>
                    </cfloop>
                </cfoutput>
            </tbody>
        </table>
        </cfdocument> 
        <cfprint type="pdf" source="../files/file.pdf" printer="HP58CA6B (HP DeskJet 2700 series)">
        <cfheader name="content-diposition" value="inline; filename=contact.pdf">
        <cfcontent type="application/pdf" file="E:\Work\Coldfusion\cfusion\wwwroot\addressbook\files\file.pdf" deletefile="no"/>
    </cffunction>
    
    <cffunction  name="exceldownload" access="remote">
        <cfset contactprint = EntityLoad("contact",{userCreated:EntityLoad("user",session.user.userId,true)}) />
        <cfset spreadsheet = spreadsheetNew("Contacts") />
        <cfset SpreadsheetSetActiveSheet(spreadsheet, "Contacts")/>
        <cfset SpreadsheetSetCellValue(spreadsheet, "Name",  1, 1) />
        <cfset SpreadsheetSetCellValue(spreadsheet, "Email", 1, 2)/>
        <cfset SpreadsheetSetCellValue(spreadsheet, "Phone", 1, 3) />
        <cfoutput>
            <cfloop array="#contactprint#" index="i">
                <cfset SpreadSheetAddRow(spreadsheet,'#i.firstName# #i.lastName#,#i.email#,#i.phone#')/>
            </cfloop>
        </cfoutput>
        <cfheader name="Content-Disposition" value="inline; filename=Contacts.xls">
        <cfcontent type="application/vnd.msexcel" variable="#SpreadSheetReadBinary(spreadsheet)#">
        <cflocation  url="../pages/contact.cfm" addtoken="false"> 
    </cffunction>

    <cffunction  name="printpdfdoc" access="remote">
        <cfset contactprint = EntityLoad("contact",{userCreated:EntityLoad("user",session.user.userId,true)}) />
        <cfdocument format="PDF"  filename="../files/file.pdf" overwrite="Yes">
        <table class="table">
            <thead>
                <tr>
                    <th scope="col">Name</th>
                    <th scope="col">Email</th>
                    <th scope="col">Phone Number</th>
                </tr>
            </thead>
            <tbody>
                <cfoutput>
                    <cfloop array="#contactprint#" index="i">
                        <tr>
                            <td>#i.firstName#  #i.lastName# </td>
                            <td>#i.email#</td>
                            <td>#i.phone#</td>
                        </tr>
                    </cfloop>
                </cfoutput>
            </tbody>
        </table>
        </cfdocument> 
        <cfprint type="pdf" source="../files/file.pdf" printer=" Microsoft Print to PDF">
        <cfheader name="content-diposition" value="inline; filename=contact.pdf">
        <cfcontent type="application/pdf" file="E:\Work\Coldfusion\cfusion\wwwroot\addressbook\files\file.pdf"/>
        <!--- <cfheader name="content-diposition" value="inline; filename=contact.pdf">
        <cfcontent type="application/pdf" file="E:\Work\Coldfusion\cfusion\wwwroot\addressbook\files\file.pdf" deletefile="no"/> --->

        <cflocation  url="../pages/contact.cfm" addtoken="false"> 
    </cffunction>
</cfcomponent>
