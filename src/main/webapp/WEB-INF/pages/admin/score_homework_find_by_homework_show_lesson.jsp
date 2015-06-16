<%@ page import="com.springapp.mvc.entity.Homework" %>
<%@ page import="java.util.List" %>
<%--
  Created by IntelliJ IDEA.
  User: maomao
  Date: 2015/5/28
  Time: 16:31
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
            List<Homework> homeworkLessons = (List<Homework>) request.getAttribute("lessons");
            for (Homework homework : homeworkLessons) {
        %>
        <div class="example" contenteditable="false" align="center">
            <nav class="menu" data-toggle='menu' style='width: 200px'>
                <ul class="nav nav-primary">
                    <li>
                        <a href="/admin/score/findHomeworkScoreByHomework/showStudents?lessonID=<%=homework.getLessonID()%>&homeworkID=<%=request.getAttribute("homeworkID")%>"><%=homework.getLessonName()%>
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
