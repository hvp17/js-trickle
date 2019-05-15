<?php
require_once __DIR__ . '/../db.php';
/************************************
    ::ESCAPE STRING AGAINS XSS
 *************************************/
function _e($string)
{
  echo htmlspecialchars($string, ENT_QUOTES, 'UTF-8');
}
/************************************
    ::END ESCAPE STRING AGAINS XSS
 *************************************/

try {
  $sQuery = $db->prepare("SELECT * FROM answers WHERE question_fk = :iId");

  $sQuery->bindValue(':iId', htmlspecialchars($_GET['id']));
  $sQuery->execute();
  $aQuestions = $sQuery->fetchAll();


  echo json_encode($aQuestions);
} catch (PDOException $e) {
  echo '{"status":0, "message":"error to signUp", "code":"001"' . $e . '}';
}