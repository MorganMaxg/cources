<%@ page import="com.springapp.mvc.entity.Lesson" %>
<%@ page import="java.util.List" %>
<%--
  Created by IntelliJ IDEA.
  User: maomao
  Date: 2015/3/11
  Time: 14:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=GBK" language="java" %>
<html>
<head>
    <title>���ѧ��</title>
</head>
<body>
<jsp:include page="student_common_ui.jsp"></jsp:include>
<form action="/admin/add/save" method="post">
    <div id="panelOne" class="panel" style="width: 1050px">
        <div class="panel-body">
            <div id="panelTwo" class="panel" style="width: 500px">
                <div class="panel-body">
                    <table class="table">
                        <tr>
                            <th width='200px'></th>
                            <th width='10px'></th>
                        </tr>
                        <tr>
                            <td><strong>������ѧ��ѧ��:</strong></td>
                            <td><input type="text" name="studentID" class='form-control' placeholder="������ѧ��ѧ��"></td>
                        </tr>
                        <tr>
                            <td><strong>������ѧ������:</strong></td>
                            <td><input type="text" name="studentName" class='form-control' placeholder="������ѧ������"></td>
                        </tr>
                        <tr>
                            <td><strong>������ѧ���༶:</strong></td>
                            <td><input type="text" name="className" class='form-control' placeholder="������ѧ���༶"></td>
                        </tr>
                    </table>
                </div>
            </div>
            <div id="panelTwo" class="panel" style="width: 500px">
                <div class="panel-body">
                    <div class="alert alert-info" align="center">
                        ��ѡ��ѧ���İ༶
                    </div>
                    <%
                        List<Lesson> lessons = (List<Lesson>) request.getAttribute("lessons");
                        for (Lesson lesson : lessons) {
                    %>
                    <input type="radio" name="lessonRadio" value="<%=lesson.getLessonID()%>"><%=lesson.getLessonName()%>
                    <br>
                    <%
                        }
                    %>
                </div>
            </div>
            <tr>
                <div align="center">
                    <td><input type="submit" name="submit" value="�ύ"></td>
                    <td><input type="reset" name="reset" value="����"></td>
                </div>
            </tr>
        </div>
    </div>
</form>
</body>
</html>
