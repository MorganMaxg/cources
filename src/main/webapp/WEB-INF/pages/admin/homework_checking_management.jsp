<%@ page import="com.springapp.mvc.entity.HomeworkStudents" %>
<%@ page import="java.util.List" %>
<%--
  Created by IntelliJ IDEA.
  User: maomao
  Date: 2015/5/21
  Time: 16:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=GBK" language="java" %>
<html>
<head>
    <title></title>
    <style type="text/css">
        .submitButton input {
            background: url("/button/submit1.gif") no-repeat 20px center;
            background-color: #f9f9f9;
        }
    </style>
</head>
<body>
<%int tempHomeworkID = (Integer) request.getAttribute("homeworkID");%>
<form action="/admin/homework/score/save?homeworkID=<%=tempHomeworkID%>" method="post">
    <jsp:include page="homework_common_ui.jsp"></jsp:include>
    <div id="panelOne" class="panel" style="width:1050px ">
        <div class="panel-body">
            <table class='table table-condensed table-hover table-striped table-borderless table-fixed'>
                <thead align="center">
                <th width="120px">ѧ��ѧ��</th>
                <th width="120px">ѧ������</th>
                <th width="120px">ѧ���༶</th>
                <th width="300px">��ҵ</th>
                <th width="100px">����</th>
                <th>���ķ���</th>
                </thead>
                <tbody>
                <%
                    List<HomeworkStudents> homeworkStudents = (List<HomeworkStudents>) request.getAttribute("homeworkStudents");
                %>

                <%
                    for (HomeworkStudents homeworkStudent : homeworkStudents) {
                %>
                <input type="text" name="lessonID" class="hidden" value="<%=request.getAttribute("lessonID")%>">
                <tr>
                    <td><%=homeworkStudent.getStudentID()%>
                    </td>
                    <td><%=homeworkStudent.getStudentName()%>
                    </td>
                    <td><%=homeworkStudent.getClassName()%>
                    </td>
                    <td><%=homeworkStudent.getStudentFileName()%>
                    </td>
                    <td><a href=""><i class="icon-download-alt">����</i></a></td>
                    <td><input type="text" name="score">
                        <input type="text" name="id" class="hidden" value="<%=homeworkStudent.getId()%>">
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
