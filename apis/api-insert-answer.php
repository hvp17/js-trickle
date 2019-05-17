<?php
///////    SYNTAX ERROR CHECK    ////////////
ini_set('display_errors', 1);
///////    END SYNTAX ERROR CHECK    ////////////
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

if (
    empty($_POST['answer'])
) {
    echo '{"status":5, "message":"empty field ***CANNOT INSERT***", "code":212}';
    exit;
}

session_start();
require_once __DIR__ . '/../db.php';

$db->beginTransaction();

try{

    $sQuery = $db->prepare("SELECT COUNT(*) AS answer_count FROM answers INNER JOIN questions ON question_fk = questions.id WHERE answers.user_fk = :iUserFK AND questions.id = :iQuestionId LIMIT 1");

    $sQuery->bindValue(':iUserFK', $_SESSION['jUser']['id']);
    $sQuery->bindValue(':iQuestionId', $_POST['questionId']);
    $sQuery->execute();
    $aAnswerFromUser = $sQuery->fetchAll();
    $answerCountFromUser = $aAnswerFromUser[0]['answer_count'];
   
    if($answerCountFromUser>0){

        try{

            $sQuery = $db->prepare("SELECT answers.date AS answer_date, questions.user_fk AS question_user_id FROM answers INNER JOIN questions ON question_fk = questions.id WHERE answers.user_fk = :iUserFK AND questions.id = :iQuestionId ORDER BY answer_date DESC LIMIT 1");
        
            $sQuery->bindValue(':iUserFK', $_SESSION['jUser']['id']);
            $sQuery->bindValue(':iQuestionId', $_POST['questionId']);
            $sQuery->execute();
            $aAnswers = $sQuery->fetchAll();
            $questionUserId = $aAnswers[0]['question_user_id'];
            $answerDateFromUser = $aAnswers[0]['answer_date'];
            // echo 'ok nested 1';
        }catch (PDOException $e) {
            $db->rollBack();
            echo '{"status":0, "message":"error", "code":"001", "error":' . $e . '}';
            exit;
        }
        

    }
    
}catch (PDOException $e) {
    $db->rollBack();
    echo '{"status":0, "message":"error", "code":"001", "error":' . $e . '}';
    exit;
}


try{

    $sQuery = $db->prepare("SELECT COUNT(*) AS answer_count FROM answers INNER JOIN questions ON question_fk = questions.id WHERE answers.user_fk = :iUserId AND questions.id = :iQuestionId LIMIT 1");

    $sQuery->bindValue(':iUserId',  $questionUserId);
    $sQuery->bindValue(':iQuestionId', $_POST['questionId']);
    $sQuery->execute();
    $aAnswerFromAuthor = $sQuery->fetchAll();
    $answerCountFromAuthor = $aAnswerFromAuthor[0]['answer_count'];
    if($answerCountFromAuthor>0){

        try{

            $sQuery = $db->prepare("SELECT answers.date AS answer_date, questions.user_fk AS question_user_id FROM answers INNER JOIN questions ON question_fk = questions.id WHERE answers.user_fk = :iUserId AND questions.id = :iQuestionId ORDER BY answer_date DESC LIMIT 1");
        
            $sQuery->bindValue(':iUserId',  $questionUserId);
            $sQuery->bindValue(':iQuestionId', $_POST['questionId']);
            $sQuery->execute();
            $aAnswer = $sQuery->fetchAll();
            $answerDateFromAuthor = $aAnswer[0]['answer_date'];
            // echo json_encode($responseAnswerDate);
            // echo 'ok nested 2';
            
        }catch (PDOException $e) {
            echo '{"status":0, "message":"error", "code":"001", "error":' . $e . '}';
        
            exit;
        }



    }
    // echo json_encode($responseAnswerDate);
    
}catch (PDOException $e) {
    $db->rollBack();

    echo '{"status":0, "message":"error", "code":"001", "error":' . $e . '}';

    exit;
}

$userTime = strtotime($answerDateFromUser);
$authorTime = strtotime($answerDateFromAuthor);

try{
if($userTime>$authorTime){
    echo '{"status":0, "message":"error", "code":106}';
    $db->rollBack();
    exit;

}
}catch (PDOException $exception) {
    $db->rollBack();

    echo '{"status":0, "message":"error", "code":"001", "error":' . $exception . '}';

    exit;
}


try {

    $sQuery = $db->prepare('INSERT INTO answers
                            VALUES (null, :iQuestionFK, :iUserFK, :sAnswer, null)');

    $sQuery->bindValue(':iQuestionFK', $_POST['questionId']);
    $sQuery->bindValue(':iUserFK', $_SESSION['jUser']['id']);
    $sQuery->bindValue(':sAnswer', $_POST['answer']);
    $sQuery->execute();

    if ($sQuery->rowCount()) {
        $iPostId = $db->lastInsertId();
        echo '{"status":1, "message":"Answer inserted", "code":111}';
        $db->commit();
    }
} catch (PDOException $e) {
    echo '{"status":0, "message":"error", "code":"002", "error":' . $exception . '}';
    $db->rollBack();
    exit;
}

