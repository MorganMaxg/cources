<%--
  Created by IntelliJ IDEA.
  User: maomao
  Date: 2015/3/12
  Time: 19:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=GBK" language="java" %>
<html>
<head>
    <title>修改学生</title>
</head>
<body>
<jsp:include page="common_ui.jsp"></jsp:include>
<form action="/admin/update/save" method="post">
    <input type="text" name="id" class="hidden" value="<%=request.getAttribute("id")%>">

    <div class="panel panel-primary">
        <div class="panel-body" align="center">
            <div id="panelOne" class="panel" style="width: 500px">
                <div class="panel-body">
                    <table class="table">
                        <tr>
                            <th width='200px'></th>
                            <th width='10px'></th>
                        </tr>
                        <tr>
                            <td><strong>请输入学生学号:</strong></td>
                            <td><input type="text" name="studentID" class='form-control' placeholder="请输入学生学号"></td>
                        </tr>
                        <tr>
                            <td><strong>请输入学生姓名:</strong></td>
                            <td><input type="text" name="studentName" class='form-control' placeholder="请输入学生姓名"></td>
                        </tr>
                        <tr>
                            <td><strong>请输入学生班级:</strong></td>
                            <td><input type="text" name="className" class='form-control' placeholder="请输入学生班级"></td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </div>
    <tr>
        <div align="center">
            <td><input type="submit" name="submit" value="提交"></td>
            <td><input type="reset" name="reset" value="重置"></td>
        </div>
    </tr>
</form>
</body>
</html>
