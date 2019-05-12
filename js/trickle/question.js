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

/*****************************************************
 ::SHOW TAGS
 ******************************************************/
$(document).ready(function() {
  $.ajax({
    url: "apis/api-show-tags.php",
    dataType: "json"
  }).always(function(jData) {
    for (var i in jData) {
      // console.log(i, 'jData[i]')
      $("#txtTags").prepend(
        `<button type="button" id="${escapeHtml(
          jData[i].id
        )}" class='tag'>${escapeHtml(jData[i].name)}<span></span></button>`
      );
    }
  });
});

// Activate different tags
$(document).on("click", "button.tag", function() {
  const tag = $(this);
  if (!tag.hasClass("active")) {
    $(tag).addClass("active");
    $(tag)
      .children()
      .addClass("close");
    $(".tags-wrapper").append(tag);
  }
});

////////////////////////////////////////////////////// TOMAS HELP. We want to remove the parent object of the span when
////////////////////////////////////////////////////// clicking on the specific span with the class close
$(document).on("click", ".close", function() {
  if (
    $(this)
      .parent()
      .hasClass("active")
  ) {
    $(this)
      .parent()
      .remove();
  }

  if (
    $(this)
      .parent()
      .find("button")
      .hasClass("active")
  ) {
    $(this)
      .parent()
      .find("button")
      .removeClass("active");
  }

  $(this)
    .parent()
    .find("button")
    .removeClass("active");
  var tagId = $(this)
    .parent()
    .attr("id");
  var tagName = $(this)
    .parent()
    .text();
  $(this).removeClass("close");
  $("#txtTags").prepend(
    `<button type="button" id="${escapeHtml(tagId)}" class='tag'>${escapeHtml(
      tagName
    )}<span></span></button>`
  );
});

/*******************************************************************************
                                ::INSERT QUESTION
********************************************************************************/
$("#frmQuestion").submit(function(e) {
  /*****************************************************
 ::TAGS
 ******************************************************/

  $("#txtTags").on("change", "select", function() {
    //var tag = $(this).children("option:selected").text();
    // console.log(tag, 'taag')
    console.log("hi");
    /*  var tagHTML = '<span class="tag" id="' + tag + '">' + tag + '<span class="close"></span></span>'
    $('.tags-wrapper').append(tagHTML) */
  });

  e.preventDefault();
  $.ajax({
    url: "apis/api-insert-question.php",
    method: "POST",
    data: $("#frmQuestion").serialize(),
    dataType: "JSON"
  }).always(function(jData) {
    console.log(jData);

    // if (jData.status === 1) {
    //     swal({
    //         title: "Good job!",
    //         text: "Your question has been successfully inserted!",
    //         icon: "success",
    //         button: "Close!",
    //     }).then(function () {
    //         window.location = 'index.php'
    //     });
    //     return;
    // } else {
    //     swal({
    //         title: "Error!",
    //         text: "Try again..",
    //         icon: "error",
    //         button: "Close!",
    //     });
    //     return;
    // }
  });
});

$(document).ready(function() {
  //input type text focusin
  $("input[type=text]").focusin(function() {
    $(this).keyup(function() {
      if ($(this).val() === "") {
        $(this).css("border", "1px solid red");
      } else {
        $(this).css("border", "1px solid green");
      }
    });
  });
  //input type textarea focusin
  $("textarea").focusin(function() {
    $(this).keyup(function() {
      if ($(this).val() === "") {
        $(this).css("border", "1px solid red");
      } else {
        $(this).css("border", "1px solid green");
      }
    });
  });

  //input type text focusout
  $("input[type=text]").focusout(function() {
    if ($(this).val() === "") {
      $(this).css("border", "1px solid red");
    } else {
      $(this).css("border", "1px solid green");
    }
  });

  //input type textarea focusout
  $("textarea").focusout(function() {
    if ($(this).val() === "") {
      $(this).css("border", "1px solid red");
    } else {
      $(this).css("border", "1px solid green");
    }
  });
});

/*******************************************************************************
                            ::SHOW ALL QUESTIONS
*******************************************************************************/
$(document).ready(function() {
  $.ajax({
    url: "apis/api-show-all-questions.php",
    dataType: "JSON"
  }).always(function(jData) {
    console.log("jData ", jData);
    //${jData[i]['sneaker_id']}
    $.each(jData, function(i, item) {
      $(".questions-wrap").append(`
                <a href="question-single.php?id=${
                  jData[i]["id"]
                }" class="job-item d-block d-md-flex align-items-center  border-bottom fulltime">
                    <div class="company-logo blank-logo text-center text-md-left pl-3">
                        <img src="images/company_logo_blank.png" alt="Image" class="img-fluid mx-auto">
                    </div>
                    <div class="job-details h-100">
                        <div class="p-3 align-self-center">
                            <h3>${escapeHtml(jData[i]["title"])}</h3>
                            <p class="description">
                                ${escapeHtml(jData[i]["description"])}
                            </p>
                            <div class="d-block d-lg-flex">
                                <div class="mr-3"><i class="fas fa-user"></i> ${escapeHtml(
                                  jData[i]["username"]
                                )}</div>
                                <div><i class="fas fa-calendar-day"></i> ${escapeHtml(
                                  jData[i]["date"]
                                )}</div>
                                <div class="mr-3"><i class="fas fa-asterisk"></i> ${escapeHtml(
                                  jData[i]["levels_name"]
                                )}</div>
                            </div>
                        </div>
                    </div>
                    <div class="job-category align-self-center">
                        <div class="p-3">
                            <span class="text-info p-2 rounded border border-info">Tags</span>
                        </div>
                    </div>
                </a>
            `);
    });
  });
});
