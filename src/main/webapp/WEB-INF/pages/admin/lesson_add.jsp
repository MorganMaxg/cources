<%@ page import="com.springapp.mvc.entity.Teacher" %>
<%--
  Created by IntelliJ IDEA.
  User: maomao
  Date: 2015/6/16
  Time: 18:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=GBK" language="java" %>
<html>
<head>
    <title>��ӿγ�</title>
</head>
<body>
<jsp:include page="common_ui.jsp"></jsp:include>
<form action="/admin/lesson/add/save" method="post">
    <div class='panel' align="center">
        <div id="panelOne" class="panel" style="width: 500px">
            <div class="panel-body">
                <%Teacher teacher = (Teacher) session.getAttribute("teacher");%>
                <table class='table table-condensed table-hover table-striped table-borderless table-fixed'>
                    <tr>
                        <th>������γ�����</th>
                        <td><input type="text" name="lessonName" placeholder="������γ���"></td>
                    </tr>
                    <tr>
                        <th>��ʦ��</th>
                        <td><%=teacher.getTeacherName()%>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
        <div align="center">
            <tr>
                <input type="submit" name="submit" value="�ύ">
                <input type="reset" name="reset" value="����">
            </tr>
        </div>
    </div>
</form>
</body>
</html>
