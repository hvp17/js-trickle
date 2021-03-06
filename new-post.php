<?php
// check if the user is logged
// not logged, take the user to the login page
session_start();
if (!$_SESSION['jUser']) {
  header('Location: login.php');
  exit;
}
require_once __DIR__ . '/class/token.php';
require_once "components/top.php";
?>

<div class="unit-5 overlay" style="background-image: url('images/hero_1.jpg');">
  <div class="container text-center">
    <h2 class="mb-0">Ask Question</h2>
    <p class="mb-0 unit-6"><a href="index.html">Home</a> <span class="sep">></span> <span>Ask Question</span></p>
  </div>
</div>




<div class="site-section bg-light">
  <div class="container">
    <div class="row">

      <div class="col-md-12 col-lg-8 mb-5">



        <form class="p-5 bg-white" id="frmQuestion">

          <!-----------------------------
      ::QUESTION TITLE::
-------------------------------->
          <div class="row form-group">
            <div class="col-md-12 mb-3 mb-md-0">
              <label class="font-weight-bold" for="txtTitle">Title</label>
              <input maxlength="50" type="text" id="txtTitle" class="form-control" name="txtTitle" placeholder="eg. Full Stack Frontend" required>
            </div>
          </div>

          <!-----------------------------
      ::QUESTION TYPE::
-------------------------------->
          <div class="row form-group">
            <div class="col-md-12">

              <h3>User level</h3>

            </div>
            <div class="col-md-12 mb-3 mb-md-0">
              <label for="option-user-level-1">
                <input type="radio" id="option-user-level-1" class="user-level" name="txtLevel" value="1" required> Beginner
              </label>
            </div>
            <div class="col-md-12 mb-3 mb-md-0">
              <label for="option-user-level-2">
                <input type="radio" id="option-user-level-2" class="user-level" name="txtLevel" value="2" required> Intermediate
              </label>
            </div>

            <div class="col-md-12 mb-3 mb-md-0">
              <label for="option-user-level-3">
                <input type="radio" id="option-user-level-3" class="user-level" name="txtLevel" value="3" required> Expert
              </label>
            </div>

          </div>

          <!-----------------------------
      ::QUESTION TAGS::
-------------------------------->

          <div class="row form-group mb-4">
            <div class="col-md-12">
              <h3>Tags</h3>
            </div>
            <div class="col-md-12 mb-3 mb-md-0 tags-container">
              <div class="tags-wrapper" id="tagsArray"></div>
            </div>
          </div>
          <div id="txtTags" name="txtTags">
          </div>

          <!-----------------------------
      ::QUESTION DESCRIPTION::
-------------------------------->

          <div class="row form-group">
            <div class="col-md-12">
              <h3>Question</h3>
            </div>
            <div class="col-md-12 mb-3 mb-md-0">
              <textarea maxlength="250" id="txtDescription" name="txtDescription" class="form-control" cols="30" rows="5" required></textarea>
              <input type="hidden" name="token" value="<?= Token::generate() ?>">
            </div>
          </div>

          <div class="row form-group">
            <div class="g-recaptcha" data-sitekey="6LdDM6IUAAAAAD18nn5YfuEFt2nHUyFEbWLP5Xt-"></div>

            <div class="col-md-12">
              <button type="button" id="btnQuestion" class="btn btn-primary  py-2 px-5">Submit Question</button>
            </div>
          </div>


        </form>
      </div>

      <div class="col-lg-4">
        <div class="p-4 mb-3 bg-white">
          <h3 class="h5 text-black mb-3">More Info</h3>
          <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ipsa ad iure porro mollitia architecto hic consequuntur. Distinctio nisi perferendis dolore, ipsa consectetur</p>
          <p><a href="#" class="btn btn-primary  py-2 px-4">Learn More</a></p>
        </div>
      </div>
    </div>
  </div>
</div>




<div class="site-section">
  <div class="container">
    <div class="row justify-content-center text-center mb-5">
      <div class="col-md-6" data-aos="fade">
        <h2>Frequently Ask Questions</h2>
      </div>
    </div>


    <div class="row justify-content-center" data-aos="fade" data-aos-delay="100">
      <div class="col-md-8">
        <div class="accordion unit-8" id="accordion">
          <div class="accordion-item">
            <h3 class="mb-0 heading">
              <a class="btn-block" data-toggle="collapse" href="#collapseOne" role="button" aria-expanded="true" aria-controls="collapseOne">What is the Angular<span class="icon"></span></a>
            </h3>
            <div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-parent="#accordion">
              <div class="body-text">
                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Consequatur quae cumque perspiciatis aperiam accusantium facilis provident aspernatur nisi optio debitis dolorum, est eum eligendi vero aut ad necessitatibus nulla sit labore doloremque magnam! Ex molestiae, dolor tempora, ad fuga minima enim mollitia consequuntur, necessitatibus praesentium eligendi officia recusandae culpa tempore eaque quasi ullam magnam modi quidem in amet. Quod debitis error placeat, tempore quasi aliquid eaque vel facilis culpa voluptate.</p>
              </div>
            </div>
          </div> <!-- .accordion-item -->

          <div class="accordion-item">
            <h3 class="mb-0 heading">
              <a class="btn-block" data-toggle="collapse" href="#collapseTwo" role="button" aria-expanded="false" aria-controls="collapseTwo">How foreach an array in JQuery?<span class="icon"></span></a>
            </h3>
            <div id="collapseTwo" class="collapse" aria-labelledby="headingOne" data-parent="#accordion">
              <div class="body-text">
                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Vel ad laborum expedita. Nostrum iure atque enim quisquam minima distinctio omnis, consequatur aliquam suscipit, quidem, esse aspernatur! Libero, excepturi animi repellendus porro impedit nihil in doloremque a quaerat enim voluptatum, perspiciatis, quas dignissimos maxime ut cum reiciendis eius dolorum voluptatem aliquam!</p>
              </div>
            </div>
          </div> <!-- .accordion-item -->

          <div class="accordion-item">
            <h3 class="mb-0 heading">
              <a class="btn-block" data-toggle="collapse" href="#collapseThree" role="button" aria-expanded="false" aria-controls="collapseThree">How does it work Javascript? <span class="icon"></span></a>
            </h3>
            <div id="collapseThree" class="collapse" aria-labelledby="headingOne" data-parent="#accordion">
              <div class="body-text">
                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Vel ad laborum expedita. Nostrum iure atque enim quisquam minima distinctio omnis, consequatur aliquam suscipit, quidem, esse aspernatur! Libero, excepturi animi repellendus porro impedit nihil in doloremque a quaerat enim voluptatum, perspiciatis, quas dignissimos maxime ut cum reiciendis eius dolorum voluptatem aliquam!</p>
              </div>
            </div>
          </div> <!-- .accordion-item -->

          <div class="accordion-item">
            <h3 class="mb-0 heading">
              <a class="btn-block" data-toggle="collapse" href="#collapseFour" role="button" aria-expanded="false" aria-controls="collapseFour">Which is the main difference between JQuery and Javascript?<span class="icon"></span></a>
            </h3>
            <div id="collapseFour" class="collapse" aria-labelledby="headingOne" data-parent="#accordion">
              <div class="body-text">
                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Vel ad laborum expedita. Nostrum iure atque enim quisquam minima distinctio omnis, consequatur aliquam suscipit, quidem, esse aspernatur! Libero, excepturi animi repellendus porro impedit nihil in doloremque a quaerat enim voluptatum, perspiciatis, quas dignissimos maxime ut cum reiciendis eius dolorum voluptatem aliquam!</p>
              </div>
            </div>
          </div> <!-- .accordion-item -->

        </div>
      </div>
    </div>

  </div>
</div>
<?php
$sScript = 'question.js';
require_once "components/bottom.php";
?>
