</div>
<footer class="site-footer">
  <div class="container">


    <div class="row">
      <div class="col-md-4">
        <h3 class="footer-heading mb-4 text-white">About</h3>
        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Repellat quos rem ullam, placeat amet.</p>
      </div>
      <div class="col-md-6">
        <div class="row">
          <div class="col-md-6">
            <h3 class="footer-heading mb-4 text-white">Quick Menu</h3>
            <ul class="list-unstyled">
              <li><a href="profile.php">Profile</a></li>
              <li><a href="tags.php">Browse Tags</a></li>
              <li><a href="wc.php">See Weekly Challenges</a></li>
              <li><a href="new-post.php">Post a Question</a></li>

            </ul>
          </div>
          <div class="col-md-6">
            <h3 class="footer-heading mb-4 text-white">Tags</h3>
            <ul class="list-unstyled">
              <li><a href="#">Angular</a></li>
              <li><a href="#">JQuery</a></li>
              <li><a href="#">Javascript</a></li>
              <li><a href="#">PHP</a></li>
            </ul>
          </div>
        </div>
      </div>


      <div class="col-md-2">
        <div class="col-md-12">
          <h3 class="footer-heading mb-4 text-white">Social Icons</h3>
        </div>
        <div class="col-md-12">
          <p>
            <a href="#" class="pb-2 pr-2 pl-0"><span class="icon-facebook"></span></a>
            <a href="#" class="p-2"><span class="icon-twitter"></span></a>
            <a href="#" class="p-2"><span class="icon-instagram"></span></a>
            <a href="#" class="p-2"><span class="icon-vimeo"></span></a>

          </p>
        </div>
      </div>
    </div>
    <div class="row pt-5 mt-5 text-center">

    </div>
  </div>
</footer>


<script src="js/jquery-3.3.1.min.js"></script>
<script src="js/jquery-migrate-3.0.1.min.js"></script>
<script src="js/jquery-ui.js"></script>
<script src="js/popper.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/owl.carousel.min.js"></script>
<script src="js/jquery.stellar.min.js"></script>
<script src="js/jquery.countdown.min.js"></script>
<script src="js/jquery.magnific-popup.min.js"></script>
<script src="js/bootstrap-datepicker.min.js"></script>
<script src="js/aos.js"></script>
<script src="js/mediaelement-and-player.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="js/main.js"></script>
<script defer src="https://use.fontawesome.com/releases/v5.0.13/js/all.js" integrity="sha384-xymdQtn1n3lH2wcu0qhcdaOpQwyoarkgLVxC/wZ5q7h9gHtxICrpcaSUfygqZGOe" crossorigin="anonymous"></script>
<?php
if (isset($sScript)) {
  ?>
  <script src="js/trickle/<?= $sScript ?>"></script>
<?php } ?>