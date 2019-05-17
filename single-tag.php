<?php
require_once "components/top.php";
?>

    <div class="unit-5 overlay" style="background-image: url('images/hero_1.jpg');">
      <div class="container text-center">
        <h2 class="mb-0">Tag questions</h2>
        <p class="mb-0 unit-6"><a href="index.php">Home</a> <span class="sep">></span> <span>Tag Questions</span></p>
      </div>
    </div>

    

    <div class="site-section bg-light">
  <div class="container">
    <div class="row">
      <div class="text-center col-md-12 section-heading">
        <h2>See Questions</h2>
        <br>
      </div>
      <div class="col-md-12">
        <div class="m-4 text-center">
          <button class="btn btn-outline-primary">Recent Questions</button>
          <button class="btn btn-outline-primary">Recent Answers</button>
          <button class="btn btn-outline-primary">Popular Questions</button>
        </div>

        <div class="rounded border questions-wrap">



        </div>

        <div class="col-md-12 text-center mt-5">
          <a href="tags.php" class="btn btn-primary rounded py-3 px-5"><span class="icon-plus-circle"></span> Browse Tags</a>
        </div>
      </div>

    </div>
  </div>
</div>
 
    
      
    <?php
    $sScript ='single-tag.js';
    require_once "components/bottom.php";
    ?>

  </body>
</html>