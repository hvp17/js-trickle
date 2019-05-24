<?php
session_start();
require_once __DIR__ . '/../db.php';

try {
    $sQuery = $db->prepare("SELECT * FROM answers WHERE user_fk = :iUserFK");

    $sQuery->bindValue(':iUserFK', $_SESSION['jUser']);
    $sQuery->execute();
    $aAnswers = $sQuery->fetchAll();


    echo json_encode($aAnswers);
} catch (PDOException $e) {
    echo '{"status":0, "message":"error to signUp", "code":"001"' . $e . '}';
}
