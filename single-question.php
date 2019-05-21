<?php
require_once "components/top.php";
?>

<div class="content" id="<?php echo $_GET['id']; ?>">
<div class="col-lg-4">


            <div class="p-4 mb-3 bg-white">
            <h3>Your answer</h3>

            <form>
            <textarea placeholder="Answer" id="txtAnswer"></textarea>
            <button type="button" class="btn btn-primary  py-2 px-4" id="btnAnswer">Submit answer</button>

            </form>
            <br>
            <p id="response"></p>
            </div>
          </div>
        </div>
      </div>
    </div>
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




</body>

</html>