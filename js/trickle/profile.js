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



/**************************************************************************
:: SHOW USER IMAGE
/**************************************************************************/

$(document).ready(function () {
    $.ajax({
        url: "apis/api-show-user-image.php",
        dataType: "JSON"
    }).always(function (jData) {
        console.log("jData ", jData);
        $.each(jData, function (i, item) {
            $("img#imgUser").attr('src', 'images/users/' + escapeHtml(jData[i]['img']));

        })
    })
})


/*************************
:: SAVE NEW USER IMAGE
***************************/
$('#file').change(function () {
    var file = $('.fileToUpdate')[0].files[0];
    console.log("file ", file);
    var fd = new FormData();
    fd.append('file', file);
    console.log("fd ", fd);

    $.ajax({
        url: "apis/api-edit-user-image.php",
        method: "POST",
        data: fd,
        contentType: false,
        processData: false,
        dataType: "JSON"
    }).always(function (jData) {
        console.log(jData)
    })

})



/*********************
:: UPDATE IMG URL
**********************/

function readURL(input) {
    console.log(input);
    if (input.files && input.files[0]) {
        var sIdImageToModify = $(input).parent().parent().find('#imgUser')
        console.log(" $(this) ", sIdImageToModify);

        var reader = new FileReader();
        reader.onload = function (e) {

            $(sIdImageToModify)
                .attr('src', e.target.result)
                .width(300)
                .height(300);
        };

        reader.readAsDataURL(input.files[0]);
    }
}


/*********************
:: END UPDATE IMG URL
**********************/


/**************************************************************************
:: SHOW USER IMAGE
/**************************************************************************/

$(document).ready(function () {
    $.ajax({
        url: "apis/api-show-user-profile.php",
        dataType: "JSON"
    }).always(function (jData) {
        console.log("jData ", jData);
        $.each(jData, function (i, item) {
            $('#user-details-container').append(`
            <h6>Username</h6>
            <p class="pUsername">${escapeHtml(jData[i]['username'])}</p>
            <h6>Level</h6>
            <p>${escapeHtml(jData[i]['level'])}</p> `)

            $('.used-tags-container').append(`
            <h6>Recent badges</h6>
            <a href="jData[i]['tag_id']" class="badge badge-dark badge-pill"> jData[i]['tag_name']</a>
            `)
            $('.question-container tbody').append(`
            <tr>
            <td>
                <span class="float-right font-weight-bold">${escapeHtml(jData[i]['date'])}</span> ${escapeHtml(jData[i]['title'])}
            </td>
            </tr>`)

            $('#frmEdit').append(`
            <div class="form-group row">
            <label class="col-lg-3 col-form-label form-control-label">Username</label>
            <div class="col-lg-9">
                <input class="form-control" type="text" name="txtUsername" value="${escapeHtml(jData[i]['username'])}">
            </div>
        </div>
        <div class="form-group row">
            <label class="col-lg-3 col-form-label form-control-label">Email</label>
            <div class="col-lg-9">
                <input class="form-control txtEmail" type="email" name="txtEmail" value="${escapeHtml(jData[i]['email'])}">
            </div>
        </div>
        <div class="form-group row">
            <label class="col-lg-3 col-form-label form-control-label">Password</label>
            <div class="col-lg-9">
                <input class="form-control" type="password" name="txtPassword" placeholder="(if empty, the value will be your previous password)" value="">
            </div>
        </div>
        <div class="form-group row">
            <label class="col-lg-3 col-form-label form-control-label">Confirm password</label>
            <div class="col-lg-9">
                <input class="form-control" type="password" name="txtConfirmPassword" placeholder="(if empty, the value will be your previous password)" value="">
            </div>
        </div>
        <div class="form-group row">
            <label class="col-lg-3 col-form-label form-control-label"></label>
            <div class="col-lg-9">
                <input type="reset" class="btn btn-secondary btnDelete" value="Cancel">
                <input type="button" class="btn btn-primary btnEdit" id="btnEdit" value="Save Changes">
            </div>
        </div>

            `)
        })

    })

})



$(document).on('click', '.btnEdit', function () {
    $.ajax({
        url: "apis/api-edit-user.php",
        method: "POST",
        data: $('#frmEdit').serialize(),
        dataType: "JSON"
    }).always(function (jData) {
        if (jData.status === 1) {
            swal({
                title: "Success!",
                text: "Your profile has been update successfully!",
                icon: "success",
                button: "Close!",
            }).then(function () {
                window.location = 'profile.php'
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