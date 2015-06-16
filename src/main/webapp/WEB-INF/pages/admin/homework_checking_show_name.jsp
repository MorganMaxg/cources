<%@ page import="com.springapp.mvc.entity.Homework" %>
<%@ page import="com.springapp.mvc.entity.Teacher" %>
<%@ page import="org.apache.commons.lang3.time.DateFormatUtils" %>
<%@ page import="java.util.List" %>
<%--
  Created by IntelliJ IDEA.
  User: maomao
  Date: 2015/5/3
  Time: 17:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=GBK" language="java" %>
<html>
<head>
    <title></title>
    <script src="/js/jquery-1.11.2.min.js"></script>
</head>
<body>
<jsp:include page="homework_common_ui.jsp"></jsp:include>
<div id="panelOne" class="panel" style="width:850px ">
    <div class="panel-body">
        <table class='table table-condensed table-hover table-striped table-borderless table-fixed'>
            <thead align="center">
            <th>作业题目</th>
            <th>发布老师</th>
            <th>截止时间</th>
            <th>上交学生数</th>
            <th>操作</th>
            </thead>
            <tbody>
            <%
                Teacher teacher = (Teacher) session.getAttribute("teacher");
                List<Homework> homeworks = (List<Homework>) request.getAttribute("homeworks");

                for (Homework homework : homeworks) {
            %>
            <form id="homeworkForm">
                <input type="text" class="hidden" id="homeworkID" name="homeworkID"
                       value="<%=homework.getHomeworkID()%>">
            </form>
            <tr>
                <td>
                    <a href="/admin/checkHomework/management?homeworkID=<%=homework.getHomeworkID()%>&lessonID=<%=request.getAttribute("lessonID")%>">
                            <%=homework.getTeacherFileName().substring(0, homework.getTeacherFileName().indexOf("."))%>
                </td>
                </a>
                <td><%=teacher.getTeacherName()%>
                </td>
                <td><%=DateFormatUtils.format(homework.getDeadline(), "yyyy-MM-dd HH:MM:SS")%>
                </td>
                <td><%=homework.getCount()%>
                </td>
                <td>
                    <a href="/admin/checkHomework/management?homeworkID=<%=homework.getHomeworkID()%>&lessonID=<%=request.getAttribute("lessonID")%>"><i
                            class="icon icon-edit">批阅</i></a></td>
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
