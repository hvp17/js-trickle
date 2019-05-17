<?php
session_start();
require_once "components/top.php";

?>

<h2>Browse Questions about <?php echo $_GET['tag']?></h2>
<div id="questions" data-id="<?php echo $_GET['tag']?>"  class="rounded border"></div>




<?php
$sScript = 'questions-from-tag.js';
require_once "components/bottom.php";
?>

</body>

</html>