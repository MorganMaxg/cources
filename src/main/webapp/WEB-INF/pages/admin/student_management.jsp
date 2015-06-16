<%@ page import="com.springapp.mvc.entity.Lesson" %>
<%@ page import="java.util.List" %>
<%--
  Created by IntelliJ IDEA.
  User: maomao
  Date: 2015/5/25
  Time: 19:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>学生管理</title>
    <script>
        function deleteAlert() {
            alert('你确定要删除么?');
        }
    </script>
</head>
<body>
<jsp:include page="student_common_ui.jsp"></jsp:include>
<div id="panelOne" class="panel" style="width: 1050px">
    <div class="panel-body">
        <table class='table table-condensed table-hover table-striped table-borderless table-fixed'>
            <thead>
            <tr>
                <th>学号</th>
                <th>姓名</th>
                <th>班级</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>
            <%
                List<Lesson> lessonList = (List<Lesson>) request.getAttribute("lessonStudents");
                for (Lesson lesson : lessonList) {
            %>
            <tr>
                <td><%=lesson.getStudentID()%>
                </td>
                <td><%=lesson.getStudentName()%>
                </td>
                <td><%=lesson.getClassName()%>
                </td>
                <td>
                    <a href="/admin/updateStudent?id=<%=lesson.getId()%>" class="icon-wrench">更新</a>
                    &nbsp;&nbsp;
                    <a href="/admin/deleteStudent?id=<%=lesson.getId()%>" class="icon-remove"
                       onclick="deleteAlert()">删除</a>
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
