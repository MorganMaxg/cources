<%@ page import="com.springapp.mvc.entity.Teacher" %>
<%--
  Created by IntelliJ IDEA.
  User: maomao
  Date: 2015/4/20
  Time: 16:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=GBK" language="java" %>
<html>
<head>
    <title></title>
</head>
<body>
<jsp:include page="common_ui.jsp"></jsp:include>
<form action="/admin/material/uploadMaterial/save" method="POST" enctype="multipart/form-data">
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
                            <th>发布者</th>
                            <td>
                                <%Teacher teacher = (Teacher) session.getAttribute("teacher");%>
                                <%out.write(teacher.getTeacherName());%>
                            </td>
                        </tr>
                        <tr>
                            <th>资料上传</th>
                            <td><input type="file" name="file"/></td>
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
