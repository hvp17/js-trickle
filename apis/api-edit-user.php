<?php
session_start();
require_once __DIR__ . '/../db.php';
require_once __DIR__ . '/../class/token.php';

if (Token::check($_POST['token'])) {
  echo '{"token":"login_secure",';
} else {
  echo '{"token":"login_NOT_secure"}';
  exit;
}

if (
  empty($_POST['txtPassword']) ||
  empty($_POST['txtConfirmPassword']) ||
  !(strlen($_POST['txtPassword']) >= 6 && strlen($_POST['txtPassword']) <= 20) ||
  !($_POST['txtPassword'] == $_POST['txtConfirmPassword'])
) {

  try {

    $sQuery = $db->prepare('UPDATE users
    SET username = :sUsername,
    email = :sEmail
    WHERE
    id = :iUserId');
    $sQuery->bindValue(':sUsername', $_POST['txtUsername']);
    $sQuery->bindValue(':sEmail', $_POST['txtEmail']);
    $sQuery->bindValue(':iUserId', $_SESSION['jUser']);
    $sQuery->execute();
    if (!$sQuery->rowCount()) {
      echo '{"status":2, "message":"could not insert data"}';
      exit;
    }
    echo '"status":1, "message":"user updated"}';
    exit;
  } catch (PDOException $ex) {
    echo '{"status":0, "message":"' . $ex . '"}';
  }
} else {

  //HASHING
  $password = $_POST['txtPassword'];
  $options = [
    'cost' => 5,
  ];
  $pepper = "s3cr3T3017@91";
  $hashed_password =  password_hash($password . $pepper, PASSWORD_DEFAULT, $options);

  //if password inserted
  try {

    $sQuery = $db->prepare('UPDATE users
        SET username = :sUsername,
        email = :sEmail,
        password = :sPassword
        WHERE
        id = :iUserId');
    $sQuery->bindValue(':sUsername', $_POST['txtUsername']);
    $sQuery->bindValue(':sEmail', $_POST['txtEmail']);
    $sQuery->bindValue(':sPassword', $hashed_password);

    $sQuery->bindValue(':iUserId', $_SESSION['jUser']);
    $sQuery->execute();

    if (!$sQuery->rowCount()) {
      echo '{"status":2, "message":"No rowCount. could not insert data"}';
      exit;
    }
    echo '{"status":1, "message":"user updated and password changed"}';
    exit;
  } catch (PDOException $ex) {
    echo '{"status":0, "message":"exception LAST"}';
  }
}
