<?php
session_start();
require_once __DIR__ . '/../db.php';
/*********************
:: SHOW IMG
**********************/
try {

    $sQuery = $db->prepare("SELECT users.id,users.username,users.email,users.password,images.id AS imageId, images.img FROM `images`
    JOIN users on users.image_fk = images.id
    WHERE users.id = :iUserId");
    $sQuery->bindValue(':iUserId', $_SESSION['jUser']);
    $sQuery->execute();
    $aUserImg = $sQuery->fetchAll();
    echo json_encode($aUserImg);
} catch (PDOException $e) {
    echo '{"status":0, "message":"error to signUp", "code":"001"' . $e . '}';
}