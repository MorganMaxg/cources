<%@ page import="com.springapp.mvc.entity.Student" %>
<%@ page import="java.util.List" %>
<%--
  Created by IntelliJ IDEA.
  User: maomao
  Date: 2015/5/23
  Time: 14:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
            <th>学号</th>
            <th>姓名</th>
            <th>班级</th>
            <th>成绩</th>
            </thead>
            <tbody>
            <%
                List<Student> students = (List<Student>) request.getAttribute("students");
                for (Student student : students) {
            %>
            <tr>
                <td><%=student.getStudentID()%>
                </td>
                <td><%=student.getStudentName()%>
                </td>
                <td><%=student.getClassName()%>
                </td>
                <td><a href="/admin/score/findByStudent/show?id=<%=student.getId()%>"><i
                        class="icon icon-edit">查询</i></a></td>
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
