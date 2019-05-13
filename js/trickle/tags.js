$(document).ready(function(){
    $.ajax({
        url: 'apis/api-tags-count.php',
        dataType: 'json'
    }).always(function(jData){
        for (var i in jData){
            console.log(jData[i], 'jData[i]')
        $('#allTags').prepend(`
        <div class="col-sm-6 col-md-4 col-lg-3 mb-3">
            <a href="${jData[i]['name']}" class="h-100 feature-item">
              <span class="d-block icon flaticon-calculator mb-3 text-primary"></span>
              <h2>${jData[i]['name']}</h2>
              <span class="counting">${jData[i]['numberOfQuestions']}</span>
            </a>
          </div>
          
        `)} 
    })
})