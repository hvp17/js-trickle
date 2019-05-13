<?php

require_once __DIR__.'/../db.php';
try{
  $sQuery = $db->prepare('
    SELECT * FROM tags
  ');
  $sQuery->execute();
  $aTags = $sQuery->fetchAll();

  echo json_encode($aTags);

}catch(PDOException $exception){
  echo '{"status":0, "message":"Indlæg kan ikke vises"}';
}
