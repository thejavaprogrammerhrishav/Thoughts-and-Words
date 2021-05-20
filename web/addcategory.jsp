
<%@page import="com.hdsoft.techblog.utils.Message"%>
<%@page import="com.hdsoft.techblog.models.User"%>

<div class="modal fade" id="addCategory" data-backdrop="static" data-keyboard="false" tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header primary-bg text-white">
                <h5 class="modal-title ml-2" id="staticBackdropLabel">Thoughts and Words - Add Category</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form id="add-category" method="post">
                <div class="modal-body">
                    <div class="card">
                        <div class="card-header text-center text-white primary-bg">
                            <i class="fa fa-tags" style="font-size: 4rem;"></i>
                            <h3>Add New Category</h3>
                        </div>
                        <div id="msg"></div>
                        <div class="card-body">
                            <div class="form-group">
                                <label for="category">Category</label>
                                <input type="text" class="form-control" required id="category" name="category" placeholder="Enter Category">
                                <small id="emailHelp" class="form-text text-muted">Please try not to use any special characters</small>

                            </div>
                            <div class="form-group">
                                <label for="desc">Description</label>
                                <textarea id="desc" name="description" class="form-control" rows="3" cols="10" placeholder="Enter Description" required></textarea>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-outline-success px-5 mr-3">Add Category</button>
                    <button type="button" class="btn btn-outline-secondary px-4" data-dismiss="modal">Close</button>
                </div>
            </form>
        </div>
    </div>
</div>

<script src="js/category.js"></script>