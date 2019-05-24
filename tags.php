<?php
require_once "components/top.php";
?>

    <div class="unit-5 overlay" style="background-image: url('images/hero_1.jpg');">
      <div class="container text-center">
        <h2 class="mb-0">All Tags</h2>
        <p class="mb-0 unit-6"><a href="index.php">Home</a> <span class="sep">></span> <span>Tags</span></p>
      </div>
    </div>
    <div class="site-section">
      <div class="container">
        <div class="row" id="allTags">
        </div>
    </div>

    <?php
    $sScript ='tags.js';
    require_once "components/bottom.php";
    ?>
