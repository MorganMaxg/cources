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
        <%--��������ó�����Ԫ�ؿ���ʹ2����ͬ�Ŀ鼶Ԫ�ط���ͬһ��--%>
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
                        <a href="/admin/question/management"><i class="icon-th"></i> �鿴���</a>
                        <ul class="nav">
                            <li><a href="/admin/singleChoiceQuestion/management">��ѡ��</a></li>
                            <li><a href="/admin/checkingQuestion/management">�ж���</a></li>
                            <li><a href="/admin/shortAnswerQuestion/management">�����</a></li>
                            <li><a href="/admin/subjectiveItemQuestion/management">������</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href=""><i class="icon-plus"></i> ������Ŀ</a>
                        <ul class="nav">
                            <li><a href="/admin/question/addSingleChoice">��ѡ��</a></li>
                            <li><a href="/admin/question/addChecking">�ж���</a></li>
                            <li><a href="/admin/question/addShortAnswer">�����</a></li>
                            <li><a href="/admin/question/addSubjectiveItem">������</a></li>
                        </ul>
                    </li>
                </ul>
            </nav>
        </div>
    </div>
</div>
</body>
</html>
