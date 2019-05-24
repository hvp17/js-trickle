<?php
session_start();
if (!$_SESSION['jUser']) {
    header('Location: login.php');
    exit;
}
require_once "components/top.php";
require_once __DIR__ . '/class/token.php';
?>
<div class="container">
    <div class="row my-2">
        <div class="col-lg-8 order-lg-2">
            <ul class="nav nav-tabs">
                <li class="nav-item">
                    <a href="" data-target="#profile" data-toggle="tab" class="nav-link active">Profile</a>
                </li>
                <li class="nav-item">
                    <a href="" data-target="#questions" data-toggle="tab" class="nav-link">Questions</a>
                </li>
                <li class="nav-item">
                    <a href="" data-target="#answers" data-toggle="tab" class="nav-link">Answers</a>
                </li>

                <li class="nav-item">
                    <a href="" data-target="#edit" data-toggle="tab" class="nav-link">Edit</a>
                </li>
            </ul>
            <div class="tab-content py-4">
                <div class="tab-pane active" id="profile">
                    <h5 class="mb-3">User Profile</h5>
                    <div class="row">
                        <div class="col-md-6">
                            <!-- PROFILE TAB 'user details' -->
                            <div id="user-details-container"></div>
                        </div>
                        <div class="col-md-6">
                            <!-- PROFILE TAB 'used tags' -->
                            <div class="used-tags-container"></div>
                            <hr>
                            <span class="badge badge-primary"><i class="fa fa-user"></i> 900 Followers</span>
                            <span class="badge badge-success"><i class="fa fa-cog"></i> 43 Forks</span>
                            <span class="badge badge-danger"><i class="fa fa-eye"></i> 245 Views</span>
                        </div>
                        <div class="col-md-12">
                            <h5 class="mt-2"><span class="fa fa-clock-o ion-clock float-right"></span> Recent Activity</h5>
                            <table class="table table-sm table-hover table-striped">
                                <tbody>
                                    <tr>
                                        <td>
                                            <strong>Abby</strong> joined ACME Project Team in <strong>`Collaboration`</strong>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <strong>Gary</strong> deleted My Board1 in <strong>`Discussions`</strong>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <strong>Kensington</strong> deleted MyBoard3 in <strong>`Discussions`</strong>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <strong>John</strong> deleted My Board1 in <strong>`Discussions`</strong>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <strong>Skell</strong> deleted his post Look at Why this is.. in <strong>`Discussions`</strong>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <!--/row-->
                </div>

                <!--Your Questions-->
                <div class="tab-pane" id="questions">
                    <div class="alert alert-info alert-dismissable">
                        <a class="panel-close close" data-dismiss="alert">×</a> This is an <strong>.alert</strong>. Use this to show important messages to the user.
                    </div>
                    <table class="table table-hover table-striped question-container" id="question-container">
                        <tbody>
                            <!-- QUESTION TAB 'questions container' -->
                        </tbody>
                    </table>
                </div>




                <!--Your Answers-->
                <div class="tab-pane" id="answers">
                    <div class="alert alert-info alert-dismissable">
                        <a class="panel-close close" data-dismiss="alert">×</a> This is an <strong>.alert</strong>. Use this to show important messages to the user.
                    </div>
                    <table class="table table-hover table-striped answer-container" id="answer-container">
                        <tbody>
                            <!-- ANSWERS TAB 'questions container' -->
                        </tbody>
                    </table>
                </div>





                <div class="tab-pane" id="edit">
                    <form role="form" class="profile-form-container" id="frmEdit">
                        <input type="hidden" name="token" value="<?= Token::generate() ?>">
                    </form>
                </div>
            </div>
        </div>

        <div class="col-lg-4 order-lg-1 text-center">
            <img src="" class="mx-auto img-fluid img-circle d-block" id="imgUser" alt="avatar">
            <h6 class="mt-2">Upload a different photo</h6>
            <label class="custom-file">
                <input type="file" name="file" id="file" accept="image/*" onchange="readURL(this);" class="custom-file-input fileToUpdate">

                <span class="custom-file-control" id="btnFile">Choose file</span>
            </label>
        </div>
    </div>
</div>

<?php
$sScript = 'profile.js';
require_once "components/bottom.php";
?>