<?php
///////    SYNTAX ERROR CHECK    ////////////
ini_set('display_errors', 0);
///////    END SYNTAX ERROR CHECK    ////////////

if (
    empty($_POST['sAnswer'])
) {
    echo '{"status":5, "message":"empty field ***CANNOT INSERT***"}';
    exit;
}



session_start();
require_once __DIR__ . '/../db.php';


try {
    $sQuery = $db->prepare('UPDATE answers
    SET answer = :sAnswer
    WHERE
    id = :iAnswerId AND user_fk = :iUserFK');

    $sQuery->bindValue(':iAnswerId', $_POST['iAnswerId']);
    $sQuery->bindValue(':iUserFK', $_SESSION['jUser']);
    $sQuery->bindValue(':sAnswer', $_POST['sAnswer']);
    $sQuery->execute();

    if ($sQuery->rowCount()) {
        $iPostId = $db->lastInsertId();
        echo '{"status":1, "message":"Answer inserted"}';
    }
} catch (PDOException $e) {
    echo '{"status":0, "message":"error", "code":"001", "error":' . $exception . '}';

    exit;
}
