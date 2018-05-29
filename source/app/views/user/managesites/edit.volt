<div class="content animate-panel">
    <div class="row">
        <div class="hpanel">
            <div class="panel-body">
                <form class="form-horizontal" method="post" id="addSite" action="/user/managesites/edit/{{data.id}}">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">Site Name</label>
                        <div class="col-sm-6">
                            <input name="site_name" value="{{data.site_name}}" type="text" class="form-control" id="site_name" maxlength="100">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">Layout</label>
                        <div class="col-sm-4">
                            <select name="layout_types" class="form-control" id="layout_types">
                                <?php foreach ($layouts as $item) {?>
                                    <option value="{{item.id}}">{{item.name}}</option>
                                <?php }?>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">Sub Domain</label>
                        <div class="col-sm-2">
                            <input name="sub_domain" type="text" class="form-control" id="sub_domain" maxlength="50" value="{{data.subdomain}}" placeholder="">
                        </div>
                        <label class="col-sm-4 control-label" style="text-align: left">.<?php echo DOMAIN_NAME;?></label>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">Domain</label>
                        <div class="col-sm-2">
                            <div class="checkbox">
                                <label>
                                    <input type="checkbox" value="1" name="use_domain" <?php echo $data -> use_domain == 1 ? "checked" : ""  ?> id="use_domain">Use other domain
                                </label>
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <input name="domain" value = "{{data.domain}}" type="text" class="form-control" id="domain" maxlength="50" placeholder="">
                        </div>
                    </div>
                     <div class="form-group">
                        <label class="col-sm-2 control-label">Email</label>
                        <div class="col-sm-6">
                            <input name="email" value = "{{data.email}}" type="text" class="form-control" id="email" maxlength="100" placeholder="">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">Phone</label>
                        <div class="col-sm-6">
                            <input name="phone" value = "{{data.phone}}" type="text" class="form-control" id="phone" maxlength="15" placeholder="">
                        </div>
                    </div>
                     <div class="form-group">
                        <label class="col-sm-2 control-label">Facebook</label>
                        <div class="col-sm-6">
                            <input name="facebook" value = "{{data.facebook}}" type="text" class="form-control" id="facebook">
                        </div>
                    </div>
                     <div class="form-group">
                        <label class="col-sm-2 control-label">Googleplus</label>
                        <div class="col-sm-6">
                            <input name="googleplus" value = "{{data.googleplus}}" type="text" class="form-control" id="googleplus">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label"></label>
                        <div class="col-sm-6">
                            <button class="btn btn-primary" type="submit" id="btnSubmit">Save</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<script>
    var siteId = <?php echo $data -> id;?>;
</script>
<script language="javascript" src="/js/jquery.validate.min.js" type="text/javascript"></script>
<script language="javascript" src="/admin/scripts/sites/site.js" type="text/javascript"></script>


