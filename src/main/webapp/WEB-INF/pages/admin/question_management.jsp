<%--
  Created by IntelliJ IDEA.
  User: maomao
  Date: 2015/4/24
  Time: 19:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=GBK" language="java" %>
<html>
<head>
    <title>题库管理</title>
    <style type="text/css">
        * {
            margin: 0;
            padding: 0;
            list-style: none;
        }

        body {
            background: #fff;
            padding: 10px;
        }

        /*button { height:59px; font-size:28px; font-family:Vernada; padding:0 30px; color:#fff; overflow:visible; border:1px solid #000; background:url(http://www.poluoluo.com/jzxy/UploadFiles_335/201107/20110730193355481.gif);}*/
        .singleChoiceButton h1 button {
            width: 139px;
            height: 40px;
            line-height: 18px;
            font-size: 18px;
            color: #955686;
            background: url("/button/bg34.jpg") no-repeat left top;
            padding-bottom: 4px;
        }

        .checkingButton h1 button {
            width: 139px;
            height: 40px;
            line-height: 18px;
            font-size: 18px;
            color: #955686;
            background: url("/button/bg34.jpg") no-repeat left top;
            padding-bottom: 4px;
        }

        .subjectiveItemButton h1 button {
            width: 139px;
            height: 40px;
            line-height: 18px;
            font-size: 18px;
            color: #955686;
            background: url("/button/bg34.jpg") no-repeat left top;
            padding-bottom: 4px;
        }

        .shortAnswerButton h1 button {
            width: 139px;
            height: 40px;
            line-height: 18px;
            font-size: 18px;
            color: #955686;
            background: url("/button/bg34.jpg") no-repeat left top;
            padding-bottom: 4px;
        }
    </style>
</head>
<body>
<jsp:include page="question_common_ui.jsp"/>
<%--第二个面板--%>
<div id="panelOne" class="panel" style="width:1050px ">
    <div class="panel-body">
        <div class="singleChoiceButton">
            <h1 align="center">
                <button name="singleChoiceButton">
                    <a href="/admin/singleChoiceQuestion/management">
                        单选题题库
                    </a>
                </button>
            </h1>
        </div>
        <br>
        <br>
        <br>

        <div class="checkingButton">
            <h1 align="center">
                <button name="checkingButton">
                    <a href="/admin/checkingQuestion/management">
                        判断题题库
                    </a>
                </button>
            </h1>
        </div>
        <br>
        <br>
        <br>

        <div class="shortAnswerButton">
            <h1 align="center">
                <button name="shortAnswerButton">
                    <a href="/admin/shortAnswerQuestion/management">
                        简答题题库
                    </a>
                </button>
            </h1>
        </div>
        <br>
        <br>
        <br>

        <div class="subjectiveItemButton">
            <h1 align="center">
                <button name="subjectiveItemButton">
                    <a href="/admin/subjectiveItemQuestion/management">
                        主观题题库
                    </a>
                </button>
            </h1>
        </div>
    </div>
</div>
</body>
</html>
