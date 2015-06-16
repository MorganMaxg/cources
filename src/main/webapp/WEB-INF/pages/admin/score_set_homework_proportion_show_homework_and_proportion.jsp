<%@ page import="com.springapp.mvc.entity.Homework" %>
<%@ page import="org.apache.commons.lang3.time.DateFormatUtils" %>
<%@ page import="java.util.List" %>
<%--
  Created by IntelliJ IDEA.
  User: maomao
  Date: 2015/6/1
  Time: 10:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=GBK" language="java" %>
<html>
<head>
    <title></title>
</head>
<body>
<form action="/admin/score/setHomeworkProportion/showHomeworkAndProportion/save?lessonID=<%=request.getAttribute("lessonID")%>"
      method="post">
    <jsp:include page="score_common_ui.jsp"></jsp:include>
    <div id="panelOne" class="panel" style="width: 1050px">
        <div class="panel-body">
            <table class='table table-condensed table-hover table-striped table-borderless table-fixed'>
                <thead>
                <th>��ҵ����</th>
                <th>��ҵ����</th>
                <th>��ֹʱ��</th>
                <th>����</th>
                <th>��������</th>
                </thead>
                <tbody>
                <%
                    List<Homework> lessonHomeworks = (List<Homework>) request.getAttribute("lessonHomeworks");
                    for (Homework lessonHomework : lessonHomeworks) {
                %>
                <tr>
                    <td><%=lessonHomework.getTeacherFileName()%>
                    </td>
                    <td><%=lessonHomework.getContent()%>
                    </td>
                    <td><%=DateFormatUtils.format(lessonHomework.getDeadline(), "yyyy-MM-dd HH:MM:SS")%>
                    </td>
                    <td>
                        <%=lessonHomework.getProportion()%>
                    </td>
                    <td>
                        <input type="text" name="arrProportion">
                        <input type="text" name="arrHomeworkID" value="<%=lessonHomework.getHomeworkID()%>"
                               class="hidden">
                    </td>
                </tr>
                <%
                    }
                %>
                </tbody>
            </table>
            <div align="center">
                <input type="submit" name="submit" value="�ύ">
                <input type="reset" name="reset" value="����">
            </div>
        </div>
    </div>

</form>
</body>
</html>
