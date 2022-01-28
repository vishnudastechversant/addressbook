<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Address Book</title>
  </head>
  <link rel="stylesheet" href="../assets/css/bootstrap.css" />
  <link rel="stylesheet" href="../assets/css/login.css" />
  <script src="https://kit.fontawesome.com/27b3f7eace.js" crossorigin="anonymous"></script>
  <body>
    <nav class="navbar custom-navbar d-flex justify-content-between">
      <a class="navbar-brand" href="#"><span>&#128214;</span> Address Book</a>
      <a class="btn btn-sm btn-light text-primary" href="../controllers/login.cfc?method=logout"><i class="fas fa-sign-out-alt"></i></a>
    </nav>
    <section class="container-fluid h-100">
      <div class="row h-100">
        <div class="col-4 h-100 d-flex justify-content-center align-items-center">
          <div class="w-100 bg-light p-3 m-3 d-flex flex-column justify-content-center text-center">
<!---             <form action="" enctype="multipart/form-data" method="post">
              <input type="file" name="profile" />
              <input type="submit" value="submit" />
            </form> --->
            <h3><cfoutput>#session.user.name#</cfoutput></h3>
            <button type="button" data-toggle="modal" class="btn btn-primary" data-target="#contactModal">
              Create Contact
            </button>
          </div>
        </div>
        <div class="col-8 h-100">
          <div class="p-3 m-3 d-flex flex-column justify-content-center">
            <div class="bg-light d-flex justify-content-end">
                <a href="../controllers/contact.cfc?method=printpdfdoc" target="_blank" class=" text-danger convert-icons m-2 p-2"><i class="far fa-file-pdf"></i></a>
                <a href="../controllers/contact.cfc?method=exceldownload" class=" text-success convert-icons m-2 p-2"><i class="far fa-file-excel"></i></a>
                <a href="../controllers/contact.cfc?method=pdfdownload" target="_blank" class=" text-dark convert-icons m-2 p-2"><i class="fas fa-print"></i></a>
            </div>
            <div class="bg-light mt-3 p-3">
              <table class="table table-borderless">
                <thead>
                  <tr>
                    <th></th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Phone Number</th>
                    <th colspan="3"></th>
                  </tr>
                </thead>
                <tbody>
              <cfset contacts = entityLoad( "contact",{userCreated:entityLoad( "user",session.user.userId,true)})>
              <cfloop array="#contacts#" index="contact">
                <cfoutput>
                    <td><cfimage action="writeToBrowser" source="#imageNew("E:\Work\Coldfusion\cfusion\wwwroot\addressbook\contactImages\#contact.getPhoto()#")#" name="image" width="50" height="50"></td>
                    <td>#contact.getName()#</td>
                    <td>#contact.getEmail()#</td>
                    <td>#contact.getPhone()#</td>
                    <td><button type="button" class="btn btn-outline-primary" onClick="editData(#contact.getId()#)">Edit</button></td>
                    <td><button type="button" class="btn btn-outline-primary" onClick="deleteData(#contact.getId()#)">Delete</button></td>
                    <td><button type="button" class="btn btn-outline-primary" onClick="viewData(#contact.getId()#)">View</button></td>
                  </tr>
                </cfoutput>
              </cfloop>
                  <tr>
                </tbody>
              </table>
            </div>
          </div>
        </div>
      </div>
    </section>




    <div class="modal" id="contactModal">
      <div class="modal-dialog modal-dialog-scrollable">
        <div class="modal-content">
          <div class="modal-header">
            <h4 class="modal-title">Contact Details</h4>
          </div>
          <div class="modal-body">
            <form action="../controllers/contact.cfc?method=contact" enctype="multipart/form-data" id="saveDataForm" method="post">
              <input type="hidden" name="id"  id="id" value="0" />
              
              <div class="form-row">
                <div class="form-group col-md-3">
                  <label for="title">Title</label>
                  <select name="title" id="title" class="form-control">
                    <cfset titles = entityLoad( "title")>
                    <cfloop array="#titles#" index="title">
                      <cfoutput>
                        <option value="#title.id#">#title.name#</option>
                      </cfoutput>
                    </cfloop>
                  </select>
                </div>
                <div class="form-group col">
                  <label for="firstname">First Name</label>
                  <input type="text" name="firstname" id="firstName"  class="form-control" />
                </div>
                <div class="form-group col">
                  <label for="lastname">Last Name</label>
                  <input type="text" name="lastname" id="lastName"  class="form-control" />
                </div>
              </div>
              <div class="form-row">
                <div class="form-group col-md-6">
                  <label for="gender">Gender</label>
                  <select name="gender" id="gender" class="form-control">
                    <cfset genders = entityLoad( "gender")>
                    <cfloop array="#genders#" index="gender">
                      <cfoutput>
                        <option value="#gender.id#">#gender.name#</option>
                      </cfoutput>
                    </cfloop>
                  </select>
                </div>
                <div class="form-group col-md-6">
                  <label for="phone">Phone No:</label>
                  <input type="tel" name="phone" id="phone"  class="form-control" />
                </div>
              </div>
              <div class="form-row">
                <div class="form-group col-md-6">
                  <label for="email">Email</label>
                  <input type="email" name="email" id="email"  class="form-control"  />
                </div>
                <div class="form-group col-md-6">
                  <label for="dob">DOB</label>
                  <input type="date" name="dob" id="dob"  class="form-control" />
                </div>
              </div>
              <div class="form-group" id="addPhotoImage">
                <label for="photo">Photo</label>
                <input type="file" name="photo" id="photo" class="form-control" />
                <input type="hidden" name="photoChange" id="photoChange" value="0" />
              </div>
              <div class="form-group">
                <label for="address">Address</label>
                <textarea name="address" id="address" class="form-control"></textarea>
              </div>
              <div class="form-row">
                <div class="form-group col-md-6">
                  <label for="country">Country</label>
                  <select name="country" id="country" class="form-control">
                    <cfset countries = entityLoad( "countries")>
                    <cfloop array="#countries#" index="country">
                      <cfoutput>
                        <option value="#country.id#">#country.name#</option>
                      </cfoutput>
                    </cfloop>
                  </select>
                </div>
                <div class="form-group col-md-6">
                  <label for="state">State</label>
                  <select name="state" id="state" class="form-control">
                    <cfset states = entityLoad( "states")>
                    <cfloop array="#states#" index="state">
                      <cfoutput>
                        <option value="#state.id#">#state.name#</option>
                      </cfoutput>
                    </cfloop>
                  </select>
                </div>
              </div>
              <div class="form-row">
                <div class="form-group col-md-6">
                  <label for="city">City</label>
                  <select name="city" id="city" class="form-control">
                    <cfset cities = entityLoad( "cities")>
                    <cfloop array="#cities#" index="city">
                      <cfoutput>
                        <option value="#city.id#">#city.name#</option>
                      </cfoutput>
                    </cfloop>
                  </select>
                </div>
                <div class="form-group col-md-6">
                  <label for="phone">Pincode</label>
                  <input type="text" name="pincode" id="pincode"  class="form-control"/>
                </div>
              </div>
            </form>
          </div>

          <div class="modal-footer">
            <button type="button" class="btn btn-primary" onclick="saveEntity()">
              Save
            </button>
            <button type="button" class="btn btn-danger" data-dismiss="modal">
              Close
            </button>
          </div>
        </div>
      </div>
    </div>

    <div class="modal" id="contactDetailModal">
      <div class="modal-dialog modal-dialog-scrollable">
        <div class="modal-content">
          <div class="modal-header">
            <h4 class="modal-title">Contact Details</h4>
          </div>
          <div class="modal-body p-3">
            <table class="table table-borderless">
              <tbody>
                <tr>
                  <td>Name</td>
                  <td id="detailedName"><span id="detailedtitle"></span> <span id="detailedfirstname"></span>  <span id="detailedlastname"></span></td>
                </tr>
                <tr>
                  <td>Gender</td>
                  <td id="detailedGender"></td>
                </tr>
                <tr>
                  <td>Date Of Birth</td>
                  <td id="detailedDob"></td>
                </tr>
                <tr>
                  <td>Address</td>
                  <td><span  id="detailedAddress"></span>,<span  id="detailedcity"></span>,<span  id="detailedstate"></span>,<span  id="detailedcountry"></span></td>
                </tr>
                <tr>
                  <td>Pincode</td>
                  <td id="detailedPincode"></td>
                </tr>
                <tr>
                  <td>Email</td>
                  <td id="detailedEmail"></td>
                </tr>
                <tr>
                  <td>Phone</td>
                  <td id="detailedPhone"></td>
                </tr>
              </tbody>
            </table>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-danger" data-dismiss="modal">
              Close
            </button>
          </div>
        </div>
      </div>
    </div>
    
    <script src="../assets/js/jquery.js"></script>
    <script src="../assets/js/bootstrap.bundle.js"></script>
    <script>
      $(document).ready(()=>{
        $('#photo').change(()=>{
          $('#photoChange').val(0)
        });
      });
      const saveEntity = () => {
        $('#saveDataForm').submit();
      }
      const editData = (id) => {
          $.ajax({
              url: "../controllers/contact.cfc",
              type: "post", 
              dataType: "json",
              data: {
                  method: "getContact",
                  id
              },
              success: function (data){
                  if(data && data.length){
                    const dob = new Date(data[0].dob);
                    const dobday = (dob.getDate() < 10? '0':'')+dob.getDate();
                    const dobmonth = (dob.getMonth() < 9? '0':'')+(dob.getMonth()+1);
                    const dobyear =dob.getFullYear();
                    const dobValue =dobyear+'-'+dobmonth+'-'+dobday;
                      $('#address').val(data[0].address);
                      $('#city').val(data[0].city);
                      $('#country').val(data[0].country);
                      $('#dob').val(dobValue);
                      $('#email').val(data[0].email);
                      $('#firstName').val(data[0].first_name);
                      $('#gender').val(data[0].gender);
                      $('#lastName').val(data[0].last_name);
                      $('#phone').val(data[0].phone);
                      $('#pincode').val(data[0].pincode);
                      $('#state').val(data[0].state);
                      $('#title').val(data[0].title);
                      $('#photoChange').val(1);
                      $('#id').val(data[0].id);
                      $('#contactModal').modal('show');
                  }
              }
          });
      }
      const deleteData = (id) => {
          $.ajax({
              url: "../controllers/contact.cfc",
              type: "post", 
              dataType: "json",
              data: {
                  method: "deleteContact",
                  id
              },
              success: function (data){
                  location.reload();
              }
          });
      }
      const viewData = (id) => {
          $.ajax({
              url: "../controllers/contact.cfc",
              type: "post", 
              dataType: "json",
              data: {
                  method: "getContact",
                  id
              },
              success: function (data){
                  if(data && data.length){
                      $('#detailedfirstname').html(data[0].first_name);
                      $('#detailedlastname').html(data[0].last_name);
                      $('#detailedPhone').html(data[0].phone);
                      $('#detailedEmail').html(data[0].email);
                      $('#detailedPincode').html(data[0].pincode);
                      $('#detailedtitle').html(data[0].titlename);
                      $('#detailedAddress').html(data[0].address);
                      $('#detailedcity').html(data[0].cityname);
                      $('#detailedstate').html(data[0].statename);
                      $('#detailedcountry').html(data[0].countryname);
                      $('#detailedGender').html(data[0].gendername);
                      $('#detailedDob').html(data[0].dob);
                      $('#contactDetailModal').modal('show');
                  }
              }
          });
      }
    </script>
  </body>
</html>
