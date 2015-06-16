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
    <title>基本信息</title>
    <style type="text/css">
        #panel #panelOne {
            float: left;
            display: inline;
        <%--将面板设置成内联元素可以使2个不同的块级元素放在同一行--%> height: 380px;
        }
    </style>
</head>
<body>
<jsp:include page="common_ui.jsp"></jsp:include>
<div class="alert alert-success">
    <strong>欢迎!</strong> 进入精品课程网站。
</div>
<div id="panel" class='panel'>
    <div class='panel-heading'>
        <strong><i class='icon-group'></i> 教师信息</strong>
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
                            <h3><strong>老师姓名：${teacher.teacherName}</strong></h3>
                        </th>
                        <br>

                        <th><h3><strong>老师简介：${teacher.basicInfo}</strong></h3></th>
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
