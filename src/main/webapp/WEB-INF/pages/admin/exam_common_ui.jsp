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

        #panelTwo {
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
                        <a href="/admin/question/management"><i class="icon-th-list"></i>�鿴���</a>
                    </li>
                    <li>
                        <a href="/admin/exam/showTitle"><i class="icon-file-text"></i>�鿴�Ծ�</a>
                    </li>
                    <li>
                        <a href="/admin/exam/add"><i class="icon-plus"></i>�Ծ�����</a>
                    </li>
                    <li>
                        <a href="/admin/exam/examControl"><i class="icon icon-calendar"></i> ���Կ���</a>
                        <ul class="nav">
                            <li><a href="/admin/exam/examControl/findExam">���Բ�ѯ</a></li>
                            <li><a href="/admin/exam/examControl/releaseExam">��������</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="/admin/exam/checking"><i class="icon icon-signout"></i> �Ծ�����</a>
                    </li>
                    <li>
                        <a href="/admin/score/management"><i class="icon-bookmark"></i> �ɼ���ѯ</a>
                    </li>
                </ul>
            </nav>
        </div>
    </div>
</div>
</body>
</html>
