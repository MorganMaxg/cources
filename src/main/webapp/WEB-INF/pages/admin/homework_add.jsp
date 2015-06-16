<%@ page import="com.springapp.mvc.entity.Lesson" %>
<%@ page import="java.util.List" %>
<%--
  Created by IntelliJ IDEA.
  User: maomao
  Date: 2015/5/3
  Time: 17:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=GBK" language="java" %>
<html>
<head>
    <title></title>
    <style type="text/css">
        #panelOne .panel-body #panelTwo {
            float: left;
            display: inline;
        <%--将面板设置成内联元素可以使2个不同的块级元素放在同一行--%>
        }
    </style>
    <script language="JavaScript" type="text/javascript" src="/My97DatePicker/WdatePicker.js"></script>
</head>
<body>
<form action="/admin/homework/uploadHomework/save" method="POST" enctype="multipart/form-data">
    <jsp:include page="homework_common_ui.jsp"></jsp:include>
    <div id="panelOne" class="panel" style="width:1050px ">
        <div class="panel-body">
            <div id="panelTwo" class="panel" style="width:500px ">
                <div class="panel-body">
                    <table class="table">
                        <tr>
                            <th>作业标题</th>
                            <td><input type="text" name="homeworkName"></td>
                        </tr>
                        <tr>
                            <th>作业内容</th>
                            <td><input type="text" name="content"></td>
                        </tr>
                        <tr>
                            <th>作业文件</th>
                            <td><input type="file" name="files" multiple/></td>
                        </tr>
                        <tr>
                            <th>选择截止时间</th>
                            <td>
                                <input type="text" name="deadline" id="d233" onFocus="WdatePicker({startDate:'%y-%M-01 00:00:00',
                       dateFmt:'yyyy-MM-dd HH:mm:ss',alwaysUseStartDate:true})"/>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
            <div id="panelTwo" class="panel" style="width:500px ">
                <div class="panel-body">
                    <div class="alert alert-success" align="center">
                        <strong>请选择所要发布学生的课程</strong>
                    </div>
                    <%
                        List<Lesson> lessons = (List<Lesson>) request.getAttribute("lessons");
                        for (Lesson lesson : lessons) {
                    %>
                    <div class="example" contenteditable="false" align="center">
                        <nav class="menu" data-toggle='menu' style='width: 480px'>
                            <ul class="nav nav-primary">
                                <li>
                                    <h4><input type="checkbox" name="lessonCheckBox"
                                               value="<%=lesson.getLessonID()%>"><%=lesson.getLessonName()%>
                                    </h4>
                                </li>
                            </ul>
                        </nav>
                    </div>
                    <%
                        }
                    %>
                </div>
            </div>

            <div align="center">
                <tr>
                    <input type="submit" name="homeworkSubmit" value="提交">
                </tr>
            </div>

        </div>
    </div>
</form>
</body>
</html>
