
<div class="modal fade" id="edit-category" data-backdrop="static" data-keyboard="false" tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header primary-bg text-white">
                <h5 class="modal-title" id="staticBackdropLabel">Thoughts and Words - Edit Category</h5>
                <button type="button" class="close text-white" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form action="EditCategory" method="post" id="edit-form">
                <div class="modal-body">
                    <div class="card">
                        <div class="card-header primary-bg text-center text-white">
                            <i class="fa fa-tags" style="font-size: 4rem;"></i>
                            <h2>Enter Updated Category Details</h2>
                        </div>
                        <div id="msg"></div>
                        <div class="card-body">

                            <input type="hidden" id="id" name="id" value="">
                            <div class="form-group">
                                <label for="category">Category</label>
                                <input id="category" name="category" class="form-control" placeholder="Enter Category" value="">
                            </div>
                            <div class="form-group">
                                <label for="desc">Category</label>
                                <textarea id="desc" name="desc" class="form-control" placeholder="Enter Description"></textarea>
                            </div>
                            <input type="hidden" id="date" name="date" value="">
                            <input type="hidden" id="userid" name="userid" value="">
                        </div>

                    </div>
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-outline-success">Update Category</button>
                    <button type="button" class="btn btn-outline-secondary" data-dismiss="modal">Close</button>
                </div>
            </form>

        </div>
    </div>
</div>