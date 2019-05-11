<?php

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
  'cost' => 5,
];
$hashed_password =  password_hash($password, PASSWORD_DEFAULT, $options);
require_once __DIR__ . '../db.php';
try {
  $iBlockedDate = time();
  $sQuery = $db->prepare('INSERT INTO users
                            VALUES (null, :sImg,:sUsername, :sEmail, :sPassword, :bBlocked, :iBlockedDate)');

  $sQuery->bindValue(':sImg', 'http://img.com');
  $sQuery->bindValue(':sUsername', $_POST['txtUsername']);
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
