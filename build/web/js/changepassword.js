
$(document).ready(function () {
    $('#resetPassword').on('submit', function (e) {
        e.preventDefault();

        let formData = new FormData(this);

        $.ajax({
            url: "ChangePassword",
            type: 'POST',
            data: formData,
            success: function (data, status, err) {
            
                if (data.trim() === "Success") {
                     swal({
                                title: "Change Password",
                                text: "Password Changed Successfully",
                                icon: "success",
                                button: "Close",
                            }).then((val) => {
                                window.location = "myprofile.jsp"
                            });
                } else {
                      swal({
                                title: "Change Password",
                                text: "Password Not Changed",
                                icon: "danger",
                                button: "Close",
                            }).then((val) => {
                                window.location = "myprofile.jsp"
                            });
                }

            },
            error: function (data, status, err) {
                $('#msg').removeAttr("class");
                $('#msg').addClass("alert").addClass("alert-danger");
                $('#msg').html(data.toString());
            },
            contentType: false,
            processData: false
        });
    });
});
