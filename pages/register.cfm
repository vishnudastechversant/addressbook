<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Register</title>
  </head>
  <link rel="stylesheet" href="../assets/css/bootstrap.css" />
  <link rel="stylesheet" href="../assets/css/login.css" />
  <body>
    <nav class="navbar custom-navbar">
      <a class="navbar-brand" href="#"><span>&#128214;</span> Address Book</a>
    </nav>
    <section class="d-flex justify-content-center mt-5 mb-5">
      <div class="col-6 form-block p-0">
        <div class="row">
        <div class="col-4 form-heading d-flex flex-column text-center"><h3>Register</h3>
        <p class="login-logo">&#128214;</p>
      </div>
        <div class="col-8 form-container">
          <form id="registerForm" method="post" action="../controllers/register.cfc?method=registerUser">
            <div class="form-group">
              <label for="firstName">First Name</label
              ><input
                type="text"
                name="firstName"
                id="firstName"
                class="form-control"
                required="required"
              />
            </div>
            <div class="form-group">
              <label for="lastName">Last Name</label
              ><input
                type="text"
                name="lastName"
                id="lastName"
                class="form-control"
                required="required"
              />
            </div>
            <div class="form-group">
              <label for="username">Username</label
              ><input
                type="text"
                name="username"
                id="username"
                class="form-control"
                required="required"
              />
            </div>
            <div class="form-group">
              <label for="email">Email</label
              ><input
                type="email"
                name="email"
                id="email"
                class="form-control"
                required="required"
              />
            </div>
            <div class="form-group">
              <label for="password">Password</label
              ><input
                type="password"
                name="password"
                id="password"
                class="form-control"
                required="required"
              />
            </div>
            <div class="form-group">
              <label for="confirmPassword">Confirm Password</label
              ><input
                type="password"
                name="confirmPassword"
                id="confirmPassword"
                class="form-control"
                required="required"
              />
            </div>
            <div class="form-group">
              <button
                type="submit" name="submit" id="submit"
                class="btn btn-primary text-white mt-3 col-12"
              >
               Register
              </button>
            </div>
          </form>
          <div class="alert alert-danger alert-dismissible fade" role="alert" id="passwordNotSameError">
          </div>
          <div class="w-100 pt-3">
            <p>Already own your address book?<br> <a href="login.cfm">use your key and open the pages.</a></p>
          </div>
        </div>
        </div>
      </div>
    </section>
    <script src="../assets/js/jquery.js"></script>
    <script src="../assets/js/bootstrap.bundle.js"></script>
    <script>
      $(document).ready(()=>{
        $('#submit').click((e)=>{
            $('#passwordNotSameError').alert();
          const password = $("#password").val();
          const confirmPassword = $("#confirmPassword").val();
          if(confirmPassword!=password){
            e.preventDefault();
            $('#passwordNotSameError').html('<strong>ERROR</strong> You have entered different passwords to confirm.');
            $('#passwordNotSameError').removeClass('fade');
            $('#passwordNotSameError').addClass('show');
          }
        });
      });
    </script>
  </body>
</html>
