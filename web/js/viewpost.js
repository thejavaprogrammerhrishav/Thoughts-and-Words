function goToPost(e) {
    window.location.href = "post.jsp?post=" + e;
}

function deletePost(e) {
    window.location.href = "DeletePost?rem=" + e;
}

function search(e) {
    let val = $('#search').val();

    window.location.href = "profile.jsp?type=" + e + "&search=" + val + "&vtype=0";
}

function searcht(e) {
    let val = $('#tsearch').val();
    window.location.href = "profile.jsp?type=" + e + "&search=" + val + "&vtype=1";

}

function changeClass(id) {
    if (id === -1) {
        window.location.href = "profile.jsp";
    } else {
        window.location.href = "profile.jsp?category=" + id;
    }
}

function dateSearch() {
    let date = $('#searchDate').val();
    window.location.href = "profile.jsp?date=" + date + "&vtype=0";
}


function tdateSearch() {
    let date = $('#tsearchDate').val();
    window.location.href = "profile.jsp?date=" + date + "&vtype=1";
}