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

session_start();
require_once __DIR__ . '/../db.php';

$db->beginTransaction();
try {
  $sQuery = $db->prepare('INSERT INTO questions
                            VALUES (null, :iUserFK, :sTitle, :iLevelFK, :sDescription, null)');

  $sQuery->bindValue(':iUserFK', $_SESSION['jUser']['id']);
  $sQuery->bindValue(':sTitle', $_POST['txtTitle']);
  $sQuery->bindValue(':iLevelFK', $_POST['txtLevel']);
  $sQuery->bindValue(':sDescription', $_POST['txtDescription']);
  $sQuery->execute();

  if( $sQuery->rowCount() ){
    $iPostId = $db->lastInsertId();
    echo '{"status":1, "message":"Indlæg blev tilføjet"}';

  }
} catch (PDOException $e) {
  echo '{"status":0, "message":"error", "code":"001", "error":'.$exception.'}';
  $db->rollBack();
  exit;
}



//******************************* SELECT TAG ID BASED ON TAG NAME AND LOOP THE LAST 2 STATEMENTS*/

$aTags = explode (",", $_POST['txtTags']);
foreach( $aTags as $aTag ){

try{
  $sQuery = $db->prepare(' SELECT id FROM tags where name=:sTag ');
  $sQuery->bindValue(':sTag', $aTag);
  $sQuery->execute();
  $aTagId = $sQuery->fetchAll();
  $iTagId = $aTagId[0]["id"];

}catch(PDOException $exception){
  echo '{"status":0, "message":"Tag origin could not be queried"}';
}


try{
  $sQuery = $db->prepare('INSERT INTO questions_tags VALUES(null, :iPostId, :iTagId)');
  $sQuery->bindValue( ':iPostId', $iPostId );
  $sQuery->bindValue( ':iTagId', $iTagId );
  $sQuery->execute();
  if( !$sQuery->rowCount() ){
    $db->rollBack();
    exit;
  }    
  
}catch(PDOException $ex){
  echo $ex;
  $db->rollBack();
  exit;
}



}
// LOOP ENDED

$db->commit();