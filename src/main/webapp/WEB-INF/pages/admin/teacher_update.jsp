<%--
  Created by IntelliJ IDEA.
  User: maomao
  Date: 2015/6/16
  Time: 16:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=GBK" language="java" %>
<html>
<head>
    <title></title>
</head>
<body>
<jsp:include page="common_ui.jsp"></jsp:include>
<form action="/admin/teacher/update/save" method="post">
    <div class='panel' align="center">
        <div id="panelOne" class="panel" style="width: 500px">
            <div class="panel-body">
                <input type="text" name="id" value="<%=request.getAttribute("id")%>" class="hidden">
                <table class='table table-condensed table-hover table-striped table-borderless table-fixed'>
                    <tr>
                        <th>请输入教师工号：</th>
                        <td><input type="text" name="teacherID" placeholder="请输入教师工号"></td>
                    </tr>
                    <tr>
                        <th>请输入教师姓名：</th>
                        <td><input type="text" name="teacherName" placeholder="请输入教师姓名"></td>
                    </tr>
                    <tr>
                        <th>请输入教师简介：</th>
                        <td><input type="text" name="basicInfo" placeholder="请输入教师简介"></td>
                    </tr>
                </table>
            </div>
        </div>
        <div align="center">
            <tr>
                <input type="submit" name="submit" value="提交">
                <input type="reset" name="reset" value="重置">
            </tr>
        </div>
    </div>
</form>
</body>
</html>
