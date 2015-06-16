<#include "../layout.ftl">
<@layout>
<head>
    <title>成绩查询</title>
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
                $("#grade").addClass("active");
                $("#totalGrade").addClass("active");
                $("li.grade").click(function (e) {
                    e.preventDefault();
                    $("li.grade").removeClass("active");
                    $(this).addClass("active");
                    $.get($(this).find("a").attr("href"), {}, function (data) {
                        $("#result").replaceWith($(data).find("#result"));
                    });
                });
            }
    );
</script>
<ul class="nav nav-pills">
    <li class="grade" id="totalGrade"><a href="/stage/grade/query?type=0">总成绩查询</a></li>
    <li class="grade"><a href="/stage/grade/query?type=1">考试成绩查询</a></li>
    <li class="grade"><a href="/stage/grade/query?type=2">作业成绩查询</a></li>
</ul>
<div id="result" style="margin-top: 20px">
    <#if Request.exams??>
        <table class="table table-bordered table-striped table-condensed table-hover">
            <caption style="text-align: left">
                <label class="label label-primary">考试成绩列表</label>
            </caption>
            <thead>
            <tr>
                <th data-width="20">#</th>
                <th>考试名称</th>
                <th>课程名称</th>
                <th>成绩</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>

                <#list Request.exams as item>
                <tr>
                    <td>${item.examId!}</td>
                    <td>${item.examTitle!}</td>
                    <td>${item.lessonName!}</td>
                    <td>${item.score!}</td>
                    <td>
                        <a href="/stage/grade/view?examId=${item.examId}">查看</a>
                    </td>
                </tr>
                </#list>

            </tbody>
        </table>
    </#if>
    <#if Request.homeworks??>
        <table class="table table-bordered table-striped table-condensed table-hover">
            <caption style="text-align: left">
                <label class="label label-primary">作业成绩列表</label>
            </caption>
            <thead>
            <tr>
                <th data-width="20">#</th>
                <th>作业名称</th>
                <th>成绩</th>
            </tr>
            </thead>
            <tbody>
                <#list Request.homeworks as item>
                <tr>
                    <td>${item.homeworkId!}</td>
                    <td>${item.homeworkName!}</td>
                    <td>${item.score!}</td>
                </tr>
                </#list>
            </tbody>
        </table>
    </#if>
    <#if Request.lessons??>
        <table class="table table-bordered table-striped table-condensed table-hover">
            <caption style="text-align: left">
                <label class="label label-primary">总成绩列表</label>
            </caption>
            <thead>
            <tr>
                <th data-width="20">#</th>
                <th>课程名称</th>
                <th>成绩</th>
            </tr>
            </thead>
            <tbody>
                <#list Request.lessons as item>
                <tr>
                    <td>${item.id!}</td>
                    <td>${item.name!}</td>
                    <td>${item.score!}</td>
                </tr>
                </#list>
            </tbody>
        </table>
    </#if>
    <#if Request.page??>
        <nav class="pager">
            <@pager page=page/>
        </nav>
    </#if>
</div>
</body>
</@layout>