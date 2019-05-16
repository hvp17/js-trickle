/***********************************************************************
   ::ESCAPE STRING AGAINS XSS
************************************************************************/
function escapeHtml(unsafe) {
  if (!unsafe) return "";
  if (unsafe.trim() === "") return unsafe;
  return unsafe
    .replace(/&/g, "&amp;")
    .replace(/</g, "&lt;")
    .replace(/>/g, "&gt;")
    .replace(/"/g, "&quot;")
    .replace(/'/g, "&#039;");
}

/*************************************************************************
::END ESCAPE STRING AGAINS XSS
**************************************************************************/
$(document).ready(function () {
  var questionId = $('.content').attr('id')

  $.ajax({
    url: "apis/api-single-question.php",
    data: {
      questionId: questionId
    },
    dataType: "JSON"
  }).always(function (jData) {
    console.log(jData)
    $('.content').append(`
        <div class="unit-5 overlay" style="background-image: url('images/hero_2.jpg');">
      <div class="container text-center">
        <h2 id="${escapeHtml(jData[0]['id'])}" class="mb-0">${escapeHtml(jData[0]['title'])}</h2>
      </div>
    </div>




    <div class="question-section bg-light">
      <div class="container">
        <div class="row">

          <div class="col-md-12 col-lg-8 mb-5">



            <div class="p-5 bg-white">

              <div class="mb-4 mb-md-5 mr-5">
               <div class="job-post-item-header d-flex align-items-center">
                 <h3 class="mr-3 text-black h4">${escapeHtml(jData[0]['title'])}</h3>
                 <div class="badge-wrap">
                  <span class="border border-warning text-warning py-2 px-4 rounded">${escapeHtml(jData[0]['date'])}</span>
                 </div>
               </div>
               <div class="d-block d-md-flex">
                 <div class="mr-2"><span class="fl-bigmug-line-portfolio23"></span> The questions difficulty level:</div>
                 <div><span class="font-weight-bold">${escapeHtml(jData[0]['level'])}</span></div>


               </div>
               <p>Posted by <span class="font-weight-bold">${escapeHtml(jData[0]['username'])}</span></p>
              </div>





              <h5>Question</h5>
              <p>${escapeHtml(jData[0]['question'])}
              </p>

              </div>
              </div>


          <div class="col-lg-4">


            <div class="p-4 mb-3 bg-white">
            <h3>Your answer</h3>

            <form>
            <textarea placeholder="Answer" id="txtAnswer"></textarea>
            <button type="button" class="btn btn-primary  py-2 px-4" id="btnAnswer">Submit answer</button>

            </form>
            </div>
          </div>
        </div>
      </div>
    </div>
        `)
  })


  $.ajax({
    url: "apis/api-show-answers-for-question.php",
    data: {
      questionId: questionId
    },
    dataType: "JSON"
  }).always(function (jData) {
    console.log(jData, 'jData')
    for (var i in jData) {
      $('#answers').prepend(`
    <div class="col-md-8">
        <h4 id="${escapeHtml(jData[i].id)}">User ${escapeHtml(jData[i].username)}</h4>
        <p>${escapeHtml(jData[i].date)}</p>
                <div class="body-text">
            <p>${escapeHtml(jData[i].answer)}</p>
            </div>

          </div>
    `)
    }
  })
})



$(document).on('click', '#btnAnswer', function () {
  var questionId = $('.content').attr('id')
  console.log("questionId ", questionId);
  var answer = $(this).siblings().val()
  console.log("answer ", answer);
  $.ajax({
    url: "apis/api-insert-answer.php",
    data: {
      answer: answer,
      questionId: questionId
    },
    dataType: "JSON",
    method: "POST"
  }).always(function (jData) {
    console.log('jData ANSW', jData)
  })
})