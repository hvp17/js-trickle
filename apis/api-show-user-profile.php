<?php
session_start();
require_once __DIR__ . '/../db.php';

/*********************
:: SHOW USER DETAIL
**********************/
 try {

    $sQuery = $db->prepare("SELECT DISTINCT users.id AS user_id, users.username,users.image_fk,users.email,users.password,
    questions.id AS question_id,questions.user_fk, questions.title, questions.level_fk, questions.description, questions.date,
    levels.id AS level_id, levels.name AS level
    FROM questions
    JOIN users ON users.id = questions.user_fk
    JOIN levels ON levels.id = questions.level_fk
    WHERE users.id = :iUserId");
    $sQuery->bindValue(':iUserId', $_SESSION['jUser']['id']);
    $sQuery->execute();
    $aUser = $sQuery->fetchAll();
    echo json_encode($aUser);


} catch (PDOException $e) {
    echo '{"status":0, "message":"error to signUp", "code":"001"' . $e . '}';
}