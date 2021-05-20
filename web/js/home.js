function searchtxt(){
    let val=$('#searchtxt').val();
    
    window.location.href="home.jsp?search="+val;
}

function searchDate(){
    let val=$('#searchtxtdate').val();
    window.location.href="home.jsp?date="+val;
}

function searchauth(){
    let val=$("#searchtxt").val();
    window.location.href="home.jsp?auth="+val;
}

function searchCategory(){
     let val=$("#categorySel").val();
    window.location.href="home.jsp?cate="+val;
}