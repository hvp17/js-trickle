<?php
session_start();
require_once __DIR__ . '/../db.php';
// $db->beginTransaction();
try {
    if ($_FILES['file']) {

        if (move_uploaded_file(
            $_FILES['file']['tmp_name'],
            '../images/users/' . $_FILES['file']['name']
        )) {

            $sQuery = $db->prepare('UPDATE users
                            SET user_img = :sUserImg WHERE id = :iId');

            $sQuery->bindValue(':iId', 1); //$_SESSION['jUser']['id']);
            $sQuery->bindValue(':sUserImg', $_POST['file']);
            $sQuery->execute();
            //$iQuestion = $db->lastInsertId();
            if ($sQuery->rowCount()) {
                echo '{"status":1, "message":"success form 1"}';
            }
        }
    }
} catch (PDOException $e) {
    echo '{"status":0, "message":"error", "code":"001", "line":' . __LINE__ . '}';
}
