<?php
require_once "components/top.php";
require_once __DIR__ . '/class/token.php';
?>

<div class="unit-5 overlay" style="background-image: url('images/hero_1.jpg');">
  <div class="container text-center">
    <h2 class="mb-0">Sign up</h2>
    <p class="mb-0 unit-6"><a href="index.html">Home</a> <span class="sep">></span> <span>Sign up</span></p>
  </div>
</div>




<div class="site-section bg-light">
  <div class="container">
    <div class="row">

      <div class="col-md-12 col-lg-8 mb-5 mx-auto">

        <form action="#" class="p-5 bg-white" id="frmSignup">
          <div class="row form-group">
            <div class="col-md-12 mb-3 mb-md-0">
              <label class="font-weight-bold" for="Username">Username</label>
              <input maxlength="25" type="text" id="Username" name="txtUsername" class="form-control" value="">
            </div>
          </div>
          <div class="row form-group mb-5">
            <div class="col-md-12 mb-3 mb-md-0">
              <label class="font-weight-bold" for="email">Email</label>
              <input maxlength="20" type="text" id="email" name="txtEmail" class="form-control" value="">
            </div>
          </div>
          <div class="row form-group mb-5">
            <div class="col-md-12 mb-3 mb-md-0">
              <label class="font-weight-bold" for="password">Password</label>
              <input maxlength="20" minlength="8" type="password" id="password" name="txtPassword" class="form-control" value="">
            </div>
          </div>
          <div class="row form-group mb-5">
            <div class="col-md-12 mb-3 mb-md-0">
              <label class="font-weight-bold" for="confirm-password">Confirm Password</label>
              <input maxlength="20" minlength="8" type="password" id="confirm-password" name="txtConfirmPassword" class="form-control" value="">

            </div>
          </div>
          <div class="g-recaptcha" data-sitekey="6LdDM6IUAAAAAD18nn5YfuEFt2nHUyFEbWLP5Xt-"></div>

          <div class="row form-group">
            <div class="col-md-12">
              <span style="color:red;" class="passError"></span>
              <br />
              <input type="submit" value="Sign up" class="btn btn-primary  py-2 px-5">
            </div>
          </div>

          <input type="hidden" name="token" value="<?= Token::generate() ?>">
        </form>
      </div>
    </div>
  </div>
</div>










<?php
$sScript = 'signup.js';
require_once "components/bottom.php";
?>