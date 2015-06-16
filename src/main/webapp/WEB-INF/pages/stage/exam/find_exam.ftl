<#include "../layout.ftl">
<@layout>
<head>
    <title>在线考试</title>
    <link href="/css/zui.min.css" rel="stylesheet">
    <link href="/css/zui.datatable.css" rel="stylesheet">
    <link href="/css/datetimepicker.css" rel="stylesheet">
</head>
<body>
<script src="/js/jquery-1.11.2.min.js"></script>
<script src="/js/zui.min.js"></script>
<script src="/js/zui.datatable.js"></script>
<script src="/js/datetimepicker.js"></script>
<script>
    $(document).ready(
            function () {
                $("th").attr("style", "text-align:center");
                $("tr").attr("style", "text-align:center");
                $("li").removeClass("active");
                $("#exam").addClass("active");

                $(".startExamBtn").click(function (e) {
                    if (!confirm("确定参加考试?")) {
                        e.preventDefault();
                        return;
                    }
                });
            }
    );
</script>
<table class="table table-bordered table-striped table-condensed table-hover">
    <caption style="text-align: left">
        <label class="label label-primary">考试列表</label>
    </caption>
    <thead>
    <tr>
        <th data-width="20">#</th>
        <th>考试名称</th>
        <th>课程名称</th>
        <th>考试开始时间</th>
        <th>考试截止时间</th>
        <th>操作</th>
    </tr>
    </thead>
    <tbody>
        <#if Request.exams??>
            <#list Request.exams as item>
            <tr>
                <td>${item.examId}</td>
                <td>${item.examTitle}</td>
                <td>${item.lessonName}</td>
                <td>${item.startTime?string("yyyy-MM-dd HH:mm:ss")}</td>
                <td>${item.deadline?string("yyyy-MM-dd HH:mm:ss")}</td>
                <td>
                    <form action="/stage/exam/examing" method="post">
                        <input type="hidden" value="${item.examId}" name="examId">
                        <#if item.time<0>
                            未开始
                        <#else>
                            <button class="btn-sm btn btn-danger startExamBtn">开始考试</button>
                        </#if>
                    </form>
                </td>
            </tr>
            </#list>
        </#if>
    </tbody>
</table>
</body>
</@layout>