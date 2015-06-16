<%@ page import="com.springapp.mvc.entity.Lesson" %>
<%@ page import="java.util.List" %>
<%--
  Created by IntelliJ IDEA.
  User: maomao
  Date: 2015/5/23
  Time: 14:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
</head>
<body>
<jsp:include page="score_common_ui.jsp"></jsp:include>
<div id="panelOne" class="panel" style="width: 250px">
    <div class="panel-body">
        <%
            List<Lesson> lessons = (List<Lesson>) request.getAttribute("lessons");
            for (Lesson lesson : lessons) {
        %>
        <div class="example" contenteditable="false" align="center">
            <nav class="menu" data-toggle='menu' style='width: 200px'>
                <ul class="nav nav-primary">
                    <li>
                        <a href="/admin/score/setHomeworkProportion/showHomeworkAndProportion?lessonID=<%=lesson.getLessonID()%>"><%=lesson.getLessonName()%>
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
