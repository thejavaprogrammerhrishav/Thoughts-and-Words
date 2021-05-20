$(document).ready(function () {
    $('#err-msg').removeAttr("class").html("");
    $('.edit').click(function () {
        let id = $(this).attr('data-id');

        $.ajax({
            url: "TempCategory?id=" + id,
            type: 'GET',
            success: function (data, textStatus, jqXHR) {
                if (typeof data.msg === 'undefined') {
                    $('#edit-form #id').val(data.id);
                    $('#edit-form #category').val(data.category);
                    $('#edit-form #desc').html(data.description);
                    $('#edit-form #date').val(data.date);
                    $('#edit-form #userid').val(data.userId);

                    $('#edit-category').modal('toggle');
                } else{
                    console.log(data.msg);
                    window.location.reload();
                }
            }
        });
    });
    
    $('#serByCate').click(function(){
       var v=$('#search').val();
       if(v===''){
           $('#err-msg').removeAttr("class").html("");
           $('#err-msg').addClass("alert").addClass("alert-danger").html("Please Enter Any Category");
       }else{
           window.location.href="allcategory.jsp?t=c&s="+$('#search').val();
       }
    });
    
    $('#serByDesc').click(function(){
       var v=$('#search').val();
       if(v===''){
           $('#err-msg').removeAttr("class").html("");
           $('#err-msg').addClass("alert").addClass("alert-danger").html("Please Enter Any Description");
       }else{
           window.location.href="allcategory.jsp?t=d&s="+$('#search').val();
       }
    });
    
    $('#showAll').click(function(){
       window.location.href="allcategory.jsp";
    });
});