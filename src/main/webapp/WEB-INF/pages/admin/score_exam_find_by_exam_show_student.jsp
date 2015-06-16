<%@ page import="com.springapp.mvc.entity.Exam" %>
<%@ page import="java.util.List" %>
<%--
  Created by IntelliJ IDEA.
  User: maomao
  Date: 2015/5/30
  Time: 11:47
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
            <th>班级</th>
            <th>考试成绩</th>
            </thead>
            <tbody>
            <%
                List<Exam> examStudentScores = (List<Exam>) request.getAttribute("examStudentScores");
                for (Exam examStudentScore : examStudentScores) {
            %>
            <tr>
                <td><%=examStudentScore.getStudentID()%>
                </td>
                <td><%=examStudentScore.getStudentName()%>
                </td>
                <td><%=examStudentScore.getClassName()%>
                </td>
                <td><%=examStudentScore.getScore()%>
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
