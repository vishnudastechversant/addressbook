<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Address Book</title>
  </head>
  <link rel="stylesheet" href="assets\css\bootstrap.css" />
  <body>
    <button type="button">Logout</button>
    <button type="button" data-toggle="modal" data-target="#contactModal">
      Create Contact
    </button>
    <div class="modal" id="contactModal">
      <div class="modal-dialog modal-dialog-scrollable">
        <div class="modal-content">
          <div class="modal-header">
            <h4 class="modal-title">Contact Details</h4>
          </div>
          <div class="modal-body">
            <form action="" method="post">
              <input type="hidden" name="id" value="0" />
              <select name="title" id="title">
                <option value="1">Miss</option>
                <option value="2">Mr</option>
                <option value="3">Mrs</option>
              </select>
              <input type="text" name="firstname" id="firstname" />
              <input type="text" name="lastname" id="lastname" />
              <select name="gender" id="gender">
                <option value="1">Male</option>
                <option value="2">Female</option>
                <option value="3">Others</option>
              </select>
              <input type="date" name="dob" id="dob" />
              <input type="file" name="photo" id="photo" />
              <input type="text" name="address" id="address" />
              <input type="text" name="city" id="city" />
              <input type="text" name="state" id="state" />
              <input type="text" name="country" id="country" />
              <input type="text" name="pincode" id="pincode" />
              <input type="email" name="email" id="email" />
              <input type="tel" name="phone" id="phone" />
            </form>
          </div>

          <div class="modal-footer">
            <button type="button" class="btn btn-danger" data-dismiss="modal">
              Close
            </button>
          </div>
        </div>
      </div>
    </div>
    <table>
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
        <tr>
          <td><img src="" alt="" /></td>
          <td>Name</td>
          <td>email</td>
          <td>phone number</td>
          <td>edit</td>
          <td>delete</td>
          <td>view</td>
        </tr>
      </tbody>
    </table>
    <form action="" enctype="multipart/form-data" method="post">
      <input type="file" name="profile" />
      <input type="submit" value="submit" />
    </form>
    <script src="assets\js\jquery.js"></script>
    <script src="assets\js\bootstrap.bundle.js"></script>
  </body>
</html>
