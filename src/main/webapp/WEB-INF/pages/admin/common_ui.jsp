<%@ page import="com.springapp.mvc.entity.Teacher" %>
<%--
  Created by IntelliJ IDEA.
  User: maomao
  Date: 2015/3/11
  Time: 8:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=GBK" language="java" %>
<html>
<head>
    <title></title>
    <link href="/css/zui.min.css" rel="stylesheet">
    <link href="/css/zui.datatable.css" rel="stylesheet">
    <script src="/js/jquery-1.11.2.min.js"></script>
    <script src="/js/zui.js"></script>
    <script src="/js/zui.datatable.js"></script>
    <script language="JavaScript"></script>
</head>
<body>
<div class='collapse navbar-collapse'>
    <ul class='nav navbar-nav'>
        <li class='active'><a href='/admin/teacher'>������Ϣ</a></li>
        <li><a href='/admin/studentManage'>ѧ������</a></li>
        <li><a href="/admin/message/management">֪ͨ����</a></li>
        <li><a href="/admin/material/management">��ѧ���Ϲ���</a></li>
        <li><a href="/admin/question/management">������</a></li>
        <li><a href="/admin/homework/tempManagement">������ҵ����</a></li>
        <li><a href="/admin/exam/management">���߿��Թ���</a></li>
        <li><a href="/admin/score/management">�ɼ�����</a></li>
        <%
            Teacher teacher = (Teacher) session.getAttribute("teacher");
            if (teacher.getType() == 1) {
                out.print("<li><a href=\"/admin/teacher/management\">��ʦ����</a></li>");
            }
        %>
    </ul>
</div>
</body>
</html>
