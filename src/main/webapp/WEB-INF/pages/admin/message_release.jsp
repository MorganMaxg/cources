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
    <title>֪ͨ����</title>
</head>
<body>
<jsp:include page="common_ui.jsp"></jsp:include>
<form action="/admin/message/addMessage/save" method="post">
    <div class='panel' align="center">
        <div id="panelOne" class="panel" style="width: 500px">
            <div class="panel-body">
                <table class='table table-condensed table-hover table-striped table-borderless table-fixed'>
                    <tr>
                        <th>����</th>
                        <td><input type="text" name="title" placeholder="������֪ͨ����"></td>
                    </tr>
                    <tr>
                        <th>������</th>
                        <td>
                            <%Teacher teacher = (Teacher) session.getAttribute("teacher");%>
                            <%out.write(teacher.getTeacherName());%>
                        </td>
                    </tr>
                    <tr>
                        <th>����</th>
                        <td><input type="text" name="messageContent" placeholder="������֪ͨ����"></td>
                    </tr>
                </table>
            </div>
        </div>


        <div align="center">
            <tr>
                <input type="submit" name="messageSubmit" value="�ύ">
                <input type="reset" name="reset" value="����">
            </tr>
        </div>
    </div>
</form>
</body>
</html>
