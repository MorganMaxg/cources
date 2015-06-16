<%@ page import="com.springapp.mvc.entity.Message" %>
<%@ page import="org.apache.commons.lang3.time.DateFormatUtils" %>
<%@ page import="java.util.List" %>
<%--
  Created by IntelliJ IDEA.
  User: maomao
  Date: 2015/4/7
  Time: 15:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=GBK" language="java" %>
<html>
<head>
    <title>通知</title>
    <script>
        function deleteAlert() {
            alert('你确定要删除么?');
        }
    </script>
    <style type="text/css">
        #panel {
            width: 1350px;
            float: left;
        }

        #panelOne {
            float: left;
            display: inline;
        <%--将面板设置成内联元素可以使2个不同的块级元素放在同一行--%>
        }
    </style>
</head>
<body>
<jsp:include page="common_ui.jsp"></jsp:include>
<div id="panelOne" class="panel" style="width: 250px">
    <div class="panel-body">
        <div class="example" contenteditable="false" align="center">
            <nav class="menu" data-toggle='menu' style='width: 200px'>
                <ul class="nav nav-primary">
                    <li>
                        <a href="/admin/message/management"><i class="icon-th"></i> 管理通知</a>
                    </li>
                    <li>
                        <a href="/admin/message/addMessage"><i class="icon-plus-sign"></i> 添加通知</a>
                    </li>
                </ul>
            </nav>
        </div>
    </div>
</div>

<div id="panelOne" class="panel" style="width: 1050px">
    <div class="panel-body">
        <table class='table table-condensed table-hover table-striped table-borderless table-fixed'>
            <thead>
            <tr>
                <th>标题</th>
                <th>内容</th>
                <th>老师</th>
                <th>时间</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>
            <%
                List<Message> messages = (List) request.getAttribute("message");
                for (Message message : messages) {
            %>
            <tr>
                <th><%out.print(message.getTitle());%></th>
                <th><%out.print(message.getMessageContent());%></th>
                <th><%out.print(message.getTeacherName());%></th>
                <th><%=DateFormatUtils.format(message.getCreateDate(), "yyyy-MM-dd HH:MM:SS")%>
                </th>
                <th>
                    <a href="/admin/message/updateMessage?messageID=<%=message.getMessageID()%>"
                       class="icon-wrench">更新</a>
                    &nbsp;&nbsp;
                    <a href="/admin/message/deleteMessage?messageID=<%=message.getMessageID()%>" class="icon-remove"
                       onclick="deleteAlert()">删除</a>
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

