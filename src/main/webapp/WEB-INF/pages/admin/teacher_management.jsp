<%@ page import="com.springapp.mvc.entity.Teacher" %>
<%@ page import="java.util.List" %>
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
    <title>教师管理</title>
    <script>
        function deleteAlert() {
            alert('你确定要删除么?');
        }
    </script>
    <style type="text/css">
        #panel {
            width: 1350px;
            float: left;
        }

        #panelOne {
            float: left;
            display: inline;
        <%--将面板设置成内联元素可以使2个不同的块级元素放在同一行--%>
        }
    </style>
</head>
<body>
<jsp:include page="common_ui.jsp"></jsp:include>
<div id="panelOne" class="panel" style="width: 250px">
    <div class="panel-body">
        <div class="example" contenteditable="false" align="center">
            <nav class="menu" data-toggle='menu' style='width: 200px'>
                <ul class="nav nav-primary">
                    <li>
                        <a href="/admin/teacher/management"><i class="icon icon-list-alt"></i>查看教师</a>
                    </li>
                    <li>
                        <a href="/admin/teacher/add"><i class="icon icon-plus-sign"></i>添加教师</a>
                    </li>
                </ul>
            </nav>
        </div>
    </div>
</div>
<div id="panelOne" class="panel" style="width: 1050px">
    <div class="panel-body">
        <table class='table table-condensed table-hover table-striped table-borderless table-fixed'>
            <thead>
            <tr>
                <th>工号</th>
                <th>姓名</th>
                <th>类型</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>
            <%
                List<Teacher> teachers = (List<Teacher>) request.getAttribute("teachers");
                for (Teacher teacher : teachers) {
            %>
            <tr>
                <td><%=teacher.getTeacherID()%>
                </td>
                <td><%=teacher.getTeacherName()%>
                </td>
                <%
                    if (teacher.getType() == 0) {
                %>
                <td>普通教师</td>
                <%
                    }
                %>
                <%
                    if (teacher.getType() == 1) {
                %>
                <td>管理员</td>
                <%
                    }
                %>
                <td>
                    <a href="/admin/teacher/update?id=<%=teacher.getId()%>" class="icon-wrench">更新</a>
                    &nbsp;&nbsp;
                    <a href="/admin/teacher/delete?id=<%=teacher.getId()%>" class="icon-remove" onclick="deleteAlert()">删除</a>
                </td>
            </tr>
            <%
                }
            %>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>
