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
                        <a href="/admin/homework/tempManagement"><i class="icon-th-list"></i>�鿴��ҵ</a>
                    </li>
                    <li>
                        <a href="/admin/homework/addHomework"><i class="icon-plus"></i>������ҵ</a>
                    </li>
                    <li>
                        <a href="/admin/checkHomework/tempCheckManagement"><i class="icon-file-text"></i> ������ҵ</a>
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
