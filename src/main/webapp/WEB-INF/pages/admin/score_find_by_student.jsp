<%@ page import="com.springapp.mvc.entity.HomeworkStudents" %>
<%@ page import="com.springapp.mvc.entity.Student" %>
<%@ page import="java.util.List" %>
<%--
  Created by IntelliJ IDEA.
  User: maomao
  Date: 2015/5/23
  Time: 15:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
</head>
<body>
<jsp:include page="score_common_ui.jsp"></jsp:include>
<div id="panelOne" class="panel" style="width: 250px">
    <div class="panel-body">
        <%
            Student student = (Student) request.getAttribute("student");
        %>
        <table class="table">
            <tr>
                <td>姓名：</td>
                <td><%=student.getStudentName()%>
                </td>
            </tr>
            <tr>
                <td>学号：</td>
                <td><%=student.getStudentID()%>
                </td>
            </tr>
            <tr>
                <td>班级：</td>
                <td><%=student.getClassName()%>
                </td>
            </tr>
        </table>
    </div>
</div>
<div id="panelOne" class="panel" style="width: 800px">
    <div class="panel-body">
        <table class='table table-condensed table-hover table-striped table-borderless table-fixed'>
            <thead>
            <th>作业</th>
            <th>成绩</th>
            <th>比例</th>
            </thead>
            <tbody>
            <%
                List<HomeworkStudents> homeworkStudentses = (List<HomeworkStudents>) request.getAttribute("homeworkStudents");
                for (HomeworkStudents homeworkStudents : homeworkStudentses) {
            %>
            <tr>
                <td><%=homeworkStudents.getTeacherFileName().substring(0, homeworkStudents.getTeacherFileName().indexOf("."))%>
                </td>
                <td><%=homeworkStudents.getScore()%>
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
