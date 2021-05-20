
function like_dislike(id) {
    $.ajax({
        url: "LikePost?id=" + id,
        type: 'POST',
        success: function (data, status, err) {
            console.log(data);
            let d = data.trim();
            if (d === 'User Null') {
                swal({
                    title: "Like Post",
                    text: "No User Found or Invalid User ID",
                    icon: "error",
                    buttons: true,
                });
            } else if (d === 'Invalid ID') {
                swal({
                    title: "Like Post",
                    text: "No Post Found or Invalid Post ID",
                    icon: "error",
                    buttons: true,
                });
            } else {
                let dd = d.split(';');
                let count = dd[1].trim();

                let act = dd[0].trim();

                if (act === 'likedfailed') {
                    swal({
                        title: "Like Post",
                        text: "Post Like Failed",
                        icon: "error",
                        buttons: true,
                    });
                } else if (act === 'dislikefailed') {
                    swal({
                        title: "Like Post",
                        text: "Post Dislike Failed",
                        icon: "error",
                        buttons: true,
                    });
                }else{
                    if(act==='liked'){
                        $('#likebtn'+id).removeClass("btn-outline-primary").addClass("btn-primary");
                        $('#liketext'+id).html("Liked");
                        
                        $('#likebtn1'+id).removeClass("btn-outline-primary").addClass("btn-primary");
                        $('#liketext1'+id).html("Liked");
                                            }
                    else{
                        $('#likebtn'+id).removeClass("btn-primary").addClass("btn-outline-primary");
                        $('#liketext'+id).html("Like");   
                        
                         $('#likebtn1'+id).removeClass("btn-primary").addClass("btn-outline-primary");
                        $('#liketext1'+id).html("Like"); 
                       
                    }
                    document.getElementById("count"+id).innerHTML=count;
                    document.getElementById("count1"+id).innerHTML=count;
                }
            }
        },
        error: function (data, status, err) {
            swal({
                title: "Like Post",
                text: data.trim().toString(),
                icon: "warning",
                buttons: true,
            });
        },
        contentType: false,
        processData: false
    });
}

