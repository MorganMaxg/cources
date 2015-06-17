<%@ page import="com.springapp.mvc.entity.Exam" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.List" %>
<%--
  Created by IntelliJ IDEA.
  User: maomao
  Date: 2015/5/30
  Time: 10:55
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
            <th>��������</th>
            <th>��ֹʱ��</th>
            <th>״̬</th>
            <th>����</th>
            </thead>
            <tbody>
            <%
                List<Exam> exams = (List<Exam>) request.getAttribute("exams");
                for (Exam exam : exams) {
            %>
            <tr>
                <td><%=exam.getExamTitle()%>
                </td>
                <td><%=exam.getDeadline()%>
                </td>
                <%
                    Date date = new Date();//ϵͳʱ��
                    Date deadline = exam.getDeadline();//��ֹʱ��
                    if (date.getTime() < deadline.getTime()) {
                %>
                <td>
                    <div style="color: red">
                        <strong>������</strong>
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
                        <strong>�ѽ���</strong>
                    </div>
                </td>
                <%
                    }
                %>
                <td>
                    <a href="/admin/score/findExamScoreByExam/showLesson?examID=<%=exam.getExamID()%>">��ѯ</a>
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
