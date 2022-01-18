<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Login</title>
  </head>
  <link rel="stylesheet" href="assets\css\bootstrap.css" />
  <body>
    <form method="post" action="..\controllers\register.cfc">
        <input type="text" name="firstName">
        <input type="text" name="lastName">
        <input type="email" name="email">
        <input type="text" name="userName">
        <input type="password" name="password">
        <input type="password" name="confirmpassword">
        <input type="submit" name="submit">
    </form>
    <script src="assets\js\jquery.js"></script>
    <script src="assets\js\bootstrap.bundle.js"></script>
  </body>
</html>
