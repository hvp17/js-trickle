/***********************************************************************
   ::ESCAPE STRING AGAINS XSS
************************************************************************/
function escapeHtml(unsafe) {
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










/*******************************************************************************
                                ::INSERT QUESTION
********************************************************************************/
$('#frmQuestion').submit(function (e) {
    e.preventDefault()
    $.ajax({
        url: "apis/api-insert-question.php",
        method: "POST",
        data: $('#frmQuestion').serialize(),
        dataType: "JSON"
    }).always(function (jData) {
        console.log(jData)

        if (jData.status === 1) {
            swal({
                title: "Good job!",
                text: "Your question has been successfully inserted!",
                icon: "success",
                button: "Close!",
            }).then(function () {
                window.location = 'index.php'
            });
            return;
        } else {
            swal({
                title: "Error!",
                text: "Try again..",
                icon: "error",
                button: "Close!",
            });
            return;
        }

    })
})

$(document).ready(function () {
    //input type text focusin
    $("input[type=text]").focusin(function () {
        $(this).keyup(function () {
            if ($(this).val() === '') {
                $(this).css("border", "1px solid red");
            } else {
                $(this).css("border", "1px solid green");
            }
        })
    });
    //input type textarea focusin
    $("textarea").focusin(function () {
        $(this).keyup(function () {
            if ($(this).val() === '') {
                $(this).css("border", "1px solid red");
            } else {
                $(this).css("border", "1px solid green");
            }
        })
    });

    //input type text focusout
    $("input[type=text]").focusout(function () {
        if ($(this).val() === '') {
            $(this).css("border", "1px solid red");
        } else {
            $(this).css("border", "1px solid green");
        }
    });

    //input type textarea focusout
    $("textarea").focusout(function () {
        if ($(this).val() === '') {
            $(this).css("border", "1px solid red");
        } else {
            $(this).css("border", "1px solid green");
        }
    });

});






/*******************************************************************************
                            ::SHOW ALL QUESTIONS
*******************************************************************************/
$(document).ready(function () {
    $.ajax({
        url: "apis/api-show-all-questions.php", //"mysql/apis/api-admin-read-sneakers.php",
        dataType: "JSON"
    }).always(function (jData) {
        console.log("jData ", jData);
        //${jData[i]['sneaker_id']}
        $.each(jData, function (i, item) {
            $('.questions-wrap').append(`

            <a href="question-single.php?id=${jData[i]['id']}" class="job-item d-block d-md-flex align-items-center  border-bottom fulltime">
            <div class="company-logo blank-logo text-center text-md-left pl-3">
                <img src="images/company_logo_blank.png" alt="Image" class="img-fluid mx-auto">
            </div>
            <div class="job-details h-100">
            <div class="p-3 align-self-center">
                <h3>${escapeHtml(jData[i]['title'])}</h3>

            <p class="description">
                ${escapeHtml(jData[i]['description'])}
            </p>


            <div class="d-block d-lg-flex">
                <div class="mr-3"><i class="fas fa-user"></i> ${escapeHtml(jData[i]['username'])}</div>
                <div><i class="fas fa-calendar-day"></i> ${escapeHtml(jData[i]['date'])}</div>
                <div class="mr-3"><i class="fas fa-asterisk"></i> ${escapeHtml(jData[i]['levels_name'])}</div>
             </div>
            </div>
    </div>
    <div class="job-category align-self-center">
      <div class="p-3">
        <span class="text-info p-2 rounded border border-info">Tags</span>
      </div>
    </div>
  </a>



                  `)

        })


    })
})



/*****************************************************
 ::TAGS
 ******************************************************/

/* $('.add-tags').on('keydown', function (e) {
    //which == KeyCode
    //console.log(e.which)
    if (e.which === 32) {
        //The trim() method removes whitespace from both sides of a string
        var tag = $.trim($('.add-tags').val());
        if (tag.length < 2) {
            return false;
        }
        var tagHTML = '<span class="tags" id="' + tag + '">' + tag + '<span class="close"></span></span></span>'
        $('.tags-wrapper').append(tagHTML)
        $('.add-tags').val('');
    }
}) */

$('#txtTags').on('change', function (e) {
    var tagId = $(this).children("option:selected").val();
    var tag = $(this).children("option:selected").text();

    var tagHTML = '<span class="tags" id="' + tag + '">' + tag + '<span class="close"></span></span></span>'
    $('.tags-wrapper').append(tagHTML)
    var t = $('.tags-wrapper').text()
    var array = [];
    /* $('.tags-wrapper').each(function () {
        array.push({
            content: $(this).text(),
            id: $(this).children().attr('id')
        })
        $(document).on('click', '#btnQuestion', function () {

            console.log("array ", array);
            $.ajax({
                url: "apis/api-insert-question.php",
                method: "POST",
                data: {
                    array: array
                },
                dataType: "JSON"
            }).always(function (jData) {
                console.log("jData ", jData);

            })
        })



    }) */

})

$(document).on('click', '.close', function () {
    $(this).closest("span.tags").remove();
})