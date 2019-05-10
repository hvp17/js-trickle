<?php
///////    SYNTAX ERROR CHECK    ////////////
ini_set('display_errors', 1);
///////    END SYNTAX ERROR CHECK    ////////////
if (
  empty($_POST['txtTitle']) ||
  empty($_POST['txtLevel']) ||
  empty($_POST['txtDescription'])
) {
  echo '{"status":5, "message":"empty field ***CANNOT INSERT***"}';
  exit;
}


session_start();
require_once __DIR__ . '/../db.php';
// $db->beginTransaction();
try {
  $sQuery = $db->prepare('INSERT INTO questions
                            VALUES (null, :iUserFK, :sTitle, :iLevelFK, :sDescription, null)');

  $sQuery->bindValue(':iUserFK', $_SESSION['jUser']['id']);
  $sQuery->bindValue(':sTitle', $_POST['txtTitle']);
  $sQuery->bindValue(':iLevelFK', $_POST['txtLevel']);
  $sQuery->bindValue(':sDescription', $_POST['txtDescription']);
  $sQuery->execute();
  //$iQuestion = $db->lastInsertId();
  if ($sQuery->rowCount()) {
    echo '{"status":1, "message":"success form 1"}';
    //$db->rollBack();
    //exit;
  }
} catch (PDOException $e) {
  echo '{"status":0, "message":"error", "code":"001", "line":' . __LINE__ . '}';
  //$db->rollBack();
}

/**************************************************************************************
 *::TEST MUST BE DELETED
 */



//$tags = implode(', ', $_POST['#tagsArray']);
/* $tags =  $_POST['array'];
foreach ($tags as $tag) {
  echo '{"tag":"' . $tag . '"}';
} */
/*
require_once __DIR__ . '/../db.php';
try {

  $sQuery = $db->prepare('INSERT INTO questions_tags
  VALUES (null, :iQuestionFK, :sTagsFK)');

  $sQuery->bindValue(':iQuestionFK', 3); //$iQuestion);
  $sQuery->bindValue(':sTagsFK', $tags);
  $sQuery->execute();
  if ($sQuery->rowCount()) {
    echo '"status":21, "message":"success"}';
    //$db->commit();
    exit;
  }
} catch (PDOException $e) {
  echo '{"status":0, "message":"error", "code":"001", "line":' . __LINE__ . '}';
  // $db->rollBack();
}
 */
