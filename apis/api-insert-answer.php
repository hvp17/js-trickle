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
    empty($_POST['txtAnswer'])
) {
    echo '{"status":5, "message":"empty field ***CANNOT INSERT***"}';
    exit;
}



session_start();
require_once __DIR__ . '/../db.php';


try {
    $sQuery = $db->prepare('INSERT INTO answers
                            VALUES (null, :iQuestionFK, :iUserFK, :sAnswer)');

    $sQuery->bindValue(':iQuestionFK', $_GET['id']);
    $sQuery->bindValue(':iUserFK', $_SESSION['jUser']['id']);
    $sQuery->bindValue(':sAnswer', $_POST['txtAnswer']);
    $sQuery->execute();

    if ($sQuery->rowCount()) {
        $iPostId = $db->lastInsertId();
        echo '{"status":1, "message":"Answer inserted"}';
    }
} catch (PDOException $e) {
    echo '{"status":0, "message":"error", "code":"001", "error":' . $exception . '}';

    exit;
}