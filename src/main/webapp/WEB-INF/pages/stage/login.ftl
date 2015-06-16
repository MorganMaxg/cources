<!DOCTYPE html>
<html>
<head>
    <title>Java程序设计精品课程网站</title>
    <link href="/css/zui.css" rel="stylesheet">
</head>
<body style="background-image: url('/image/back.jpg');background-size: 1000px 1000px">
<script src="/js/jquery-1.11.2.min.js"></script>
<div style="margin-top:200px;margin-left: 100px;">
    <img src="/image/title.jpg">

    <div style="float: right;background-color:#ffffff;margin-right: 150px;padding-left: 50px;padding-right: 80px"
         class="panel">
        <form role="role" action="/stage/login" method="post" style="padding-top:70px">
            <article style="text-align: center"><strong style="font-size: 14px">用户登录</strong></article>
            <div style="text-align: center"><b style="color: red">${ERROR!}</b></div>
            <div class="form-group" style="margin-top: 40px">
                <label class="col-lg-4  control-label required">学(工)号:</label>

                <div class="col-lg-8">
                    <input name="id" class="form-control" type="text" required="true" title="学号不能为空">
                </div>
            </div>
            <div class="form-group" style="padding-top: 60px">
                <label class="col-lg-4  control-label required">密码:</label>

                <div class="col-lg-8">
                    <input name="password" class="form-control" type="password" required="true" title="密码不能为空">
                </div>
            </div>
            <div class="form-group" style="padding-top: 60px;padding-bottom: 30px">
                <a href="/admin/login" class="btn btn-link" style="margin-left: 100px">后台登录</a>
                <input type="submit" value="登录" class="btn btn-primary">
            </div>
        </form>
    </div>
</div>

</body>
</html>