<?php
require_once __DIR__ . '/../db.php';


try {
  $sQuery = $db->prepare("SELECT answers.id, answers.answer, answers.question_fk, users.id, users.username, answers.date FROM answers
  INNER JOIN users ON answers.user_fk = users.id
  WHERE question_fk = :iId");

  $sQuery->bindValue(':iId', $_GET['questionId']);
  $sQuery->execute();
  $aAnswers = $sQuery->fetchAll();


  echo json_encode($aAnswers);
} catch (PDOException $e) {
  echo '{"status":0, "message":"error to signUp", "code":"001"' . $e . '}';
}
