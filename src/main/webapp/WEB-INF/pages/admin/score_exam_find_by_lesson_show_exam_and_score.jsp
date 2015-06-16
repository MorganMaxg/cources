<%@ page import="com.springapp.mvc.entity.Exam" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.List" %>
<%--
  Created by IntelliJ IDEA.
  User: maomao
  Date: 2015/5/31
  Time: 21:42
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
            <th>考试名称</th>
            <th>截止时间</th>
            <th>状态</th>
            <th>分数</th>
            </thead>
            <tbody>
            <%
                List<Exam> examAndExamScores = (List<Exam>) request.getAttribute("examAndExamScores");
                for (Exam examAndExamScore : examAndExamScores) {
            %>
            <tr>
                <td><%=examAndExamScore.getExamTitle()%>
                </td>
                <td><%=examAndExamScore.getDeadline()%>
                </td>
                <%
                    Date date = new Date();//系统时间
                    Date deadline = examAndExamScore.getDeadline();//截止时间
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
                <td><%=examAndExamScore.getScore()%>
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
