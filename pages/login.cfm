<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Login</title>
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
        <div class="col-4 form-heading d-flex flex-column text-center"><h3>LogIn</h3>
        <p class="login-logo">&#128214;</p>
      </div>
        <div class="col-8 form-container">
          <form method="post" action="../controllers/login.cfc?method=loginUser">
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
              <label for="password">Password</label
              ><input
                type="password"
                name="password"
                id="password"
                class="form-control"
                required="required"
              />
              <button
                type="submit" name="submit" id="submit"
                class="btn btn-primary text-white mt-3 col-12"
              >
               LogIn
              </button>
            </div>
          </form>
          <div class="w-100 pt-3">
            <p>Never got to carry your own address book?<br> <a href="register.cfm">Join us and get one.</a></p>
          </div>
        </div>
        </div>
      </div>
    </section>
    <script src="../assets/js/jquery.js"></script>
    <script src="../assets/js/bootstrap.bundle.js"></script>
  </body>
</html>
