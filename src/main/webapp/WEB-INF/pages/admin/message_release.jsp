<%@ page import="com.springapp.mvc.entity.Teacher" %>
<%--
  Created by IntelliJ IDEA.
  User: maomao
  Date: 2015/4/7
  Time: 14:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=GBK" language="java" %>
<html>
<head>
    <title>通知发布</title>
</head>
<body>
<jsp:include page="common_ui.jsp"></jsp:include>
<form action="/admin/message/addMessage/save" method="post">
    <div class='panel' align="center">
        <div id="panelOne" class="panel" style="width: 500px">
            <div class="panel-body">
                <table class='table table-condensed table-hover table-striped table-borderless table-fixed'>
                    <tr>
                        <th>标题</th>
                        <td><input type="text" name="title" placeholder="请输入通知标题"></td>
                    </tr>
                    <tr>
                        <th>发布者</th>
                        <td>
                            <%Teacher teacher = (Teacher) session.getAttribute("teacher");%>
                            <%out.write(teacher.getTeacherName());%>
                        </td>
                    </tr>
                    <tr>
                        <th>内容</th>
                        <td><input type="text" name="messageContent" placeholder="请输入通知内容"></td>
                    </tr>
                </table>
            </div>
        </div>


        <div align="center">
            <tr>
                <input type="submit" name="messageSubmit" value="提交">
                <input type="reset" name="reset" value="重置">
            </tr>
        </div>
    </div>
</form>
</body>
</html>
