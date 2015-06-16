<%@ page import="com.springapp.mvc.entity.Homework" %>
<%@ page import="java.util.List" %>
<%--
  Created by IntelliJ IDEA.
  User: maomao
  Date: 2015/5/30
  Time: 10:22
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
            <th>作业名称</th>
            <th>作业内容</th>
            <th>截止时间</th>
            <th>分数</th>
            </thead>
            <%
                List<Homework> studentHomeworks = (List<Homework>) request.getAttribute("studentHomeworks");
                for (Homework studentHomework : studentHomeworks) {
            %>
            <tr>
                <td><%=studentHomework.getTeacherFileName().substring(0, studentHomework.getTeacherFileName().indexOf("."))%>
                </td>
                <td><%=studentHomework.getContent()%>
                </td>
                <td><%=studentHomework.getDeadline()%>
                </td>
                <td><%=studentHomework.getScore()%>
                </td>
            </tr>
            <%
                }
            %>
            <tbody>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>
