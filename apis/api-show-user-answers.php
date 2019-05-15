<?php
session_start();
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
    $sQuery = $db->prepare("SELECT * FROM answers WHERE user_fk = :iUserFK");

    $sQuery->bindValue(':iUserFK', $_SESSION['jUser']['id']);
    $sQuery->execute();
    $aAnswers = $sQuery->fetchAll();


    echo json_encode($aAnswers);
} catch (PDOException $e) {
    echo '{"status":0, "message":"error to signUp", "code":"001"' . $e . '}';
}
