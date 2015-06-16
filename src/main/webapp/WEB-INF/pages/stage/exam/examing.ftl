<!DOCTYPE html>
<html>
<head>
    <title>考试中~</title>
    <link href="/css/zui.min.css" rel="stylesheet">
    <link href="/css/zui.datatable.css" rel="stylesheet">
</head>
<body>
<script src="/js/jquery-1.11.2.min.js"></script>
<script src="/js/zui.min.js"></script>
<script src="/js/zui.datatable.js"></script>
<script>
    $(document).ready(function () {
        $("a").click(function (e) {
            $.post("/stage/exam/saveStudentAnswer", $("form.question").serialize(), function () {
            })
        });
        $("#submitBtn").click(function (e) {
            if (!confirm("确定提交试卷?")) {
                return;
            }
            $.post("/stage/exam/saveStudentAnswer", $("form.question").serialize(), function (data) {
                alert("提交成功");
                $.post("/stage/exam/submit", $("form.question").serialize(), function () {
                    alert(111)
                });
                window.location.href = "/stage/security/home.html";
            });
        });
        if (${page.pageNo}==1
        )
        {
            $("#prevBtn").addClass("hidden");
        }
        if (${page.pageNo}==${page.getTotalPages()}) {
            $("#nextBtn").addClass("hidden");
        }
        window.setInterval("cc()", 10000);
    });
    function cc() {
        $.post('/stage/exam/newTimeRemain', $('form.deadline').serialize(), function (data) {
            if (data < 1) {
                $.post("/stage/exam/saveStudentAnswer", $("form.question").serialize(), function () {
                });
                alert("考试时间到!系统自动提交试卷!请点击确定,返回主界面!")
                window.location.href = "/stage/security/home.html";
            }
            $("#timeRemain").html(data);
        });
    }
    ;
</script>
<div class="left">
</div>
<div class="container">
    <img src="/image/examing.jpg" style="width: 100%;height: 100px">

    <div class="panel">
        <div class="panel" style="width: 15%;float: left;">
            <div class="panel panel-primary">
                <div class="panel-heading"><strong>学生信息</strong></div>
                <div class="panel-body">
                    <strong> 姓名</strong> :${student.name!}<br>
                    <strong> 班级</strong> :${student.className!}<br>
                    <strong>学号</strong> :${student.studentId}<br>
                </div>
            </div>
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
        </div>
        <div class="panel panel-primary" style="float: left;width: 68%;margin-left: 11px;margin-right: 11px">
            <div class="panel-heading"><strong>考试题目</strong></div>
            <div class="panel-body">
                <div class="panel">
                    <div style="width: 50%;float: left;height: 60px">
                        当前第<i style="color: red"> ${page.pageNo!} </i>道,
                        共 <i style="color: red"> ${page.getTotalPages()!} </i>道
                    </div>
                    <div style="width: 50%;float: left;height: 60px"><label>剩余时间:<I id="timeRemain"
                                                                                    style="color: red">${exam.time!}</I>分钟</label>
                        <button id="submitBtn" style="margin-left: 100px" class="btn btn-sm btn-danger">提交试卷</button>
                    </div>
                </div>
            <div>
            <#if questions??>
                <#list  questions as question>
                    <form action="/stage/exam/gotoExam" class="question" method="post">
                        <input type="hidden" value="${exam.examId}" name="examId">
                        <input type="hidden" value="${question.questionId}" name="questionId">

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
                                <hr>
                                <strong style="font-size:20px">答案:</strong>

                                <input type="radio" id="choiceA" name="studentAnswer" value="A"
                                       <#if question.studentAnswer=="A">checked="checked" </#if>><label
                                    for="choiceA"><b>A&nbsp;&nbsp;&nbsp;</b></label>
                                <input id="choiceB" type="radio" name="studentAnswer" value="B"
                                       <#if question.studentAnswer=="B">checked="checked" </#if>> <label
                                    for="choiceB"><b>B&nbsp;&nbsp;&nbsp;</b></label>
                                <input id="choiceC" type="radio" name="studentAnswer" value="C"
                                       <#if question.studentAnswer=="C">checked="checked" </#if>><label
                                    for="choiceC"><b>C&nbsp;&nbsp;&nbsp;</b></label>
                                <input id="choiceD" type="radio" name="studentAnswer" value="D"
                                       <#if question.studentAnswer=="D">checked="checked" </#if>> <label
                                    for="choiceD"><b>D&nbsp;&nbsp;&nbsp;</b></label>
                            </div>
                        </#if>
                        <#if question.questionType=="判断题">
                            <div id="radioDiv" class="panel">
                                <strong style="font-size:20px">选项和答案:</strong>

                                <p style="margin-top: 20px">

                                    <input id="right" type="radio" name="studentAnswer" value="对"
                                           <#if question.studentAnswer=="对">checked="checked" </#if>><label
                                        for="right"><b>正确&nbsp;&nbsp;&nbsp;</b></label>
                                    <input id="error" type="radio" name="studentAnswer" value="错"
                                           <#if question.studentAnswer=="错">checked="checked" </#if>> <label
                                        for="error"><b>错误&nbsp;&nbsp;&nbsp;</b></label>
                                </p>
                            </div>
                        </#if>
                        <#if question.questionType=="主观题">
                            <div id="radioDiv" class="panel">
                                <strong style="font-size:20px">答案:</strong>

                                <p style="margin-top: 20px">

                                    <textarea rows="6" cols="100%" name="studentAnswer"
                                              placeholder="字数限制500字">
                                    ${question.studentAnswer!}
                                    </textarea>

                                </p>
                            </div>
                        </#if>
                    </form>
                </div>
                </#list>
            </#if>
            </div>
            <div class="panel-footer">
                <ul class="pager pager-justify">
                    <li class="previous"><a href="/stage/exam/examing?pageNo=${page.pageNo-1}" id="prevBtn"><<
                        上一题</a></li>
                    <li class="next"><a href="/stage/exam/examing?pageNo=${page.pageNo+1}" id="nextBtn">下一题 >></a>
                    </li>
                </ul>
            </div>
        </div>
        <div class="panel panel-primary" style="float: left;width: 15%">
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