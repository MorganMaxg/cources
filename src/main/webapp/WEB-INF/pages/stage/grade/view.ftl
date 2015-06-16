<!DOCTYPE html>
<#include "../layout.ftl">
<@layout>
<html>
<head>
    <title>查看考试成绩细节</title>
    <link href="/css/zui.min.css" rel="stylesheet">
    <link href="/css/zui.datatable.css" rel="stylesheet">
</head>
<body>
<script src="/js/jquery-1.11.2.min.js"></script>
<script src="/js/zui.min.js"></script>
<script src="/js/zui.datatable.js"></script>
<script>
    $(document).ready(function () {
        if (${page.pageNo}==1
        )
        {
            $("#prevBtn").addClass("hidden");
        }
        if (${page.pageNo}==${page.getTotalPages()}) {
            $("#nextBtn").addClass("hidden");
        }
    });
</script>
<div class="container">
    <div class="panel">
        <div class="panel panel-primary" style="float: left;width: 80%;margin-right: 11px">
            <div class="panel-heading"><strong>考试题目</strong></div>
            <div class="panel-body">
                <div class="panel">
                    <div style="width: 50%;float: left;height: 60px">
                        当前第<i style="color: red"> ${page.pageNo!} </i>道,
                        共 <i style="color: red"> ${page.getTotalPages()!} </i>道
                    </div>
                </div>
            <div>
                <#if questions??>
                    <#list  questions as question>
                        <div class="panel">
                            <strong style="font-size:20px">题目内容:</strong>

                            <p style="font-size: 14px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${question.content!}</p>
                        </div>
                        <#if question.questionType=="选择题">
                            <div id="chooseDiv" class="panel">
                                <strong style="font-size:20px">选项:</strong>

                                <p style="margin-top: 20px">
                                    <#assign  items=question.choiceMap>
                                    <b>A:<#list items?keys as k>
                                        <#if k=="A">
                                        ${items[k]?string!}
                                        </#if>
                                    </#list></b><br>
                                    <b>B:<#list items?keys as k>
                                        <#if k=="B">
                                        ${items[k]?string!}
                                        </#if>
                                    </#list></b><br>
                                    <b>C:<#list items?keys as k>
                                        <#if k=="C">
                                        ${items[k]?string!}
                                        </#if>
                                    </#list></b><br>
                                    <b>D:<#list items?keys as k>
                                        <#if k=="D">
                                        ${items[k]?string!}
                                        </#if>
                                    </#list></b><br>
                                </p>
                            </div>
                        </#if>
                        <hr>
                        <strong style="font-size:20px">学生答案:</strong>

                        <p>${question.studentAnswer!}</p>
                        <hr>
                        <strong style="font-size:20px">正确答案:</strong>

                        <p>${question.answer!!}</p>
                        <hr>
                        <strong style="font-size:20px">得分:</strong>

                        <p>${question.score!}</p>
                        </form>
                    </div>
                    </#list>
                </#if>
            </div>
            <div class="panel-footer">
                <ul class="pager pager-justify">
                    <li class="previous"><a href="/stage/grade/view?pageNo=${page.pageNo-1}" id="prevBtn"><<
                        上一题</a></li>
                    <li class="next"><a href="/stage/grade/view?pageNo=${page.pageNo+1}" id="nextBtn">下一题 >></a>
                    </li>
                </ul>
            </div>
        </div>
        <div class="panel" style="width: 15%;float: left;">
            <div class="panel panel-primary">
                <div class="panel-heading"><strong>试卷信息</strong></div>
                <div class="panel-body">
                    <strong>试卷标题</strong> :${exam.examTitle!}<br>
                    <strong>开始时间</strong> :${exam.startTime?string("yyyy-MM-dd HH:mm:ss")!}<br>
                    <strong> 结束时间</strong> :${exam.deadline?string("yyyy-MM-dd HH:mm:ss")!}<br>

                    <form class="deadline">
                        <input name="deadline" value="${exam.deadline?string("yyyy-MM-dd HH:mm:ss")}" class="hidden">
                    </form>
                </div>
            </div>
            <div class="panel panel-primary">
                <div class="panel-heading"><strong>快速路口</strong></div>
                <div class="panel-body">
                    <nav class="pager">
                        <@pager page=page/>
                    </nav>
                </div>
            </div>
        </div>

    </div>
</body>
</html>
</@layout>