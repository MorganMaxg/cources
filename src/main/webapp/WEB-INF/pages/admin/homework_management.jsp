<%@ page import="com.springapp.mvc.entity.Homework" %>
<%@ page import="org.apache.commons.lang3.time.DateFormatUtils" %>
<%@ page import="java.util.List" %>
<%--
  Created by IntelliJ IDEA.
  User: maomao
  Date: 2015/5/3
  Time: 17:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=GBK" language="java" %>
<html>
<head>
    <title>作业管理</title>
    <script>
        function deleteAlert() {
            alert('你确定要删除么?');
        }
    </script>
</head>
<body>
<jsp:include page="homework_common_ui.jsp"></jsp:include>
<div id="panelOne" class="panel" style="width:1050px ">
    <div class="panel-body">
        <table class='table table-condensed table-hover table-striped table-borderless table-fixed'>
            <thead>
            <tr>
                <th>作业标题</th>
                <th>作业内容</th>
                <th>截止时间</th>
                <th>附件</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>
            <%
                List<Homework> homeworks = (List<Homework>) request.getAttribute("homeworks");
                for (Homework homework : homeworks) {
            %>
            <tr>
                <th>
                    <%=homework.getHomeworkName()%>
                </th>
                <th><%out.print(homework.getContent());%></th>
                <th><%=DateFormatUtils.format(homework.getDeadline(), "yyyy-MM-dd HH:MM:SS")%>
                </th>
                <th>
                    <a href="/admin/homework/download?uri=<%=homework.getTeacherUri()%>&fileName=<%=homework.getTeacherFileName()%>"><%
                        out.print(homework.getTeacherFileName().substring(0, homework.getTeacherFileName().indexOf(".")));%></a>
                </th>
                <th>
                    <a href="/admin/homework/download?uri=<%=homework.getTeacherUri()%>&fileName=<%=homework.getTeacherFileName()%>"
                       class="icon-download-alt">下载</a>&nbsp;
                    <a href="/admin/homework/deleteHomework?homeworkID=<%=homework.getHomeworkID()%>"
                       class="icon-remove" onclick="deleteAlert()">删除</a>
                </th>
                <br>
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
