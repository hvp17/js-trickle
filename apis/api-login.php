<?php

session_start();
//CONNECT TO GENERATE AND CHECK THE RANDOM TOKEN
//AGAINS CSRF ATTACK
require_once __DIR__ . '/../class/token.php';
//CONNECT TO DB
require_once __DIR__ . '/../db.php';

//VALIDATE BACKEND
if (
  empty($_POST['txtEmail']) ||
  empty($_POST['txtPassword']) ||
  !filter_var($_POST['txtEmail'], FILTER_VALIDATE_EMAIL) ||
  !(strlen($_POST['txtPassword']) >= 6 && strlen($_POST['txtPassword']) <= 20)
) {
  echo '{"status":5, "message":"empty field ***CANNOT LOGIN***"}';
  exit;
} else {
  if (Token::check($_POST['token'])) {
    echo '{"token":"login_secure",';
  } else {
    echo '{"token":"login_NOT_secure"}';
    exit;
  }
}




$password = $_POST['txtPassword'];

$pepper = "s3cr3T3017@91";

try {

  /****************************
  ::SESSION LOGIN ATTEMPTS
   *****************************/

  if ($_SESSION['loginAttempt'] >= 3) {
    echo '"loginLimit": "reached", "attempts":' . $_SESSION['loginAttempt'] . '}';
    exit;
  }
  $_SESSION['loginAttempt'] = $_SESSION['loginAttempt'] + 1;
  echo '"AttemptStatus":0, "message":"session is counting", "attempts":' . $_SESSION['loginAttempt'] . ',';



  try {

    /******************************
                  :: login email first attempt
     *******************************/
    $sLoginAttemptQuery = $db->prepare('INSERT INTO login_attempts
                   VALUES (null,  :iTime, :bStatus, :sEmail)');

    $sLoginAttemptQuery->bindValue(':iTime', time());
    $sLoginAttemptQuery->bindValue(':bStatus', 0);
    $sLoginAttemptQuery->bindValue(':sEmail', $_POST['txtEmail']);
    $sLoginAttemptQuery->execute();
  } catch (PDOException $exception) {
    echo '{ "status":33, "message":"YOU CANNOT LOGIN FORM ::login email first attempt"}';
    var_dump($exception);
  }


  try {

    /*******************************
                       :: Check how many attempts
     *******************************/
    $valid_attempts = time() - (5 * 60);
    $sCheckLoginAttempts = $db->prepare("SELECT count(time) as time
                                                          FROM login_attempts
                                                          WHERE email = :sEmail AND
                                                          status = :iStatus AND
                                                          time > :iValidAttempts");

    $sCheckLoginAttempts->bindValue(':sEmail', $_POST['txtEmail']);
    $sCheckLoginAttempts->bindValue(':iValidAttempts', $valid_attempts);
    $sCheckLoginAttempts->bindValue(':iStatus', 0);
    $sCheckLoginAttempts->execute();
    $sCheckAtt = $sCheckLoginAttempts->fetchAll();
    //if more than 3 block it
    if ($sCheckAtt[0]['time'] >= 3) {
      echo ' "status":123, "message":"YOU ARE BLOCKED"}';
      return;
    }
  } catch (PDOException $exception) {
    echo '{ "status":222, "message":"YOU CANNOT LOGIN FORM api-login"}';
    var_dump($exception);
  }



  /************************
  :: SELECT from TBL_USERS
   ************************/
  $sQuery = $db->prepare(
    'SELECT * FROM users
WHERE email = :sEmail
LIMIT 1'
  );

  $sQuery->bindValue(':sEmail', $_POST['txtEmail']);
  $sQuery->execute();
  $aUsers = $sQuery->fetchAll();

  if (count($aUsers)) {
    $pass = $aUsers[0]['password'];
    //if input passw = db hashed password
    if (password_verify($password . $pepper, $pass)) {
      $_SESSION['jUser'] = $aUsers[0]['id'];
      //CHECK TIME OF LOGIN FOR AUTOMATIC LOGOUT AFTER
      //15 MINUTES IF NOT INTERACTING WITH WEBSITE:
      //THE CHECK HAPPEN IN "new-post.php"
      $_SESSION['last_login_timestamp'] = time();

      $current_time = time();
      echo '"status":1, "message":"login success from api"}';

      /****************************************
      ::UPDATE LOGIN ATTEMPS TABLE STATUS = 1
       *****************************************/
      try {
        $current_time = time();

        $sUpdateAttemptsTbl = $db->prepare("UPDATE login_attempts
            SET status = :iStatus
            WHERE email = :sEmail AND time = :sTime LIMIT 1");

        $sUpdateAttemptsTbl->bindValue(':sEmail', $_POST['txtEmail']);
        $sUpdateAttemptsTbl->bindValue(':iStatus', 1);
        $sUpdateAttemptsTbl->bindValue(':sTime', $current_time);
        $sUpdateAttemptsTbl->execute();
      } catch (PDOException $exception) {
        echo '{ "status":404, "message":"CANNOT UPDATE login_attempts"}';
        var_dump($exception);
      }

      exit;
    }
  }
} catch (PDOException $exception) {
  echo '{ "status":333, "message":"YOU CANNOT LOGIN FORM api-login"}';
  var_dump($exception);


  $_SESSION['loginAttempt'] = $_SESSION['loginAttempt'] + 1;

  echo '{"status":0, "message":"cannot login", "attempts":' . $_SESSION['loginAttempt'] . '}';
}//end catch SELECT from TBL_USERS
