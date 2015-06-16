<%@ page import="com.springapp.mvc.entity.Lesson" %>
<%@ page import="java.util.List" %>
<%--
  Created by IntelliJ IDEA.
  User: maomao
  Date: 2015/6/1
  Time: 13:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=GBK" language="java" %>
<html>
<head>
    <title></title>
</head>
<body>
<jsp:include page="score_common_ui.jsp"></jsp:include>
<div id="panelOne" class="panel" style="width: 800px">
    <div class="panel-body">
        <table class='table table-condensed table-hover table-striped table-borderless table-fixed'>
            <thead>
            <th>学号</th>
            <th>姓名</th>
            <th>班级</th>
            <th>总成绩</th>
            </thead>
            <tbody>
            <%
                List<Lesson> lessonStudentsAndFinalScores = (List<Lesson>) request.getAttribute("lessonStudentsAndFinalScores");
                for (Lesson lessonStudentsAndFinalScore : lessonStudentsAndFinalScores) {
            %>
            <tr>
                <td><%=lessonStudentsAndFinalScore.getStudentID()%>
                </td>
                <td><%=lessonStudentsAndFinalScore.getStudentName()%>
                </td>
                <td><%=lessonStudentsAndFinalScore.getClassName()%>
                </td>
                <td><%=lessonStudentsAndFinalScore.getLessonScore()%>
                </td>
            </tr>
            <%
                }
            %>
            </tbody>
        </table>
    </div>
</div>
<div id="panelOne" class="panel" style="width: 250px">
    <div class="panel-body" align="center">
        <a href="/admin/score/findFinalScore/showStudentsAndFinalScore/find?lessonID=<%=request.getAttribute("lessonID")%>">
            <h2>查询</h2></a>
    </div>
</div>
</body>
</html>
