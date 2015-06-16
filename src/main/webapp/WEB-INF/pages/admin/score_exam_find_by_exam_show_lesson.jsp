<%@ page import="com.springapp.mvc.entity.Exam" %>
<%@ page import="java.util.List" %>
<%--
  Created by IntelliJ IDEA.
  User: maomao
  Date: 2015/5/30
  Time: 11:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=GBK" language="java" %>
<html>
<head>
    <title></title>
</head>
<body>
<jsp:include page="score_common_ui.jsp"></jsp:include>
<div id="panelOne" class="panel" style="width: 250px">
    <div class="panel-body">
        <%
            List<Exam> examLessons = (List<Exam>) request.getAttribute("examLessons");
            for (Exam exam : examLessons) {
        %>
        <div class="example" contenteditable="false" align="center">
            <nav class="menu" data-toggle='menu' style='width: 200px'>
                <ul class="nav nav-primary">
                    <li>
                        <a href="/admin/score/findExamScoreByExam/showStudents?lessonID=<%=exam.getLessonID()%>&examID=<%=exam.getExamID()%>"><%=exam.getLessonName()%>
                        </a>
                    </li>
                </ul>
            </nav>
        </div>
        <%
            }
        %>
    </div>
</div>
</body>
</html>
