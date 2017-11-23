<!DOCTYPE html>
<html>

  <head>
    <title>To Do List</title>
    <meta charset="utf-8">
    <link rel="stylesheet" href="css/style.css">
    <link href="https://fonts.googleapis.com/css?family=Cherry+Swash" rel="stylesheet">
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" >
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
  </head>

  <body>

    <header>
      <div id="info">
        <img src="images/site/logo.svg">
        <h1><a href="index.php">To Do List</a></h1>
      </div>
      <div id="user">
        <form action="action_login.php" method="post">
          <input type="text" placeholder="username" name="username">
          <input type="password" placeholder="password" name="password">
          <div>
            <input type="submit" value="Login">
            <a href="register.php">Register</a>
          </div>
        </form>
      </div>
    </header>

    <nav id="menu">
      <ul>
        <li><a href="../../index.php">Home</a></li>
 <!--       <li><a href="about.php">About Us</a></li>
        <li><a href="contacts.php">Contacts</a></li> -->
      </ul>
    </nav>
