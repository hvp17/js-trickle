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


$(document).ready(function(){
    $.ajax({
        url: 'apis/api-tags-count.php',
        dataType: 'json'
    }).always(function(jData){
        for (var i in jData){
            console.log(jData[i], 'jData[i]')
        $('#allTags').prepend(`
        <div class="col-sm-6 col-md-4 col-lg-3 mb-3">
            <a href="questions.php?tag=${escapeHtml(jData[i]['name'])}" class="h-100 feature-item">
              <span class="d-block icon flaticon-calculator mb-3 text-primary"></span>
              <h2>${escapeHtml(jData[i]['name'])}</h2>
              <span class="counting">${escapeHtml(jData[i]['numberOfQuestions'])}</span>
            </a>
        </div>
          
        `)} 
    })
})
