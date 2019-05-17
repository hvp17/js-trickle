<?php
if (
  empty($_POST['txtUsername']) ||
  empty($_POST['txtEmail']) ||
  empty($_POST['txtPassword']) ||
  empty($_POST['txtConfirmPassword']) ||
  !(strlen($_POST['txtUsername']) >= 2 && strlen($_POST['txtUsername']) <= 20) ||
  !filter_var($_POST['txtEmail'], FILTER_VALIDATE_EMAIL) ||
  !(strlen($_POST['txtPassword']) >= 6 && strlen($_POST['txtPassword']) <= 20) ||
  !($_POST['txtPassword'] == $_POST['txtConfirmPassword'])
) {
  echo '{"status":0, "message":"******************"}';
  exit;
}

$password = $_POST['txtPassword'];

$uppercase = preg_match('@[A-Z]@', $password);
$lowercase = preg_match('@[a-z]@', $password);
$number    = preg_match('@[0-9]@', $password);
$specialChars = preg_match('@[^\w]@', $password);

if(!$uppercase || !$lowercase || !$number || !$specialChars || strlen($password) < 8) {
    echo '{"error":  "Password should be at least 8 characters in length and should include at least one upper case letter, one number, and one special character"}';
    exit;
}

if (isset($_POST['g-recaptcha-response']) && !empty($_POST['g-recaptcha-response'])) {
  $secret = '6LdDM6IUAAAAAM8VwxrJzjBh6R-GiMB9lcOWGoNE';
  $verifyResponse = file_get_contents('https://www.google.com/recaptcha/api/siteverify?secret=' . $secret . '&response=' . $_POST['g-recaptcha-response']);
  $responseData = json_decode($verifyResponse);
  if ($responseData->success) {
    $succMsg = 'Your contact request have submitted successfully.';
  } else {
    $errMsg = 'Robot verification failed, please try again.';
  }
}



///////    SYNTAX ERROR CHECK    ////////////
ini_set('display_errors', 1);
///////    END SYNTAX ERROR CHECK    ////////////

//HASHING
$password = $_POST['txtPassword'];
$options = [
  'cost' => 10,
];
$hashed_password =  password_hash($password, PASSWORD_DEFAULT, $options);

require_once __DIR__ . '/../db.php';
try {
  $iBlockedDate = time();
  $sQuery = $db->prepare('INSERT INTO users
                            VALUES (null, :sUsername, :iImgFK, :sEmail, :sPassword, :bBlocked, :iBlockedDate)');


  $sQuery->bindValue(':sUsername', $_POST['txtUsername']);
  $sQuery->bindValue(':iImgFK', 1);
  $sQuery->bindValue(':sEmail', $_POST['txtEmail']);
  $sQuery->bindValue(':sPassword', $hashed_password);
  $sQuery->bindValue(':bBlocked', 0);
  $sQuery->bindValue(':iBlockedDate', $iBlockedDate);
  $sQuery->execute();

  if ($sQuery->rowCount()) {
    echo '{"status":1, "message":"success"}';
    exit;
  }
} catch (PDOException $e) {
  echo '{"status":0, "message":"error", "code":"001", "line":' . __LINE__ . '}';
}
