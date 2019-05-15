$(document).ready(function () {
    var questionId = $('.content').attr('id')
    console.log(questionId)
    $.ajax({
        url: "apis/api-single-question.php",
        data: {questionId:questionId},
        dataType: "JSON"
    }).always(function (jData){
        console.log(jData)
        $('.content').append(`
        <div class="unit-5 overlay" style="background-image: url('images/hero_2.jpg');">
      <div class="container text-center">
        <h2 id="${jData[0]['id']}" class="mb-0">${jData[0]['title']}</h2>
      </div>
    </div>

     
    

    <div class="question-section bg-light">
      <div class="container">
        <div class="row">
       
          <div class="col-md-12 col-lg-8 mb-5">
          
            
          
            <div class="p-5 bg-white">

              <div class="mb-4 mb-md-5 mr-5">
               <div class="job-post-item-header d-flex align-items-center">
                 <h3 class="mr-3 text-black h4">${jData[0]['title']}</h3>
                 <div class="badge-wrap">
                  <span class="border border-warning text-warning py-2 px-4 rounded">${jData[0]['date']}</span>
                 </div>
               </div>
               <div class="d-block d-md-flex">
                 <div class="mr-2"><span class="fl-bigmug-line-portfolio23"></span> The questions difficulty level:</div>
                 <div><span class="font-weight-bold">${jData[0]['level']}</span></div>
                 
                 
               </div>
               <p>Posted by <span class="font-weight-bold">${jData[0]['username']}</span></p>
              </div>


            
             
          
              <h5>Question</h5>
              <p>${jData[0]['question']}
              </p>
        
              </div>
              </div>
              

          <div class="col-lg-4">
            
            
            <div class="p-4 mb-3 bg-white">
            <form>
            <h3>Your answer</h3>
            <textarea placeholder="Answer"></textarea>
            <button type="button" class="btn btn-primary  py-2 px-4">Submit answer</button>
            </form>
            </div>
          </div>
        </div>
      </div>
    </div>
        `)
    })
})
