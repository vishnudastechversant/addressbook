<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Login</title>
  </head>
  <link rel="stylesheet" href="../assets/css/bootstrap.css" />
  <link rel="stylesheet" href="../assets/css/login.css" />
  <script src="https://kit.fontawesome.com/27b3f7eace.js" crossorigin="anonymous"></script>
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
              <label for="username">Username</label>
              <input type="text" name="username" id="username" class="form-control" required="required"/>
            </div>
            <div class="form-group">
              <label for="password">Password</label
              ><input
                type="password" name="password" id="password" class="form-control" required="required"/>
              <button type="submit" name="submit" id="submit" class="btn btn-primary text-white mt-3 col-12">
               LogIn
              </button>
            </div>
          </form>
          <div class="w-100 pt-3">
            <p>Never got to carry your own address book?<br> <a href="register.cfm">Join us and get one.</a></p>
          </div>
          <hr>
          <div class="w-100 pt-3">
            <p>Ohh by the way you can open it using these down below too.</p>
          </div>
          <div class="pt-3 d-flex justify-content-around">
            <a href="../controllers/login.cfc?method=google" class=" text-danger convert-icons m-2 p-2"><i class="fab fa-google"></i></a>
            <a href="javascript:FbLogin()" class=" text-primary convert-icons m-2 p-2"><i class="fab fa-facebook"></i></a>
          </div>
        </div>
        </div>
      </div>
    </section>
    <script src="../assets/js/jquery.js"></script>
    <script src="../assets/js/bootstrap.bundle.js"></script>
    <script>
      window.fbAsyncInit = function() {
            FB.init({
            appId      : '3146257805610251',
            xfbml      : true,
            version    : 'v12.0'
            });
            FB.AppEvents.logPageView();
        };

        (function(d, s, id){
            var js, fjs = d.getElementsByTagName(s)[0];
            if (d.getElementById(id)) {return;}
            js = d.createElement(s); js.id = id;
            js.src = "https://connect.facebook.net/en_US/sdk.js";
            fjs.parentNode.insertBefore(js, fjs);
        }(document, 'script', 'facebook-jssdk'));
      
        function FbLogin() {
            FB.login(function (response) {
                if (response.authResponse) {
                    getFbUserData();
                } else {
                    document.getElementById('status').innerHTML = 'User cancelled login or did not fully authorize.';
                }
            }, {scope: 'email'});
        }
      
        function getFbUserData(){
            FB.api('/me', {locale: 'en_US', fields: 'id,first_name,last_name,email,link,gender,locale,picture'},
            function (response) {                
                saveUserData(response);                
            });
        }

        function saveUserData(userData){
          $.ajax({
              url: "../controllers/login.cfc",
              type: "post", 
              dataType: "json",
              data: {
                  method: "facebook",
                  email: userData.email,
                  first_name: userData.first_name,
                  last_name: userData.last_name
              },
              success: function (data){
                  location.reload();
              }
          });
        }        
    </script>
  </body>
</html>
