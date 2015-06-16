<%@ page import="com.springapp.mvc.entity.Homework" %>
<%@ page import="java.util.List" %>
<%--
  Created by IntelliJ IDEA.
  User: maomao
  Date: 2015/5/23
  Time: 15:26
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
            <th>��ҵ����</th>
            <th>��ҵ����</th>
            <th>��ֹʱ��</th>
            <th>����</th>
            </thead>
            <tbody>
            <%
                List<Homework> homeworks = (List<Homework>) request.getAttribute("homeworks");
                for (Homework homework : homeworks) {
            %>
            <tr>
                <td><%=homework.getTeacherFileName()%>
                </td>
                <td><%=homework.getContent()%>
                </td>
                <td><%=homework.getDeadline()%>
                </td>
                <td>
                    <a href="/admin/score/findHomeworkScoreByHomework/showLessons?homeworkID=<%=homework.getHomeworkID()%>">��ѯ</a>
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
