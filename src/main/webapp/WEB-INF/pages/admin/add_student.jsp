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
    <title>添加学生</title>
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
                            <td><strong>请输入学生学号:</strong></td>
                            <td><input type="text" name="studentID" class='form-control' placeholder="请输入学生学号"></td>
                        </tr>
                        <tr>
                            <td><strong>请输入学生姓名:</strong></td>
                            <td><input type="text" name="studentName" class='form-control' placeholder="请输入学生姓名"></td>
                        </tr>
                        <tr>
                            <td><strong>请输入学生班级:</strong></td>
                            <td><input type="text" name="className" class='form-control' placeholder="请输入学生班级"></td>
                        </tr>
                    </table>
                </div>
            </div>
            <div id="panelTwo" class="panel" style="width: 500px">
                <div class="panel-body">
                    <div class="alert alert-info" align="center">
                        请选择学生的班级
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
                    <td><input type="submit" name="submit" value="提交"></td>
                    <td><input type="reset" name="reset" value="重置"></td>
                </div>
            </tr>
        </div>
    </div>
</form>
</body>
</html>
