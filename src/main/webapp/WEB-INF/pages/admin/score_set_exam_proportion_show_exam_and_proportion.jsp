<%@ page import="com.springapp.mvc.entity.Exam" %>
<%@ page import="org.apache.commons.lang3.time.DateFormatUtils" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.List" %>
<%--
  Created by IntelliJ IDEA.
  User: maomao
  Date: 2015/6/1
  Time: 11:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=GBK" language="java" %>
<html>
<head>
    <title></title>
</head>
<body>
<form action="/admin/score/setExamProportion/showExamAndProportion/save?lessonID=<%=request.getAttribute("lessonID")%>"
      method="post">
    <jsp:include page="score_common_ui.jsp"></jsp:include>
    <div id="panelOne" class="panel" style="width: 1050px">
        <div class="panel-body">
            <table class='table table-condensed table-hover table-striped table-borderless table-fixed'>
                <thead>
                <th>考试名称</th>
                <th>截止时间</th>
                <th>状态</th>
                <th>比例</th>
                <th>重新设置</th>
                </thead>
                <tbody>
                <%
                    List<Exam> lessonExams = (List<Exam>) request.getAttribute("lessonExams");
                    for (Exam lessonExam : lessonExams) {
                %>
                <tr>
                    <td><%=lessonExam.getExamTitle()%>
                    </td>
                    <td><%=DateFormatUtils.format(lessonExam.getDeadline(), "yyyy-MM-dd HH:MM:SS")%>
                    </td>
                    <%
                        Date date = new Date();//系统时间
                        Date deadline = lessonExam.getDeadline();//截止时间
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
                    <td><%=lessonExam.getProportion()%>
                    </td>
                    <td>
                        <input type="text" name="arrProportion">
                        <input type="text" name="arrExamID" value="<%=lessonExam.getExamID()%>" class="=hidden">
                    </td>
                </tr>
                <%
                    }
                %>
                </tbody>
            </table>
            <div align="center">
                <input type="submit" name="submit" value="提交">
                <input type="reset" name="reset" value="重置">
            </div>
        </div>
    </div>
</form>
</body>
</html>
