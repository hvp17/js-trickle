<?php
session_start();
require_once "components/top.php";
require_once __DIR__ . '/class/token.php';
/************************************
::ESCAPE STRING AGAINS XSS
 *************************************/
function _e($string)
{
  echo htmlspecialchars($string, ENT_QUOTES, 'UTF-8');
}
/************************************
::END ESCAPE STRING AGAINS XSS
 *************************************/

?>

<div class="content" id="<?php echo _e($_GET['id']); ?>">

  <input type="hidden" name="token" value="<?= Token::generate() ?>">
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