<%--
  Created by IntelliJ IDEA.
  User: maomao
  Date: 2015/4/28
  Time: 23:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=GBK" language="java" %>
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
                        <a href="/admin/question/management"><i class="icon-th"></i> 查看题库</a>
                        <ul class="nav">
                            <li><a href="/admin/singleChoiceQuestion/management">单选题</a></li>
                            <li><a href="/admin/checkingQuestion/management">判断题</a></li>
                            <li><a href="/admin/shortAnswerQuestion/management">简答题</a></li>
                            <li><a href="/admin/subjectiveItemQuestion/management">主观题</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href=""><i class="icon-plus"></i> 增加题目</a>
                        <ul class="nav">
                            <li><a href="/admin/question/addSingleChoice">单选题</a></li>
                            <li><a href="/admin/question/addChecking">判断题</a></li>
                            <li><a href="/admin/question/addShortAnswer">简答题</a></li>
                            <li><a href="/admin/question/addSubjectiveItem">主观题</a></li>
                        </ul>
                    </li>
                </ul>
            </nav>
        </div>
    </div>
</div>
</body>
</html>
