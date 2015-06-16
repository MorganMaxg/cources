<%--
  Created by IntelliJ IDEA.
  User: maomao
  Date: 2015/5/23
  Time: 14:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
    <style type="text/css">
        #panel {
            width: 1350px;
            float: left;
        }

        #panelOne {
            float: left;
            display: inline;
        <%--将面板设置成内联元素可以使2个不同的块级元素放在同一行--%>
        }
    </style>
</head>
<body>
<jsp:include page="common_ui.jsp"></jsp:include>
<div id="panelOne" class="panel" style="width: 250px">
    <div class="panel-body">
        <div class="example" contenteditable="false" align="center">
            <nav class="menu" data-toggle='menu' style='width: 200px'>
                <ul class="nav nav-primary">
                    <li>
                        <a href=""><i class="icon icon-search"></i>作业成绩查询</a>
                        <ul class="nav">
                            <li><a href="/admin/score/findHomeworkScoreByHomework"><i class="icon icon-search"></i>按作业查询</a>
                            </li>
                            <li><a href="/admin/score/findHomeworkScoreByLesson"><i
                                    class="icon icon-search"></i>按学生查询</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href=""><i class="icon icon-search"></i>考试成绩查询</a>
                        <ul class="nav">
                            <li><a href="/admin/score/findExamScoreByExam"><i class="icon icon-search"></i>按考试查询</a>
                            </li>
                            <li><a href="/admin/score/findExamScoreByLesson"><i class="icon icon-search"></i>按学生查询</a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href=""><i class="icon icon-sun"></i>成绩比例设置</a>
                        <ul class="nav">
                            <li><a href="/admin/score/setExamProportion/showLesson"><i class="icon icon-sun"></i>考试比例设置</a>
                            </li>
                            <li><a href="/admin/score/setHomeworkProportion/showLesson"><i class="icon icon-sun"></i>作业比例设置</a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="/admin/score/findFinalScore/showLesson"><i class="icon icon-group"></i>总成绩查询</a>
                    </li>
                </ul>
            </nav>
        </div>
    </div>
</div>
</html>
