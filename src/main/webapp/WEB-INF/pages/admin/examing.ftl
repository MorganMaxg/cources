<%
Lis
%>
<form class="form-horizontal form-condensed" role="form" method="post">
    <div class="form-group">
        <label class="col-md-2 control-label required">题目类型</label>

        <div class="col-md-4">

        </div>
    </div>

    <div class="form-group">
        <label class="col-md-2 control-label">作者</label>

        <div class="col-md-4">
            <input type="text" name="author" id="author" value="demo" class="form-control">
        </div>
    </div>

    <div class="form-group">
        <label class="col-md-2 control-label">创建日期</label>

        <div class="col-md-4">
            <div class="input-group">
                <input type="text" name="date" id="date" value="2013-2-13" class="form-control">
                <span class="input-group-btn"> <button class="btn btn-default" type="button">田</button> </span>
            </div>
        </div>
    </div>


    <div class="form-group">
        <label class="col-md-2 control-label">来源</label>

        <div class="col-md-4">
            <select name="original" id="original" class="form-control">
                <option value="1" selected="selected">原创</option>
                <option value="0">转贴</option>
            </select>
        </div>
        <div id="copyBox">
            <div class="col-md-2"><input type="text" name="copySite" id="copySite" value="" class="form-control"
                                         placeholder="来源网站"></div>
            <div class="col-md-3"><input type="text" name="copyURL" id="copyURL" value="" class="form-control"
                                         placeholder="来源URL"></div>
        </div>
    </div>

    <div class="form-group">
        <label class="col-md-2 control-label">标题</label>

        <div class="col-md-10 has-error">
            <input type="text" name="title" id="title" value="" class="form-control" placeholder="">

            <div class="help-block alert alert-warning">标题不能为空</div>
        </div>
    </div>

    <div class="form-group">
        <label class="col-md-2 control-label">英文别名</label>

        <div class="col-md-10">
            <div class="input-group">
                <span class="input-group-addon">http://demo.chanzhi.org/article/id@</span>
                <input type="text" name="alias" id="alias" value="" class="form-control">
                <span class="input-group-addon">.html</span>
            </div>
        </div>
    </div>

    <div class="form-group">
        <label class="col-md-2 control-label">关键字</label>

        <div class="col-md-10">
            <input type="text" name="keywords" id="keywords" value="" class="form-control">
        </div>
    </div>

    <div class="form-group">
        <label class="col-md-2 control-label">摘要</label>

        <div class="col-md-10">
            <textarea name="summary" id="summary" rows="2" class="form-control"></textarea>
        </div>
    </div>

    <div class="form-group">
        <label class="col-md-2 control-label">内容</label>

        <div class="col-md-10">
            <textarea name="content" id="content" rows="10" class="form-control"></textarea>
        </div>
    </div>

    <div class="form-group">
        <label class="col-md-2 control-label">保存为</label>

        <div class="col-md-10">
            <label class="radio-inline"> <input type="radio" name="optionsRadios" value="option1" checked=""> 草稿
            </label>
            <label class="radio-inline"> <input type="radio" name="optionsRadios" value="option2"> 私人 </label>
            <label class="radio-inline"> <input type="radio" name="optionsRadios" value="option2"> 公开 </label>
        </div>
    </div>

    <div class="form-group">
        <div class="col-md-offset-2 col-md-10">
            <input type="submit" id="submit" class="btn btn-primary" value="保存" data-loading="稍候..."> <input
                type="hidden" name="type" id="type" value="article">
        </div>
    </div>
</form>