<#include "../layout.ftl">
<@layout>
<html>
<head>
    <title>在线交流</title>
    <link href="/css/zui.min.css" rel="stylesheet">
    <link href="/css/zui.datatable.css" rel="stylesheet">
</head>
<body>
<script src="/js/jquery-1.11.2.min.js"></script>
<script src="/js/zui.datatable.js"></script>
<div>
    <form id="searchForm">
        <input type="text" id="pageNoInput" name="pageNo" class="hidden">
    </form>
</div>
<div style="text-align: center">
    <div id="tbody">
        <script>
            $(document).ready(
                    function () {
                        $("li.main").removeClass("active");
                        $("#talk").addClass("active");
                        var type =${type!};
                        if (type == 0) {
                            $("#allNotes").addClass("active");
                        }
                        if (type == 1) {
                            $("#myNotes").addClass("active");
                        }
                        $("a.delete").click(function (e) {
                            e.preventDefault();
                            if (confirm("确认删除?")) {
                                $.get($(this).attr("href"), {}, function (json) {
                                    var data = JSON.parse(json);
                                    if (data.success) {
                                        alert("删除成功");
                                        window.location.href = "/stage/talk/query?type=" + type;
                                    }
                                    else {
                                        alert("删除失败");
                                    }
                                })
                            }
                        });
                    }
            );
        </script>
        <div style="text-align: left">
            <a data-remote="/stage/talk/modify" class="btn btn-primary" data-toggle="modal">发帖</a>
            <#if Request.page??>
                当前第<i style="color: blue"> ${Request.page.pageNo} </i>页/共<i
                    style="color: blue"> ${Request.page.getTotalPages()} </i>
                </select>页
            </#if>
            <ul class="nav nav-pills" style="float: right">
                <li class="note" id="allNotes"><a href="/stage/talk/query?type=0">全部</a></li>
                <li class="note" id="myNotes"><a href="/stage/talk/query?type=1">我的帖子</a></li>
            </ul>
        </div>
        <table class="table table-hover table-striped " style="margin-top: 10px">
            <thead class="text-center">
            <caption style="text-align: left">
                <label class="label label-primary">帖子列表</label>
            </caption>
            <tr class="text-center hidden-xs">
                <th>#</th>
                <th>标题</th>
                <th data-wiuth="30" width="100">浏览次数</th>
                <th data-wiuth="30" width="100">回帖数</th>
                <th data-wiuth="30" width="100">发布人</th>
                <th width="200">发布日期</th>
                <th width="200">操作</th>
            </tr>
            </thead>
        <tbody>
            <#if Request.notes??>
                <#list Request.notes as note>
                <tr>
                    <td>${note.noteId!}</td>
                    <td>
                        <a href="/stage/talk/view?id=${note.noteId}">${note.title!}</a>
                    </td>
                    <td>${note.count!}</td>
                    <td>${note.currentFloor!}</td>
                    <td>${note.createrName!}</td>
                    <td>${note.createDate?string("yyyy-MM-dd HH:mm:ss")}</td>
                    <td>
                        <a href="/stage/talk/view?id=${note.noteId}" class="btn btn-link">查看</a>
                        <#if type==1>
                            | <a data-remote="/stage/talk/modify?id=${note.noteId}" class="btn btn-link"
                                 data-toggle="modal">修改</a>
                            | <a class="btn btn-link delete" href="/stage/talk/delete?id=${note.noteId}">删除</a>
                        </#if>
                    </td>
                </tr>
                </#list>
            </tbody>
            </#if>
        </table>
        <nav class="pager">
            <@pager page=page/>
        </nav>
    </div>
</div>
</body>
</html>
</@layout>