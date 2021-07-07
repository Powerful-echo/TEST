<?php /*a:3:{s:70:"/home/ahboli6a7hdbpo8lwi/wwwroot/app/qingadmin/view/standard/edit.html";i:1584671486;s:68:"/home/ahboli6a7hdbpo8lwi/wwwroot/app/qingadmin/view/public/head.html";i:1591089971;s:68:"/home/ahboli6a7hdbpo8lwi/wwwroot/app/qingadmin/view/public/foot.html";i:1591183190;}*/ ?>
<!--包含头部文件-->
<!DOCTYPE HTML>

<html>

<head>

<meta charset="utf-8">

<meta name="renderer" content="webkit|ie-comp|ie-stand">

<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">

<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />

<meta http-equiv="Cache-Control" content="no-siteapp" />

<link rel="Bookmark" href="/favicon.ico" >

<link rel="Shortcut Icon" href="/favicon.ico" />

<!--[if lt IE 9]>

<script type="text/javascript" src="lib/html5shiv.js"></script>

<script type="text/javascript" src="lib/respond.min.js"></script>

<![endif]-->

<link rel="stylesheet" type="text/css" href="/public/static/admin/static/h-ui/css/H-ui.min.css" />

<link rel="stylesheet" type="text/css" href="/public/static/admin/static//h-ui.admin/css/H-ui.admin.css" />

<link rel="stylesheet" type="text/css" href="/public/static/admin/lib/Hui-iconfont/1.0.8/iconfont.css" />

<link rel="stylesheet" type="text/css" href="/public/static/admin/static/h-ui.admin/skin/default/skin.css" id="skin" />

<link rel="stylesheet" type="text/css" href="/public/static/admin/static/h-ui.admin/css/style.css" />

<link rel="stylesheet" type="text/css" href="/public/static/admin/css/common.css" />


<script type="text/javascript" src="/public/static/admin/lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="/public/static/admin/layui/layui.js"></script> 

<title>后台管理系统</title>



</head>

<body>


<div class="cl pd-5 bg-1 bk-gray mt-20"> 修改属性 <span class="tishi">删除属性操作请慎重，删除属性会导致拥有该属性的商品无法筛选</span></div>
<article class="page-container">
  <form class="form form-horizontal" id="form-article-add" method="post" action="<?php echo url('update'); ?>" enctype="multipart/form-data" >
    <div class="row cl">
      <label class="form-label col-xs-4 col-sm-2">属性名称：</label>
      <div class="formControls col-xs-8 col-sm-6">
        <input type="text" class="input-text" value="<?php echo htmlentities($standardData['name']); ?>" name="name" required>
        <input type="hidden" class="input-text" value="<?php echo htmlentities($standardData['id']); ?>"  name="standard_id">
        <input type="hidden" class="input-text" value="<?php echo htmlentities($standardData['type_id']); ?>"  name="type_id">
      </div>
    </div>

    <?php if(is_array($attrData) || $attrData instanceof \think\Collection || $attrData instanceof \think\Paginator): $i = 0; $__LIST__ = $attrData;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>
    <div class="row cl">
      <label class="form-label col-xs-4 col-sm-2">属性值：</label>
      <div class="formControls col-xs-8 col-sm-6">
        <div class="l standard_value_box">
          <input type="text" class="input-text" value="<?php echo htmlentities($vo['standard_value']); ?>" name="standard_value" required>
          <input type="hidden" class="input-text" value="<?php echo htmlentities($vo['id']); ?>" name="id" required>
        </div>
        <div class="l btn100" style="color: #5a98de;" onclick="updateStandValue(this)">更新</div>
        <div class="l btn100" style="color: #f00;" onclick="deleteStandValue(this)">删除</div>
      </div>
    </div>
    <?php endforeach; endif; else: echo "" ;endif; ?>

    <div class="row cl">
      <label class="form-label col-xs-4 col-sm-2">属性值：</label>
      <div class="formControls col-xs-8 col-sm-6">
        <div class="l standard_value_box"><input type="text" class="input-text l" value="" name="standard_value"></div>
        <div class="l" style="margin-left: 15px;" onclick="addStandValue(this)">+添加</div>
      </div>
    </div>


  </form>
</article>
<style>
  .btn100{
    cursor: pointer;
    margin-left: 15px;
  }
</style>
<!--包含头部文件-->
<!--_footer 作为公共模版分离出去-->



<script type="text/javascript" src="/public/static/admin/lib/layer/2.4/layer.js"></script>

<script type="text/javascript" src="/public/static/admin/static/h-ui/js/H-ui.min.js"></script>

<script type="text/javascript" src="/public/static/admin/static/h-ui.admin/js/H-ui.admin.js"></script> 







<script type="text/javascript" src="/public/static/admin/lib/ueditor/1.4.3/ueditor.config.js"></script>

<script type="text/javascript" src="/public/static/admin/lib/ueditor/1.4.3/ueditor.all.min.js"> </script>

<script type="text/javascript" src="/public/static/admin/lib/ueditor/1.4.3/lang/zh-cn/zh-cn.js"></script>

<script src="/public/static/admin/lib/My97DatePicker/4.8/WdatePicker.js"></script>



<script src="/public/static/admin/js/common.js"></script><!-- 后台公共自定义js -->




<script type="text/javascript" src="__STATIC__/admin/hui/lib/ueditor/1.4.3/ueditor.config.js"></script>
<script type="text/javascript" src="__STATIC__/admin/hui/lib/ueditor/1.4.3/ueditor.all.min.js"> </script>
<script type="text/javascript" src="__STATIC__/admin/hui/lib/ueditor/1.4.3/lang/zh-cn/zh-cn.js"></script>
<script src="__STATIC__/admin/hui/lib/My97DatePicker/WdatePicker.js"></script>

<script>

  function addStandValue(a){
    var standard_id=$("input[name='standard_id']").val();//standard_id
    var standard_value=$(a).parent().children('.standard_value_box').children().val();//standard_value
    if(standard_value.length==0){
      alert('请填写属性值');
      return false;
    }
    url ="/qingadmin/standard/add_standard_value";
    postData = {'standard_id':standard_id,'standard_value':standard_value};
    $.post(url,postData,function(result){
      if(result.status==1){
        alert('添加成功');
        location.reload();
      }
    }, 'json');
  }

  function updateStandValue(a){
    var standard_value=$(a).parent().children('.standard_value_box').children("input[name='standard_value']").val();//standard_value
    var id=$(a).parent().children('.standard_value_box').children("input[name='id']").val();//id
    if(standard_value.length==0){
      alert('请填写属性值');
      return false;
    }
    url ="/qingadmin/standard/update_standard_value";
    postData = {'id':id,'standard_value':standard_value};
    $.post(url,postData,function(result){
      if(result.status==1){
        alert('更新成功');
      }
    }, 'json');
  }

  function deleteStandValue(a){
    var id=$(a).parent().children('.standard_value_box').children("input[name='id']").val();//id
    url ="/qingadmin/standard/delete_standard_value";
    postData = {'id':id};
    $.post(url,postData,function(result){
      if(result.status==1){
        location.reload();
      }
    }, 'json');
  }

</script>
</body>
</html>