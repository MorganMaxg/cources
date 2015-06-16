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

        #panelTwo {
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
                        <a href="/admin/question/management"><i class="icon-th-list"></i>查看题库</a>
                    </li>
                    <li>
                        <a href="/admin/exam/showTitle"><i class="icon-file-text"></i>查看试卷</a>
                    </li>
                    <li>
                        <a href="/admin/exam/add"><i class="icon-plus"></i>试卷生成</a>
                    </li>
                    <li>
                        <a href="/admin/exam/examControl"><i class="icon icon-calendar"></i> 考试控制</a>
                        <ul class="nav">
                            <li><a href="/admin/exam/examControl/findExam">考试查询</a></li>
                            <li><a href="/admin/exam/examControl/releaseExam">发布考试</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="/admin/exam/checking"><i class="icon icon-signout"></i> 试卷批阅</a>
                    </li>
                    <li>
                        <a href="/admin/score/management"><i class="icon-bookmark"></i> 成绩查询</a>
                    </li>
                </ul>
            </nav>
        </div>
    </div>
</div>
</body>
</html>
