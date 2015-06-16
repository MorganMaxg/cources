<%@ page import="com.springapp.mvc.entity.Exam" %>
<%@ page import="java.util.List" %>
<%--
  Created by IntelliJ IDEA.
  User: maomao
  Date: 2015/5/28
  Time: 12:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=GBK" language="java" %>
<html>
<head>
    <title></title>
</head>
<body>
<jsp:include page="exam_common_ui.jsp"></jsp:include>
<div id="panelOne" class="panel" style="width: 1050px">
    <div class="panel-body">
        <table class='table table-condensed table-hover table-striped table-borderless table-fixed'>
            <thead>
            <tr>
                <th>学生学号</th>
                <th>学生姓名</th>
                <th>学生班级</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>
            <%
                List<Exam> examLessonStudents = (List<Exam>) request.getAttribute("examLessonStudents");
                for (Exam exam : examLessonStudents) {
            %>
            <tr>
                <td><%=exam.getId()%>
                </td>
                <td><%=exam.getStudentName()%>
                </td>
                <td><%=exam.getClassName()%>
                </td>
                <td>
                    <a href="/admin/exam/checking/findAnswerAndSetScore?examID=<%=exam.getExamID()%>&studentID=<%=exam.getId()%>&currentPage=0&studentScore=0&questionID=0&lessonID=<%=exam.getLessonID()%>"><i
                            class="icon icon-edit">查看批阅</i></a></td>
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
