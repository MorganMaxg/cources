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
    <title>֪ͨ</title>
    <script>
        function deleteAlert() {
            alert('��ȷ��Ҫɾ��ô?');
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
        <%--��������ó�����Ԫ�ؿ���ʹ2����ͬ�Ŀ鼶Ԫ�ط���ͬһ��--%>
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
                        <a href="/admin/message/management"><i class="icon-th"></i> ����֪ͨ</a>
                    </li>
                    <li>
                        <a href="/admin/message/addMessage"><i class="icon-plus-sign"></i> ���֪ͨ</a>
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
                <th>����</th>
                <th>����</th>
                <th>��ʦ</th>
                <th>ʱ��</th>
                <th>����</th>
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
                       class="icon-wrench">����</a>
                    &nbsp;&nbsp;
                    <a href="/admin/message/deleteMessage?messageID=<%=message.getMessageID()%>" class="icon-remove"
                       onclick="deleteAlert()">ɾ��</a>
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

