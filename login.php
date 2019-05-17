<?php
require_once "components/top.php";
require_once __DIR__ . '/class/token.php';

?>

<div class="unit-5 overlay" style="background-image: url('images/hero_1.jpg');">
  <div class="container text-center">
    <h2 class="mb-0">Login</h2>
    <p class="mb-0 unit-6"><a href="index.html">Home</a> <span class="sep">></span> <span>Login</span></p>
  </div>
</div>





<div class="site-section bg-light">
  <div class="container">
    <div class="row">

      <div class="col-md-12 col-lg-8 mb-5 mx-auto">

        <form action="#" class="p-5 bg-white" id="frmLogin">
          <div class="row form-group mb-5">
            <div class="col-md-12 mb-3 mb-md-0">
              <label class="font-weight-bold" for="email">Email</label>
              <span id="invalidEmail">Invalid Email</span>
              <input type="text" id="txtEmail" name="txtEmail" class="form-control" value="eon@e.com">
            </div>
          </div>
          <div class="row form-group mb-5">
            <div class="col-md-12 mb-3 mb-md-0">
              <label class="font-weight-bold" for="password">Password</label>
              <span id="invalidPassword">Invalid Password</span>
              <input type="password" id="txtPassword" name="txtPassword" class="form-control" value="123456">
              <input type="hidden" name="token" value="<?= Token::generate() ?>">

            </div>
          </div>



          <div class="row form-group">
            <div class="col-md-12 text-center">
              <button type="button" id="btnLogin" class="btn btn-primary  py-2 px-5">Login </button>
            </div>
            <div class="col-md-12 text-center">
              <p>Don't you have an account?<a href="register.php">Signup</a></p>
            </div>
            <div class="error"></div>
          </div>


        </form>
      </div>
    </div>
  </div>
</div>










<?php
$sScript = 'login.js';
require_once "components/bottom.php";
?>

