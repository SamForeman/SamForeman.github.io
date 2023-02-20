<?php
// Initialize the session
session_start();
// Include config file
require_once "config.php";
// Check if the user is logged in, displays this page 
if(isset($_SESSION["loggedin"]) && $_SESSION["loggedin"] === true){
    ?>
    <!DOCTYPE html>
    <html lang="en">
    <head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Welcome</title>
        <link rel="stylesheet" href="css/style.css">
        <style>
            body{ font: 14px sans-serif; text-align: center; }
        </style>
<div class="topnav">
        <a class="active" href="dashboard.php">Home</a>
        <a href="map.html">Tracking Information</a>
        <a href="customers.php">Customer Information</a>
        <a href="products.php">Product Information</a>
        <a href="reset-password.php" class="btn btn-warning">Reset Your Password</a>
        <a href="logout.php" class="btn btn-danger ml-3">Sign Out of Your Account</a>
    </div>
    </head>
    <body>
        <h1 class="my-5">Hi, <b><?php echo htmlspecialchars($_SESSION["username"]); ?></b>. Welcome to our site.</h1>
    </body>
    </html>
    <?php }else{ //if the user isn't logged in, displays this page
    ?> 
    <!DOCTYPE html>
    <html lang="en">
    <head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Welcome</title>
        <link rel="stylesheet" href="css/style.css">
        <style>
            body{ font: 14px sans-serif; text-align: center; }
        </style>
<div class="topnav">
        <a class="active" href="dashboard.php">Home</a>
        <a href="map.html">Tracking Information</a>
        <a href="customers.php">Customer Information</a>
        <a href="products.php">Product Information</a>
        <a href="login.php">Login</a>
        <a href="register.php">Register</a>
    </div>
    </head>
    <body>
        <h1 class="my-5">Hi, Welcome to our site.</h1>
        <div class="form-group">
            <a href="login.php">Login</a>
            <a href="register.php">Register</a>
            </div>
    </body>
    </html>
    <?php } ?>