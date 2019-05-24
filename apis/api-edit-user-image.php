<?php
session_start();
require_once __DIR__ . '/../db.php';
$file =  $_FILES['file']['name'];
//start_session();
$db->beginTransaction();

$iImageId = '';
try {
    if ($file) {
        if (move_uploaded_file(
            $_FILES['file']['tmp_name'],
            '../images/users/' . $_FILES['file']['name']
        )) {
            $sImage = $_FILES['file']['name'];

            $sQuery = $db->prepare('INSERT INTO images VALUES (null, :sImg)');
            $sQuery->bindValue(':sImg', $sImage);
            $sQuery->execute();

            if ($sQuery->rowCount()) {
                $iImageId = $db->lastInsertId();
            }
        }
    }
} catch (PDOException $e) {
    echo '{"status":0, "message":"error to signUp", "code":"001"' . $e . '}';
    $db->rollBack();
}

try {

    $sQuery = $db->prepare('UPDATE users SET users.image_fk=:iImageId WHERE users.id = :iUserId ');
    $sQuery->bindValue(':iUserId', $_SESSION['jUser']);
    $sQuery->bindValue(':iImageId', $iImageId);
    $sQuery->execute();
    echo ($sQuery->rowCount()); //$iImageId;

    if ($sQuery->rowCount()) {
        echo '{"status":1, "message":"success form 2"}';
        $db->commit();
        echo 'lalalla';
        exit;
    }
} catch (PDOException $e) {
    echo '{"status":0, "message":"error", "code":"001", "line":' . __LINE__ . '}';
    $db->rollBack();
}
