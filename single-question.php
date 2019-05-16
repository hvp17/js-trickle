<?php
require_once "components/top.php";
?>

<div class="content" id="<?php echo $_GET['id']; ?>">
</div>






<div class="site-section">
  <div class="container">
    <div class="row justify-content-center text-center mb-5">
      <div class="col-md-6" data-aos="fade">
        <h2>All Answers</h2>
      </div>
    </div>


    <div id="answers" class="row justify-content-center" data-aos="fade" data-aos-delay="100">

    </div>

  </div>
</div>






<?php
$sScript = 'single-question.js';
require_once "components/bottom.php";
?>


<script>
  document.addEventListener('DOMContentLoaded', function() {
    var mediaElements = document.querySelectorAll('video, audio'),
      total = mediaElements.length;

    for (var i = 0; i < total; i++) {
      new MediaElementPlayer(mediaElements[i], {
        pluginPath: 'https://cdn.jsdelivr.net/npm/mediaelement@4.2.7/build/',
        shimScriptAccess: 'always',
        success: function() {
          var target = document.body.querySelectorAll('.player'),
            targetTotal = target.length;
          for (var j = 0; j < targetTotal; j++) {
            target[j].style.visibility = 'visible';
          }
        }
      });
    }
  });
</script>


</body>

</html>