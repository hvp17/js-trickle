/* trigger the click */
$(document).on('click', '#btnLogin', function (e) {
  e.preventDefault();

  var sEmail = $("#txtEmail").val();
  console.log("sEmail ", sEmail);
  var sPassword = $("#txtPassword").val();

  $("#invalidEmail", "#invalidPassword").hide();

  var bErrorsFound = false;
  // validate Email
  if (!fnIsEmailValid(sEmail)) {
    $("#invalidEmail").show();
    bErrorsFound = true;
  }
  // validate Password
  if (sPassword.length < 6 || sPassword.length > 20) {
    $("#invalidPassword").show();
    bErrorsFound = true;
  }
  // validate boolian for password and email
  if (bErrorsFound) {
    return;
  }

  $.ajax({
    url: "apis/api-login.php",
    method: "POST",
    data: $("#frmLogin").serialize(),
    dataType: "JSON"
  }).always(function (jData) {
    console.log(jData);

    if (jData.status === 1) {
      document.location.href = "new-post.php"
      return;
    }

    if (jData["loginLimit"] === "reached" && jData.status === 123) {
      $(".error").append(`Too many login ATTEMPTS...Please wait for 5 minutes`);

      setTimeout(function () {
        document.location.href = "apis/api-logout.php";
      }, 3000);
      return;
    } else {
      console.log(jData["attempts"]);

      //document.location.href = "home.php"
      return;
    }
  });
});

function fnIsEmailValid(sEmail) {
  var regex = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
  return regex.test(String(sEmail).toLowerCase()); // true or false
}