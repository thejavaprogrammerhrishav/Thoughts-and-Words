function comment(userid, postid, date, time) {
    let cval = $('#commenttxt').val();
    $.ajax({
        url: "CommentPost?userid=" + userid + "&postid=" + postid + "&date=" + date + "&time=" + time + "&comment=" + cval,
        type: 'POST',
        success: function (data, status, err) {
            if (data.trim() === 'OK') {
                swal({
                    title: "Add New Comment",
                    text: "Comment Added Successfully",
                    icon: "success",
                    button: "Close"
                }).then((val) => {
                    window.location.href = "post.jsp?post=" + postid;
                });
            } else {
                swal({
                    title: "Add New Comment",
                    text: "Comment Addition Failed",
                    icon: "error",
                    button: "Close"
                });
            }
        },
        error: function (data, status, err) {
            swal({
                title: "Add New Post",
                text: data,
                icon: "error",
                button: "Close"
            });
        },
        contentType: false,
        processData: false
    });
}

function reply(commentid, postid) {
    let cval = $('#replytxt' + commentid).val();
    $.ajax({
        url: "CommentReply?commentid=" + commentid + "&reply=" + cval,
        type: 'POST',
        success: function (data, status, err) {
            if (data.trim() === 'Updated') {
                window.location.href = "post.jsp?post=" + postid;
            } else {
                swal({
                    title: "Comment Reply",
                    text: data.trim(),
                    icon: "error",
                    button: "Close"
                });
            }
        },
        error: function (data, status, err) {
            swal({
                title: "Comment Reply",
                text: data.trim(),
                icon: "error",
                button: "Close"
            });
        },
        contentType: false,
        processData: false
    });
}

