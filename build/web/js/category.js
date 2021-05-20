$(document).ready(function () {
    $('#add-category').on('submit', function (e) {
        e.preventDefault();

        let form = new FormData(this);

        $.ajax({
            url: "AddCategory",
            type: 'POST',
            data: form,
            success: function (data, status, err) {
                $('#msg').removeAttr("class");
                if (data.trim() === 'Success') {
                    $('#msg').addClass("alert").addClass("alert-success");
                    $('#msg').html("Category Saved Successfully");
                } else {
                    $('#msg').addClass("alert").addClass("alert-danger");
                    $('#msg').html(data.trim());
                }
            },
            error: function (data, status, err) {
                $('#msg').removeAttr("class");
                $('#msg').addClass("alert").addClass("alert-danger");
                $('#msg').html(data.trim());
            },
            contentType: false,
            processData: false
        });
    });
});
