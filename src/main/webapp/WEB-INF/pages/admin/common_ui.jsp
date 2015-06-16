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
        <li class='active'><a href='/admin/teacher'>基本信息</a></li>
        <li><a href='/admin/studentManage'>学生管理</a></li>
        <li><a href="/admin/message/management">通知发布</a></li>
        <li><a href="/admin/material/management">教学资料管理</a></li>
        <li><a href="/admin/question/management">题库管理</a></li>
        <li><a href="/admin/homework/tempManagement">在线作业管理</a></li>
        <li><a href="/admin/exam/management">在线考试管理</a></li>
        <li><a href="/admin/score/management">成绩管理</a></li>
        <%
            Teacher teacher = (Teacher) session.getAttribute("teacher");
            if (teacher.getType() == 1) {
                out.print("<li><a href=\"/admin/teacher/management\">教师管理</a></li>");
            }
        %>
    </ul>
</div>
</body>
</html>
