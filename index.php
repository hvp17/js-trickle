<?php
session_start();
require_once "components/top.php";

?>

<div class="site-blocks-cover overlay" style="background-image: url('images/hero_1.jpg');" data-aos="fade" data-stellar-background-ratio="0.5">
  <div class="container">
    <div class="row align-items-center">
      <div class="col-12" data-aos="fade">
        <h1>Find Question</h1>
        <form action="#">
          <div class="row mb-3">
            <div class="col-md-9">
              <div class="row">
                <div class="col-xs-12 col-sm-6 col-lg-12" id="searchbar-wrapper">
                  <input type="text" class="mr-3 form-control border-0 px-4" placeholder="Search... ">
                </div>
              </div>
            </div>
            <div class="col-md-3">
              <input type="submit" class="btn btn-search btn-primary btn-block" value="Search">
            </div>
          </div>

        </form>
      </div>
    </div>
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
$sScript = 'question.js';
require_once "components/bottom.php";
?>


</body>

</html>