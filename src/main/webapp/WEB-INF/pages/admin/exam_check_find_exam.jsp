<%@ page import="com.springapp.mvc.entity.Exam" %>
<%@ page import="com.springapp.mvc.entity.Teacher" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.List" %>
<%--
  Created by IntelliJ IDEA.
  User: maomao
  Date: 2015/5/28
  Time: 12:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=GBK" language="java" %>
<html>
<head>
    <title></title>
</head>
<body>
<jsp:include page="exam_common_ui.jsp"></jsp:include>
<div id="panelOne" class="panel" style="width: 1050px">
    <div class="panel-body">
        <table class='table table-condensed table-hover table-striped table-borderless table-fixed'>
            <thead align="center">
            <th width="300px">��������</th>
            <th width="120px">������ʦ</th>
            <th width="400px">���Զ���</th>
            <th width="100px">״̬</th>
            <th width="100px">����</th>
            </thead>
            <tbody>
            <%
                List<Exam> exams = (List<Exam>) request.getAttribute("exams");
                Teacher teacher = (Teacher) session.getAttribute("teacher");
                for (Exam exam : exams) {
                    if (exam.getLessonID() != 0) {
            %>
            <tr>
                <td><a href="/admin/exam/find?examID=<%=exam.getExamID()%>"><%=exam.getExamTitle()%>
                </a></td>
                <td><%=teacher.getTeacherName()%>
                </td>
                <td><%=exam.getLessonName()%>
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
                    <a href="/admin/exam/checking/findLesson?examID=<%=exam.getExamID()%>&lessonID=<%=exam.getLessonID()%>"><i
                            class="icon icon-edit">����</i></a></td>
            </tr>
            <%
                    }
                }
            %>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>
