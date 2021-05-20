$(document).ready(function () {
$('#signupForm').on('submit', function (evt) {
        evt.preventDefault();
        let form = new FormData(this);
        $.ajax({
                url: "Register",
                type: 'POST',
                data: form,
                success: function (data, status, err) {
                    
                    if (data.trim() === 'User Saved Successfully'){
                        swal({
                                title: "User Registered Successfully!",
                                text: "User Can Login Now",
                                icon: "success",
                                button: "Go To Login",
                            }).then((val) => {
                                window.location = "login.jsp"
                            });
                    }else{
                        swal({
                                title: "User Registration Failed",
                                text: data.trim().toString(),
                                icon: "warning",
                                buttons: true,
                            });
                    }
                },
                error: function (data, status, err) {
                    swal({
                        title: "Error Occurred",
                            text: data,
                            icon: "error",
                            buttons: true,
                            dangerMode: true,
                    });
                },
                processData: false,
                contentType: false
        });
        });
});