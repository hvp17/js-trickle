<?php
///////    SYNTAX ERROR CHECK    ////////////
ini_set('display_errors', 1);
///////    END SYNTAX ERROR CHECK    ////////////


  if(
    empty($_POST['txtTitle']) ||
    empty($_POST['txtType']) ||
    empty($_POST['txtDescription'])
     ){
    echo '{"status":5, "message":"empty field ***CANNOT INSERT***"}';
    exit;
    }


  session_start();
  require_once __DIR__.'/../db.php';
  try{
    $sQuery = $db->prepare('INSERT INTO questions
                            VALUES (null, :iUserFK, :sTitle, :iTypeFK, :sDescription, null)');

    $sQuery->bindValue(':iUserFK', $_SESSION['jUser']['id']);
    $sQuery->bindValue(':sTitle', $_POST['txtTitle']);
    $sQuery->bindValue(':iTypeFK', $_POST['txtType']);
    //$sQuery->bindValue(':iTagFK', $iTag);
    $sQuery->bindValue(':sDescription', $_POST['txtDescription']);
    $sQuery->execute();

    if( $sQuery->rowCount() ){
      echo '{"status":1, "message":"success"}';
      exit;
    }
  }catch( PDOException $e ){
    echo '{"status":0, "message":"error", "code":"001", "line":'.__LINE__.'}';
  }





?>