var showingSourceCode = false;
var isInEditMode = true;
var fileCount = 0;

$(document).ready(function () {
    enableEditMode();
    $('#totalFiles').val(""+fileCount);
    $('#addFile').click(function () {
        fileCount++;
        $('#fileList').append("<li class=\"list-group-item p-0 file-input\">"
                + "     <div class=\"custom-file\">"
                + "         <input type=\"file\" class=\"custom-file-input\" id=\"customFile" + fileCount + "\" name=\"customFile"+fileCount+"\">"
                + "         <label class=\"custom-file-label\" for=\"customFile" + fileCount + "\">Choose file</label>"
                + "     </div>"
                + "</li>");
        
        $("#customFile" + fileCount).on("change", function () {
            var fileName = $(this).val().split("\\").pop();
            $(this).siblings(".custom-file-label").addClass("selected").html(fileName);
        });
        $('#totalFiles').val(fileCount);
    });
    
    $('#clearFiles').click(function (){
        $('#fileList').html("");
    });
    
    $('#postForm').on('submit',function(evt){
        evt.preventDefault();
        $('#postContent').val(content.document.getElementsByTagName('body')[0].innerHTML.toString());
        
        $('#savePost').val("Saving.... Please Wait...");
        $('#savePost').attr("disabled",true);
        
        let form=new FormData(this);
        
        $.ajax({
           url: "NewPost",
           type: 'POST',
           data: form,
           contentType: false,
           processData: false,
           enctype: 'multipart/form-data',
           success: function (data, textStatus, jqXHR) {
                if(data.trim()==='done'){
                     $('#savePost').val("Save Post");
                     $('#savePost').attr("disabled",false);
                    
                    swal({
                                title: "Add New Post",
                                text: "Post Saved Successfully",
                                icon: "success",
                                button: "Close",
                            }).then((val) => {
                                window.location = "profile.jsp"
                            });
                            
                }else{
                    swal({
                                title: "Failed To Add Post!",
                                text: data.trim(),
                                icon: "warning",
                                button: "Close",
                            });
                }
            },
            error: function (data, textStatus, errorThrown) {
                swal({
                                title: "Failed To Add Post!",
                                text: data.trim(),
                                icon: "error",
                                button: "Close",
                            });
            }
        });
    });
    
});

function enableEditMode() {
    content.document.designMode = 'On';
}

function execCmd(command) {
    content.document.execCommand(command, false, null);
}

function execCommandWithArg(command, arg) {
    content.document.execCommand(command, false, arg);
}

function toggleSource() {
    if (showingSourceCode) {
        content.document.getElementsByTagName('body')[0].innerHTML = content.document.getElementsByTagName('body')[0].textContent;
        showingSourceCode = false;
    } else {
        content.document.getElementsByTagName('body')[0].textContent = content.document.getElementsByTagName('body')[0].innerHTML;
        showingSourceCode = true;
    }
}

function toggleEdit() {
    if (isInEditMode) {
        content.document.designMode = 'Off';
        isInEditMode = false;
    } else {
        content.document.designMode = 'On';
        isInEditMode = true;
    }
}