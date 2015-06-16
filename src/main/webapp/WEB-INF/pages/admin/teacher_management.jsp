<%@ page import="com.springapp.mvc.entity.Teacher" %>
<%@ page import="java.util.List" %>
<%--
  Created by IntelliJ IDEA.
  User: maomao
  Date: 2015/6/16
  Time: 16:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=GBK" language="java" %>
<html>
<head>
    <title>��ʦ����</title>
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
                        <a href="/admin/teacher/management"><i class="icon icon-list-alt"></i>�鿴��ʦ</a>
                    </li>
                    <li>
                        <a href="/admin/teacher/add"><i class="icon icon-plus-sign"></i>��ӽ�ʦ</a>
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
                <th>����</th>
                <th>����</th>
            </tr>
            </thead>
            <tbody>
            <%
                List<Teacher> teachers = (List<Teacher>) request.getAttribute("teachers");
                for (Teacher teacher : teachers) {
            %>
            <tr>
                <td><%=teacher.getTeacherID()%>
                </td>
                <td><%=teacher.getTeacherName()%>
                </td>
                <%
                    if (teacher.getType() == 0) {
                %>
                <td>��ͨ��ʦ</td>
                <%
                    }
                %>
                <%
                    if (teacher.getType() == 1) {
                %>
                <td>����Ա</td>
                <%
                    }
                %>
                <td>
                    <a href="/admin/teacher/update?id=<%=teacher.getId()%>" class="icon-wrench">����</a>
                    &nbsp;&nbsp;
                    <a href="/admin/teacher/delete?id=<%=teacher.getId()%>" class="icon-remove" onclick="deleteAlert()">ɾ��</a>
                </td>
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
