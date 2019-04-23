<?php

///////    SYNTAX ERROR CHECK    ////////////
error_reporting(E_ALL);
ini_set('display_errors', 1);
///////    END SYNTAX ERROR CHECK    ////////////


  //HASHING
  $password = $_POST['txtPassword'];
  $options = [
      'cost'=> 5,
  ];
$hashed_password =  password_hash($password, PASSWORD_DEFAULT, $options);
  require_once '../db.php';
  try{
    $iBlockedDate = time();
    $sQuery = $db->prepare('INSERT INTO users
                            VALUES (null, :sUsername :sEmail, :sPassword, :bBlocked, :iBlockedDate)');

    $sQuery->bindValue(':sUsername', $_POST['txtUsername']);
    $sQuery->bindValue(':sEmail', $_POST['txtEmail']);
    $sQuery->bindValue(':sPassword', $hashed_password);
    $sQuery->bindValue(':bBlocked', 0);
    $sQuery->bindValue(':iBlockedDate', $iBlockedDate);
    $sQuery->execute();
    
    if( $sQuery->rowCount() ){
      echo '{"status":1, "message":"success"}';
      exit;
    }
  }catch( PDOException $e ){
    var_dump($e);
    echo '{"status":0, "message":"error", "code":"001", "line":'.__LINE__.'}';
  }


