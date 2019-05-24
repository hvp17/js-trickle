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
    var sTagName = $('#questions').data('id')

    $.ajax({
        url: 'apis/api-show-questions-from-tag.php',
        data: {
            sTagName: sTagName
        },
        dataType: 'json'
    }).always(function (jData) {

        $.each(jData, function (i, item) {

            $('#questions').prepend(`
            <a href="single-question.php?id=${escapeHtml(
                jData[i]["id"])
              }" class="job-item d-block d-md-flex align-items-center  border-bottom fulltime">
                  <div class="company-logo blank-logo text-center text-md-left pl-3">
                      <img src="images/company_logo_blank.png" alt="Image" class="img-fluid mx-auto">
                  </div>
                  <div class="job-details h-100">
                      <div class="p-3 align-self-center">
                          <h3>${escapeHtml(jData[i]["title"])}</h3>
                          <p class="description">
                              ${escapeHtml(jData[i]["question"])}
                          </p>

                          <div class="d-block d-lg-flex flex-column">
                          <div class="mr-3"><i class="fas fa-asterisk"></i> ${escapeHtml(
                            jData[i]["level"]
                          )}</div>
                              <div class="mr-3"><i class="fas fa-user"></i> ${escapeHtml(
                                jData[i]["username"]
                              )}</div>
                              <div><i class="fas fa-clock"></i> ${escapeHtml(
                                jData[i]["date"]
                              )}</div>

                          </div>
                      </div>
                  </div>
                  <div class="job-category align-self-center">
                      <div class="p-3">
                          <span class="text-info p-2 rounded border border-info tags">${escapeHtml(
                            jData[i]["tags"]
                          )}</span>
                      </div>
                  </div>
              </a>

            `)
        })
    })
})