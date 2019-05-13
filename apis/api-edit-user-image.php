<?php
require_once __DIR__ . '/../db.php';
$file =  $_FILES['file']['name'];
//start_session();
$db->beginTransaction();


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
    $sQuery = $db->prepare('UPDATE users SET image_fk=:iImageId WHERE id = :iUserId ');
    $sQuery->bindValue(':iUserId', 1); //$_SESSION['jUser']['id']);
    $sQuery->bindValue(':iImageId', $iImageId);
    $sQuery->execute();

    if ($sQuery->rowCount()) {
        echo '{"status":1, "message":"success form 2"}';
        $db->commit();
        exit;
    }
} catch (PDOException $e) {
    echo '{"status":0, "message":"error", "code":"001", "line":' . __LINE__ . '}';
    $db->rollBack();
}
