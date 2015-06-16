<#include "../layout.ftl">
<@layout>
<html>
<head>
    <title>查看通知</title>
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

                        $("th").attr("style", "text-align:center");
                        $("tr").attr("style", "text-align:center");
                        $("li").removeClass("active");
                        $("#message").addClass("active");

                    }
            );
        </script>
        <script>
            $(function () {
                $("#pageSelector").on("change", function (e) {
                    e.preventDefault();
                    var value = $("#pageSelector").val();
                    $("#pageNoInput").attr("value", value);
                    $.get("/stage/inform/message/query", $("#searchForm").serialize(), function (data) {
                        $("#tbody").replaceWith($(data).find("#tbody"));
                        $("#pageSelector").val(value);
                    });
                });
            });
        </script>
        <div style="text-align: right;padding-right: 50px">
            <#if Request.page??>
                当前第<i style="color: blue"> ${Request.page.pageNo} </i>页/共<i
                    style="color: blue"> ${Request.page.getTotalPages()} </i> 页
                跳转至:第<select id="pageSelector" name="pageNo">
                <#list 1..Request.page.getTotalPages() as k>
                    <option value="${k}">${k}</option>
                </#list>
            </select>页
            </#if>
        </div>
        <table class="table datatable table-condensed table-striped table-bordered">
            <thead class="text-center">
            <caption style="text-align: left">
                <label class="label label-primary">通知列表</label>
            </caption>
            <tr>
                <th data-wiuth="30">#</th>
                <th>通知标题</th>
                <th>发布人</th>
                <th>发布日期</th>
                <th>操作</th>
            </tr>
            </thead>
        <tbody>
            <#if Request.messages??>
                <#list Request.messages as message>
                <tr>
                    <td>${message.messageId}</td>
                    <td>
                        <a data-remote="/stage/inform/message/more?messageId=${message.messageId}"
                           data-toggle="modal">${message.title}</a>
                    </td>
                    <td>${message.teacherName}</td>
                    <td>${message.createDate?string("yyyy-MM-dd")}</td>
                    <td>
                        <a data-remote="/stage/inform/message/more?messageId=${message.messageId}" data-toggle="modal">详细信息</a>
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