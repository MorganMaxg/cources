<%@ page import="com.springapp.mvc.entity.Homework" %>
<%@ page import="com.springapp.mvc.entity.Teacher" %>
<%@ page import="org.apache.commons.lang3.time.DateFormatUtils" %>
<%@ page import="java.io.File" %>
<%@ page import="java.util.List" %>
<%--
  Created by IntelliJ IDEA.
  User: maomao
  Date: 2015/5/23
  Time: 13:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=GBK" language="java" %>
<html>
<head>
    <title>成绩管理</title>
</head>
<body>
<jsp:include page="score_common_ui.jsp"></jsp:include>
<div id="panelOne" class="panel" style="width: 1050px">
    <div class="panel-body">
        <table class='table table-condensed table-hover table-striped table-borderless table-fixed'>
            <thead>
            <th>作业题目</th>
            <th>发布老师</th>
            <th>截止时间</th>
            <th>学生成绩</th>
            </thead>
            <tbody>
            <%
                Teacher teacher = (Teacher) session.getAttribute("teacher");
                List<Homework> homeworks = (List<Homework>) request.getAttribute("homeworks");
                for (Homework homework : homeworks) {
                    String studentHomeworkUri = request.getSession().getServletContext().getRealPath("/WEB-INF/files/homework/students/" +
                            homework.getTeacherFileName().substring(0, homework.getTeacherFileName().indexOf(".")));
                    File file = new File(studentHomeworkUri);
                    String files[];
                    files = file.list();
                    int fileNum = files.length;
            %>
            <tr>
                <td><%=homework.getTeacherFileName().substring(0, homework.getTeacherFileName().indexOf("."))%>
                </td>
                <td><%=teacher.getTeacherName()%>
                </td>
                <td><%=DateFormatUtils.format(homework.getDeadline(), "yyyy-MM-dd HH:MM:SS")%>
                </td>
                <td><a href="/admin/score/findByHomework/show?homeworkID=<%=homework.getHomeworkID()%>"><i
                        class="icon icon-edit">查询</i></a></td>
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
