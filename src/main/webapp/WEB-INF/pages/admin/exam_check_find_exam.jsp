<%@ page import="com.springapp.mvc.entity.Exam" %>
<%@ page import="com.springapp.mvc.entity.Teacher" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.List" %>
<%--
  Created by IntelliJ IDEA.
  User: maomao
  Date: 2015/5/28
  Time: 12:19
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
            <thead align="center">
            <th width="300px">考试名称</th>
            <th width="120px">负责老师</th>
            <th width="400px">考试对象</th>
            <th width="100px">状态</th>
            <th width="100px">操作</th>
            </thead>
            <tbody>
            <%
                List<Exam> exams = (List<Exam>) request.getAttribute("exams");
                Teacher teacher = (Teacher) session.getAttribute("teacher");
                for (Exam exam : exams) {
                    if (exam.getLessonID() != 0) {
            %>
            <tr>
                <td><a href="/admin/exam/find?examID=<%=exam.getExamID()%>"><%=exam.getExamTitle()%>
                </a></td>
                <td><%=teacher.getTeacherName()%>
                </td>
                <td><%=exam.getLessonName()%>
                </td>
                <%
                    Date date = new Date();//系统时间
                    Date deadline = exam.getDeadline();//截止时间
                    if (date.getTime() < deadline.getTime()) {
                %>
                <td>
                    <div style="color: red">
                        <strong>进行中</strong>
                    </div>
                </td>
                <%
                    }
                %>
                <%
                    if (date.getTime() >= deadline.getTime()) {
                %>
                <td>
                    <div style="color:#c0c0c0;">
                        <strong>已结束</strong>
                    </div>
                </td>
                <%
                    }
                %>
                <td>
                    <a href="/admin/exam/checking/findLesson?examID=<%=exam.getExamID()%>&lessonID=<%=exam.getLessonID()%>"><i
                            class="icon icon-edit">批阅</i></a></td>
            </tr>
            <%
                    }
                }
            %>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>
