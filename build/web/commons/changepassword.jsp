

<div class="modal" id="changePassword" data-backdrop="static" data-keyboard="false" tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg modal-dialog-centered">

        <div class="modal-content">
            <div class="modal-header primary-bg pl-3 pt-3">
                <h5 class="modal-title text-white" id="staticBackdropLabel">Thoughts and Words - Change Password</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form  id="resetPassword" action="" method="POST">
                <div class="modal-body p-3">

                    <div class="card m-0 p-0"> 
                        <div class="card-header primary-bg text-center text-white">
                            <i class="fa fa-lock" style="font-size: 5rem;"></i>
                            <h3>Choose A New Password</h3>
                        </div>
                        <div class="card-body">
                            <div class="form-group">
                                <label for="chpassword">New Password</label>
                                <input class="form-control" id="chpassword" name="newPassword" placeholder="Enter New Password">
                            </div>
                            <div class="form-group mt-4">
                                <label for="chconpassword">Confirm Password</label>
                                <input class="form-control" id="chconpassword" name="conPassword" placeholder="Confirm Password">
                            </div>
                        </div>
                    </div>

                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-outline-primary px-5">Change Password</button>
                    <button type="button" class="btn btn-outline-secondary px-4" data-dismiss="modal">Close</button>
                </div>
            </form>
        </div>

    </div>
</div>