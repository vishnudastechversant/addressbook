<cfcomponent>
    <cffunction  name="contact" access="remote">
        <cfif structKeyExists(form, 'id')> 
            <cfset photoName = "">
            <cfif structKeyExists(form, 'photo') and form.photo != ""  and form.photoChange == 0> 
                <cffile 
                    action="upload"
                    fileField="photo"
                    allowedExtensions="jpg,png,gif"
                    destination="E:\Work\Coldfusion\cfusion\wwwroot\addressbook\contactImages"
                    nameConflict='MakeUnique'
                    result='fileUploadResult'>
                    <cfset photoName = fileUploadResult.serverFile>
            </cfif>
            <cfif form.id EQ 0>
                <cfquery datasource = "addressBook" name='addContact' result="updatedData">
                    INSERT INTO contact (title, first_name, last_name, address, phone, email, photo, gender, dob, city, state, country, pincode, user_created) 
                    VALUES (<cfqueryparam value="#form.title#">,
                    <cfqueryparam value="#form.firstName#">,
                    <cfqueryparam value="#form.lastName#">,
                    <cfqueryparam value="#form.address#">,
                    <cfqueryparam value="#form.phone#">,
                    <cfqueryparam value="#form.email#">,
                    <cfqueryparam value="#photoName#">,
                    <cfqueryparam value="#form.gender#">,
                    <cfqueryparam value="#form.dob#">,
                    <cfqueryparam value="#form.city#">,
                    <cfqueryparam value="#form.state#">,
                    <cfqueryparam value="#form.country#">,
                    <cfqueryparam value="#form.pincode#">,
                    <cfqueryparam value="#session.user.userId#">)
                </cfquery>
            <cfelse>
                <cfquery datasource = "addressBook" name='addContact' result="insertedData">
                    UPDATE  contact 
                    SET title = <cfqueryparam value="#form.title#">, 
                    first_name = <cfqueryparam value="#form.firstName#">,
                    last_name = <cfqueryparam value="#form.lastName#">,
                    address = <cfqueryparam value="#form.address#">,
                    phone = <cfqueryparam value="#form.phone#">,
                    email = <cfqueryparam value="#form.email#">,
                    photo = <cfqueryparam value="#photoName#">,
                    gender = <cfqueryparam value="#form.gender#">,
                    dob = <cfqueryparam value="#form.dob#">,
                    city = <cfqueryparam value="#form.city#">,
                    state = <cfqueryparam value="#form.state#">,
                    country = <cfqueryparam value="#form.country#">,
                    pincode = <cfqueryparam value="#form.pincode#">,
                    user_created = <cfqueryparam value="#session.user.userId#">
                    WHERE id = <cfqueryparam value="#form.id#">
                </cfquery>
            </cfif>
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
        <cfset contactprint = EntityLoad("contact",{userCreated:session.user.userId}) />
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
        <cfset contactprint = EntityLoad("contact",{userCreated:session.user.userId}) />
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
        <cfset contactprint = EntityLoad("contact",{userCreated:session.user.userId}) />
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
        <cflocation  url="../pages/contact.cfm" addtoken="false"> 
    </cffunction>
</cfcomponent>
