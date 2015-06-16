<#include "../layout.ftl">
<@layout>
<head>
    <title>查看帖子</title>
    <link href="/css/zui.min.css" rel="stylesheet">
    <link href="/css/zui.datatable.css" rel="stylesheet">
</head>
<body>
<script src="/js/jquery-1.11.2.min.js"></script>
<script>
    $(document).ready(function () {
//        alert(1);
    });
</script>
<div class="list">
    <header>
        <h3><i class="icon-list-ul icon-border-circle"></i> 跟帖列表 &nbsp;
            <small>共 帖</small>
        </h3>
    </header>
    <section class="items items-hover">
        <div class="item">
            <div class="item-heading">
                <div class="pull-right"><a class="btn btn-link" data-toggle="modal"
                                           data-remote="/stage/talk/comment?id=${note.noteId!}"><i
                        class="icon-reply"></i> 回帖</a> &nbsp;</div>
                <h4><span class="label label-success icon-2x">主贴</span>&nbsp; <strong>标题:${note.title!}</strong></h4>
            </div>
            <div class="item-content">
                内容: ${note.content!}
            </div>
            <div class="item-footer">
                <i class="icon-comments"></i> ${note.currentFloor!}&nbsp;
                <span class="text-muted"><i
                        class="icon-time"></i>${note.createDate?string("yyyy-MM-dd HH:mm:ss")!}</span>
            </div>
        </div>
        <#if Request.comments??>
            <#list Request.comments as  item>
                <div class="item">
                    <div class="item-heading">
                        <div class="pull-right"><span class="label"># ${item.floor!}</span> &nbsp;</div>
                        <h4><i class="icon-comment-alt icon-2x"></i>&nbsp; <i class="icon-user">${item.createrName!}</i>
                        </h4>
                    </div>
                    <div class="item-content">
                        内容:${item.content!}
                    </div>
                    <div class="item-footer">
                        <span class="text-muted"><i
                                class="icon-time"></i>${item.createDate?string("yyyy-MM-dd HH:mm:ss")}</span>
                    </div>
                </div>
            </#list>
        </#if>
        <nav class="pager">
            <@pager page=page/>
        </nav>
    </section>
</div>
</body>
</@layout>