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




$(document).ready(function () {
    $.ajax({
        url: "apis/api-show-img.php",
        dataType: "JSON"
    }).always(function (jData) {
        $.each(jData, function (i, item) {
            $("img#imgUser").attr('src', 'images/users/' + escapeHtml(jData[i]['img']));

        })
    })
})



$('#file').change(function () {
    var file = $('.fileToUpdate')[0].files[0];
    console.log("file ", file);
    var fd = new FormData();
    fd.append('file', file);
    console.log("fd ", fd);

    $.ajax({
        url: "apis/api-edit-user.php",
        method: "POST",
        data: fd,
        contentType: false,
        processData: false,
        dataType: "JSON"
    }).always(function (jData) {
        console.log(jData)
        // console.log(jData.status)
    })

})



/*STILL FOR UPDATE IMG */

function readURL(input) {
    console.log(input);
    /* const index = $(input).attr('data-index');
    console.log('xx', index); */
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


/*END STILL FOR UPDATE IMG */