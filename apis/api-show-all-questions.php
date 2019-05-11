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

  

  $sQuery = $db->prepare("SELECT 
  questions.id, 
  questions.title, 
  questions.description AS question, 
  questions.date, 
  levels.name AS level, 
  users.username, 
  GROUP_CONCAT(tags.name) AS tags 

  FROM questions

  INNER JOIN users ON users.id = questions.user_fk
  INNER JOIN levels ON levels.id = questions.level_fk
  INNER JOIN questions_tags ON questions.id = questions_tags.questions_fk 
  INNER JOIN tags ON tags.id = questions_tags.tags_fk 
                    
  GROUP BY questions.id");
  
  $sQuery->execute();
  $aQuestions = $sQuery->fetchAll();


  echo json_encode($aQuestions);
} catch (PDOException $e) {
  echo '{"status":0, "message":"error to signUp", "code":"001"' . $e . '}';
}
