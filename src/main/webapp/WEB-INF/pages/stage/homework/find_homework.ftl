<#include "../layout.ftl">
<@layout>
<head>
    <title>在线作业</title>
    <link href="/css/zui.min.css" rel="stylesheet">
    <link href="/css/zui.datatable.css" rel="stylesheet">
    <link href="/css/datetimepicker.css" rel="stylesheet">
</head>
<script src="/js/jquery-1.11.2.min.js"></script>
<script src="/js/zui.min.js"></script>
<script src="/js/zui.datatable.js"></script>
<script src="/js/datetimepicker.js"></script>
<script>
    $(document).ready(function () {
        var finish =${finish};
        if (finish == 0) {
            $("#notOver").addClass("active");
        }
        else {
            $("#over").addClass("active");
        }
    });
</script>

<div style="text-align: center">
    <ul class="nav nav-pills" style="float: right">
        <li class="tigger" id="notOver"><a href="/stage/homework/query?finish=0">待完成作业</a></li>
        <li class="tigger" id="over"><a href="/stage/homework/query?finish=1">已完成作业</a></li>
    </ul>
</div>
<div id="result">
    <table class="table table-bordered table-striped table-condensed">
        <caption style="text-align: left">
            <label class="label label-primary">作业列表</label>
        </caption>
        <thead>
        <tr>
            <th data-width="20">#</th>
            <th>课程名</th>
            <th>标题</th>
            <th>截止日期</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody>
            <#if Request.homeworks??>
                <#list Request.homeworks as item>
                <tr>
                    <td>${item.homeworkId}</td>
                    <td>${item.lessonName}</td>
                    <td><a href="/stage/homework/view?id=${item.homeworkId}&finish=${finish}">${item.homeworkName}</a>
                    </td>
                    <td>${item.deadline?string("yyyy-MM-dd")}</td>
                    <td>
                        <#if finish==0>
                            <a href="/stage/homework/view?id=${item.homeworkId}">查看</a>
                        <#else>
                            已提交
                        </#if>
                    </td>
                </tr>
                </#list>
            </#if>
        </tbody>
    </table>
</div>
</@layout>
<nav class="pager">
<@pager page=page/>
</nav>