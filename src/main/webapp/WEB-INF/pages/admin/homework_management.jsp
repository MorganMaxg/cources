<%@ page import="com.springapp.mvc.entity.Homework" %>
<%@ page import="org.apache.commons.lang3.time.DateFormatUtils" %>
<%@ page import="java.util.List" %>
<%--
  Created by IntelliJ IDEA.
  User: maomao
  Date: 2015/5/3
  Time: 17:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=GBK" language="java" %>
<html>
<head>
    <title>��ҵ����</title>
    <script>
        function deleteAlert() {
            alert('��ȷ��Ҫɾ��ô?');
        }
    </script>
</head>
<body>
<jsp:include page="homework_common_ui.jsp"></jsp:include>
<div id="panelOne" class="panel" style="width:1050px ">
    <div class="panel-body">
        <table class='table table-condensed table-hover table-striped table-borderless table-fixed'>
            <thead>
            <tr>
                <th>��ҵ����</th>
                <th>��ҵ����</th>
                <th>��ֹʱ��</th>
                <th>����</th>
                <th>����</th>
            </tr>
            </thead>
            <tbody>
            <%
                List<Homework> homeworks = (List<Homework>) request.getAttribute("homeworks");
                for (Homework homework : homeworks) {
            %>
            <tr>
                <th>
                    <%=homework.getHomeworkName()%>
                </th>
                <th><%out.print(homework.getContent());%></th>
                <th><%=DateFormatUtils.format(homework.getDeadline(), "yyyy-MM-dd HH:MM:SS")%>
                </th>
                <th>
                    <a href="/admin/homework/download?uri=<%=homework.getTeacherUri()%>&fileName=<%=homework.getTeacherFileName()%>"><%
                        out.print(homework.getTeacherFileName().substring(0, homework.getTeacherFileName().indexOf(".")));%></a>
                </th>
                <th>
                    <a href="/admin/homework/download?uri=<%=homework.getTeacherUri()%>&fileName=<%=homework.getTeacherFileName()%>"
                       class="icon-download-alt">����</a>&nbsp;
                    <a href="/admin/homework/deleteHomework?homeworkID=<%=homework.getHomeworkID()%>"
                       class="icon-remove" onclick="deleteAlert()">ɾ��</a>
                </th>
                <br>
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
