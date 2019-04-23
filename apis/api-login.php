<?php

session_start();
//VALIDATE BACKEND
// if(
//     empty($_POST['txtEmail']) ||
//     empty($_POST['txtPassword']) ||
//     !filter_var($_POST['txtEmail'], FILTER_VALIDATE_EMAIL) ||
//     !(strlen($_POST['txtPassword']) >= 6 && strlen($_POST['txtPassword']) <= 20)
//     ){
//     echo '{"status":0, "message":"**********CANNOT LOGIN: Api-login error********"}';
//     exit;
//     }


     //CONNECT TO DB
     require_once __DIR__.'/../db.php';
     $password = $_POST['txtPassword'];


 /************************
  :: SELECT from TBL_USERS
  ************************/
 try{
     $sQuery = $db->prepare('SELECT * FROM users
                             WHERE email = :sEmail
                             LIMIT 1'
                             );

     $sQuery->bindValue(':sEmail', $_POST['txtEmail']);
     $sQuery->execute();
     $aUsers = $sQuery->fetchAll();

     if(count($aUsers)){
         $pass = $aUsers[0]['password'];
         //if input passw = db hashed password
         if(password_verify($password, $pass)){
             $_SESSION['jUser'] = $aUsers[0];
             echo '{"status":1, "message":"login success from api"}';
          exit;
           }

     }
/****************************
  ::SESSION LOGIN ATTEMPTS
*****************************/

    if($_SESSION['loginAttempt'] == 3){
      echo '{"loginLimit": "reached", "attempts":'.$_SESSION['loginAttempt'].'}';
    }
     $_SESSION['loginAttempt'] = $_SESSION['loginAttempt'] + 1;
     echo '{"status":0, "message":"session issue", "attempts":'.$_SESSION['loginAttempt'].'}';



     try{

                 /******************************
                 :: login email first attempt
                 *******************************/
                 $sLoginAttemptQuery = $db->prepare('INSERT INTO login_attempts
                  VALUES (null,  :iTime, :bStatus, :sEmail)');

                 $sLoginAttemptQuery->bindValue(':iTime', time());
                 $sLoginAttemptQuery->bindValue(':bStatus', 0);
                 $sLoginAttemptQuery->bindValue(':sEmail', $_POST['txtEmail']);
                 $sLoginAttemptQuery->execute();
                 echo 'hi';

             }catch(PDOException $exception){
                 echo '{ "status":33, "message":"YOU CANNOT LOGIN FORM ::login email first attempt"}';
                 var_dump($exception);
             }


              try{

                  /*******************************
                      :: Check how many attempts
                  *******************************/
                     $valid_attempts = time() - (5 * 60);
                     $sCheckLoginAttempts = $db->prepare("SELECT time
                                                         FROM login_attempts
                                                         WHERE email = :sEmail AND
                                                         status = 0 AND
                                                         time > :iValidAttempts");

                     $sCheckLoginAttempts->bindValue(':sEmail', $_POST['txtEmail']);
                     $sCheckLoginAttempts->bindValue(':iValidAttempts', $valid_attempts);
                     $sCheckAtt = $sCheckLoginAttempts->execute();
                     echo 'sweet';
                     //if more than 3 block it
                     if($sCheckAtt->rowCount() >= 3) {
                        echo '{ "status":123, "message":"YOU ARE BLOCKED"}';
                         echo 'U ARE BLOCKED';
                         return;
                     }

                     }catch(PDOException $exception){
                     echo '{ "status":123, "message":"YOU CANNOT LOGIN FORM api-login"}';
                     var_dump($exception);
                     }

 }catch(PDOException $exception){
     echo '{ "status":333, "message":"YOU CANNOT LOGIN FORM api-login"}';
     var_dump($exception);


     $_SESSION['loginAttempt'] = $_SESSION['loginAttempt'] + 1;

     echo '{"status":0, "message":"cannot login", "attempts":'.$_SESSION['loginAttempt'].'}';



 }//end catch SELECT from TBL_USERS


