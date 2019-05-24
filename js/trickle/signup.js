/* trigger the click */
$("#frmSignup").submit(function (e) {
  e.preventDefault();
  $.ajax({
    url: "apis/api-signup.php",
    method: "POST",
    data: $("#frmSignup").serialize(),
    dataType: "JSON"
  }).always(function (jData) {
    console.log("jData ", jData);
    if (jData.error) {
      $(".passError").text(jData.error);
    }
    if (jData.status === 1) {
      location.href = "login.php";
    } else {
      console.log("Cannot sign you up");
    }
  });
});