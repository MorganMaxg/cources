<%--
  Created by IntelliJ IDEA.
  User: maomao
  Date: 2015/6/3
  Time: 12:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=GBK" language="java" %>
<html>
<head>
    <title>����ѧ��</title>
</head>
<body>
<jsp:include page="student_common_ui.jsp"></jsp:include>
<div id="panelOne" class="panel" style="width: 1050px">
    <div class="panel-body">
        <div class="input-group" style="width: 600px">
            <span class="input-group-addon">��������</span>
            <select class="form-control">
                <option value="1">ѧ��</option>
                <option value="2">����</option>
                <option value="3">�༶</option>
            </select>
            <span class="input-group-addon fix-border fix-padding"></span>
            <input type="text" class="form-control" name="searchContent">
            <span class="input-group-btn">
                <button class="btn btn-default" onclick="">����</button>
            </span>
        </div>
        <table id="studentTable" style="border=2; display: none;">
            <thead>
            <tr>
                <th style='width:10%;'>ѧ��</th>
                <th style='width:15%;'>����</th>
                <th style='width:10%;'>�༶</th>
            </tr>
            </thead>
            <tbody>
            <tr id="cloneTr">
                <td></td>
                <td></td>
                <td></td>
            </tr>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>
