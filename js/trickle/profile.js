/*Update IMG USER */
$(document).on('click', '#btnEditImg', function () {
    var files = $('#userImg')[0].files[0];
    $.ajax({
        url: "apis/api-edit-user.php",
        method: "POST",
        data: {
            files: files
        },
        dataType: "JSON"

    }).always(function (jData) {
        console.log("jData ", jData);

    })

})
/*STILL FOR UPDATE IMG */

function readURL(input) {
    console.log(input);
    const index = $(input).attr('data-index');
    console.log('xx', index);
    if (input.files && input.files[0]) {
        var sIdImageToModify = $(input).parent().find('.imgUser')
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