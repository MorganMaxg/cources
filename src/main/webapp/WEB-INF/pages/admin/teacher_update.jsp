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
                        <th>�������ʦ���ţ�</th>
                        <td><input type="text" name="teacherID" placeholder="�������ʦ����"></td>
                    </tr>
                    <tr>
                        <th>�������ʦ������</th>
                        <td><input type="text" name="teacherName" placeholder="�������ʦ����"></td>
                    </tr>
                    <tr>
                        <th>�������ʦ��飺</th>
                        <td><input type="text" name="basicInfo" placeholder="�������ʦ���"></td>
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
