<?php
//start_session();
require_once __DIR__ . '/../db.php';
try {

    $sQuery = $db->prepare("SELECT users.id,images.id AS imageId, images.img FROM `images`
    JOIN users on users.image_fk = images.id
    WHERE users.id = :iUserId");
    $sQuery->bindValue(':iUserId',  1); //$_SESSION['jUser']['id']);
    $sQuery->execute();
    $sImg = $sQuery->fetchAll();
    echo json_encode($sImg);
} catch (PDOException $e) {
    echo '{"status":0, "message":"error to signUp", "code":"001"' . $e . '}';
}
