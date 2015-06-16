<%@ page import="com.springapp.mvc.entity.Exam" %>
<%@ page import="com.springapp.mvc.entity.Lesson" %>
<%@ page import="java.util.List" %>
<%--
  Created by IntelliJ IDEA.
  User: maomao
  Date: 2015/5/24
  Time: 12:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
    <script language="JavaScript" type="text/javascript" src="/My97DatePicker/WdatePicker.js"></script>
    <style type="text/css">
        #panelTwo {
            float: left;
            display: inline;
        <%--将面板设置成内联元素可以使2个不同的块级元素放在同一行--%>
        }
    </style>
</head>
<body>
<form action="/admin/exam/examControl/releaseExam/release" method="post">
    <jsp:include page="exam_common_ui.jsp"></jsp:include>
    <div id="panelOne" class="panel" style="width: 1050px" align="center">
        <div class="panel-body" align="center">
            <%--内嵌3个面板--%>
            <div id="panelTwo" class="panel" style="width: 335px">
                <div class="panel-body">
                    <div class="alert alert-info" align="center">
                        <strong><h4>请在以下试卷中选择一份试卷进行测验</h4></strong>
                    </div>
                    <%
                        List<Exam> findAllExamTitles = (List<Exam>) request.getAttribute("findAllExamTitles");
                        for (Exam exam : findAllExamTitles) {
                    %>
                    <div>
                        <h4>
                            <div style="float:left">
                                <input type="radio" name="examTitle" value="<%=exam.getExamID()%>">
                                <a href="/admin/exam/find?examID=<%=exam.getExamID()%>"><%
                                    out.print(exam.getExamTitle());%></a>
                            </div>
                        </h4>
                    </div>
                    <br>
                    <%
                        }
                    %>
                </div>
            </div>
            <div id="panelTwo" class="panel" style="width: 335px">
                <div class="panel-body">
                    <div class="alert alert-warning" align="center">
                        <strong><h4>请选择参加考试的学生</h4></strong>
                    </div>
                    <%
                        List<Lesson> lessons = (List<Lesson>) request.getAttribute("lessons");
                        for (Lesson lesson : lessons) {
                    %>
                    <div>
                        <h4>
                            <div style="float:left">
                                <input type="checkbox" name="lessonName" value="<%=lesson.getLessonID()%>">
                                <a href=""><%out.print(lesson.getLessonName());%></a>
                            </div>
                        </h4>
                    </div>
                    '
                    <br>
                    <%
                        }
                    %>
                </div>
            </div>
            <div id="panelTwo" class="panel" style="width: 335px">
                <div class="panel-body">
                    <div class="panel-body">
                        <div class="alert alert-success" align="center">
                            <strong><h4>请选择考试截止时间</h4></strong>
                        </div>
                    </div>
                    <tr style="float: left">
                        <td> 截止日期：</td>
                        <td><input type="text" width="100px" name="deadline" id="d233" onFocus="WdatePicker({startDate:'%y-%M-01 00:00:00',
                       dateFmt:'yyyy-MM-dd HH:mm:ss',alwaysUseStartDate:true})"/></td>
                    </tr>
                </div>
            </div>
            <div align="center">
                <input type="submit" name="submit" value="发布考试">
            </div>
        </div>
    </div>
</form>
</body>
</html>
