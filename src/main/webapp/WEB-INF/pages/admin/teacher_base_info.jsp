<%--
  Created by IntelliJ IDEA.
  User: maomao
  Date: 2015/3/11
  Time: 8:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=GBK" language="java" %>
<%--<%jsp:useBean id="teacher" class="com."%>--%>
<html>
<head>
    <title>������Ϣ</title>
    <style type="text/css">
        #panel #panelOne {
            float: left;
            display: inline;
        <%--��������ó�����Ԫ�ؿ���ʹ2����ͬ�Ŀ鼶Ԫ�ط���ͬһ��--%> height: 380px;
        }
    </style>
</head>
<body>
<jsp:include page="common_ui.jsp"></jsp:include>
<div class="alert alert-success">
    <strong>��ӭ!</strong> ���뾫Ʒ�γ���վ��
</div>
<div id="panel" class='panel'>
    <div class='panel-heading'>
        <strong><i class='icon-group'></i> ��ʦ��Ϣ</strong>
    </div>
    <div id="panel-body" class="panel-body">
        <div id="panelOne" class="panel" style="width: 365px">
            <div class="panel-body">
                <img src="/images/school_door.jpg" height="350px" width="360px">
            </div>
        </div>
        <div id="panelOne" class="panel" style="width: 600px">
            <div class="panel-body" align="left">
                <div class='article-content'>
                    <tr>
                        <th>
                            <h3><strong>��ʦ������${teacher.teacherName}</strong></h3>
                        </th>
                        <br>

                        <th><h3><strong>��ʦ��飺${teacher.basicInfo}</strong></h3></th>
                        <br>
                    </tr>
                </div>
            </div>
        </div>
        <div id="panelOne" class="panel" style="width: 365px">
            <div class="panel-body">
                <img src="/images/sun_flower.jpg" height="350px" width="360px">
            </div>
        </div>
    </div>
</div>
</body>
</html>
