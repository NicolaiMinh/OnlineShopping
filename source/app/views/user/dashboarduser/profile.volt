<?php
    use MyApp\Model\Countries;
    $county = new Countries;
?>
<form class="" id="updateProfile" method="post" action="/user/dashboarduser/profile" enctype="multipart/form-data">
    <div class="row">
        <div class="col-md-12">
            <section class="panel panel-featured panel-featured-warning">
                <header class="panel-heading">
                    <h2 class="panel-title">PROFILE PICTURE</h2>
                </header>
                <div class="panel-body">
                    <div class="form-group" style="padding-left: 15px">
                        <img alt="avatar" class="image" id="show-avatar" src="<?php echo empty($user -> avatar )? "/files/posts/avatar_agent.png" : $user -> avatar;?>" width="75" height="75">
                    </div>
                    <div class="form-group">
                        <div class="col-sm-3">
                            <input type="file" class="form-control" id="avatar" name="avatar" onchange="$('#show-avatar').prop('src', window.URL.createObjectURL(this.files[0]) == null ? '/{{user.avatar}}' : window.URL.createObjectURL(this.files[0]))">
                        </div>
                    </div><!-- /.form-group -->
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="">User ID<span>*</span></label>
                                <?php echo $registerForm->render('username', array('value' => $user->username));?>
                                <?php $messages = $registerForm->getMessagesFor('username');
                                    $messageShow = "";
                                    foreach ($messages as $message) {
                                        $messageShow .= $message;
                                    }
                                    echo $messageShow == ""? "": "<label class='error'>".$messageShow."</label>";
                                ?>
                            </div><!-- /.form-group -->

                            <div class="form-group">
                                <label for="">Full Name</label>
                                <?php echo $registerForm->render('display_name', array('value' => $user->display_name));?>
                            </div><!-- /.form-group -->

                            <div class="form-group">
                                <label for="">Số điện thoại</label>
                                <?php echo $registerForm->render('phone', array('value' => $user->phone));?>
                            </div><!-- /.form-group -->

                            <div class="form-group">
                                <label for="">Address</label>
                                <?php echo $registerForm->render('address', array('value' => $user->address));?>
                            </div><!-- /.form-group -->

                            <!--
                            <div class="form-group">
                                <label for="">Facebook</label>
                                <?php echo $registerForm->render('facebook', array('value' => $user->facebook));?>
                            </div>

                            <div class="form-group">
                                <label for="">Googleplus</label>
                                <?php echo $registerForm->render('googleplus', array('value' => $user->googleplus));?>
                            </div>
                            -->

                            <div class="form-group">
                                <input type="hidden" id="csrf" name="csrf" value="<?php echo $this->security->getToken(); ?>">
                                <?php $messages= $registerForm->getMessagesFor('csrf');
                                    $messageShow = "";
                                    foreach ($messages as $message) {
                                        $messageShow .= $message;
                                    }
                                    echo $messageShow == ""? "": "<label class='error'>".$messageShow."</label>";
                                ?>
                                <label for=""></label>
                                <button type="submit" class="btn btn-primary" id="btnSubmit" style="display: inline-block;">Save change</button>
                            </div>
                        </div>
                        <div class="col-md-6 ">
                        </div>
                    </div>
                </div>
            </section><!-- /.panel -->
        </div>
    </div>

</form>
<style>
    @media screen and (max-width: 768px) {
        .none-padding{
            padding-left: 0px;
            padding-right: 0px;
        }
    }
    form label span {
        color: red;
        font-weight: bold;
    }
</style>