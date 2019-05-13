<?php
session_start();
require_once __DIR__ . '/../db.php';

/*********************
:: SHOW USER DETAIL
**********************/
 try {

    $sQuery = $db->prepare("SELECT
    users.id as user_id,
    users.username,
    users.email,
    GROUP_CONCAT(distinct questions.id) as questions_id,
    GROUP_CONCAT(distinct questions.title) as questions_title,
    GROUP_CONCAT(distinct questions.date) AS question_date



    FROM questions

    INNER JOIN users ON users.id = questions.user_fk
    INNER JOIN questions_tags ON questions.id = questions_tags.questions_fk
    where users.id = :iUserId");
    $sQuery->bindValue(':iUserId', $_SESSION['jUser']['id']);
    $sQuery->execute();
    $aUser = $sQuery->fetchAll();
    echo json_encode($aUser);


} catch (PDOException $e) {
    echo '{"status":0, "message":"error to signUp", "code":"001"' . $e . '}';
}