  <?php

require_once __DIR__.'/../db.php';
try{
  $sQuery = $db->prepare('SELECT tags.id, tags.name, count(tags.name) as numberOfQuestions FROM tags
  INNER JOIN questions_tags ON tags.id = questions_tags.tags_fk
  group by tags.name, tags.id
  ');
  $sQuery->execute();
  $aTags = $sQuery->fetchAll();

  echo json_encode($aTags);

}catch(PDOException $exception){
  echo '{"status":0, "message":"Indlæg kan ikke vises"}';
}
