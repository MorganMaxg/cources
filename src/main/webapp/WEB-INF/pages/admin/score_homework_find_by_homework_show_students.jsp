<%@ page import="com.springapp.mvc.entity.Lesson" %>
<%@ page import="java.util.List" %>
<%--
  Created by IntelliJ IDEA.
  User: maomao
  Date: 2015/5/28
  Time: 18:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=GBK" language="java" %>
<html>
<head>
    <title></title>
</head>
<body>
<jsp:include page="score_common_ui.jsp"></jsp:include>
<div id="panelOne" class="panel" style="width: 1050px">
    <div class="panel-body">
        <table class='table table-condensed table-hover table-striped table-borderless table-fixed'>
            <thead>
            <th>学生学号</th>
            <th>学生姓名</th>
            <th>学生班级</th>
            <th>分数</th>
            </thead>
            <tbody>
            <%
                List<Lesson> lessonStudents = (List<Lesson>) request.getAttribute("lessonStudents");
                for (Lesson lesson : lessonStudents) {
            %>
            <tr>
                <td><%=lesson.getStudentID()%>
                </td>
                <td><%=lesson.getStudentName()%>
                </td>
                <td><%=lesson.getClassName()%>
                </td>
                <td><%=lesson.getScore()%>
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
