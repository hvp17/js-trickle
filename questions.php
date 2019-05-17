<?php
session_start();
require_once "components/top.php";

?>

<div class="unit-5 overlay" style="background-image: url('images/hero_1.jpg');">
      <div class="container text-center">
      <h2 class="mb-0">Browse Questions about <?php echo $_GET['tag']?></h2>
        <p class="mb-0 unit-6"><a href="tags.php">Tags</a> <span class="sep">></span> <span>Questions</span></p>
      </div>
    </div>

<div class="container site-section">
    
    <br>
    <div id="questions" data-id="<?php echo $_GET['tag']?>"  class="rounded border"></div>
</div>






<?php
$sScript = 'questions-from-tag.js';
require_once "components/bottom.php";
?>

</body>

</html>