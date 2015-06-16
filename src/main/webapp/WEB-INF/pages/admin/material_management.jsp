<!DOCTYPE html>
<%@ page import="com.springapp.mvc.entity.Material" %>
<%@ page import="org.apache.commons.lang3.time.DateFormatUtils" %>
<%@ page import="java.util.List" %>
<%--
  Created by IntelliJ IDEA.
  User: maomao
  Date: 2015/4/20
  Time: 18:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=GBK" language="java" %>
<html>
<head>
    <title>���Ϲ���</title>
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
<%request.setCharacterEncoding("GBK");%>
<%response.setCharacterEncoding("GBK");%>
<jsp:include page="common_ui.jsp"></jsp:include>
<div id="panelOne" class="panel" style="width: 250px">
    <div class="panel-body">
        <div class="example" contenteditable="false" align="center">
            <nav class="menu" data-toggle='menu' style='width: 200px'>
                <ul class="nav nav-primary">
                    <li>
                        <a href="/admin/material/management"><i class="icon-th"></i> ��������</a>
                    </li>
                    <li>
                        <a href="/admin/material/uploadMaterial"><i class="icon-plus-sign"></i> �ϴ�����</a>
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
                <th>���ϱ���</th>
                <th>��ʦ</th>
                <th>ʱ��</th>
                <th>����</th>
            </tr>
            </thead>
            <tbody>
            <%
                List<Material> materials = (List<Material>) request.getAttribute("material");
                for (Material material : materials) {
            %>
            <tr>
                <th>
                    <a href="/admin/material/download?uri=<%=material.getUri()%>&materialName=<%=material.getMaterialName()%>">
                        <%out.print(material.getMaterialName());%></a></th>
                <th><%out.print(material.getTeacherName());%></th>
                <th><%=DateFormatUtils.format(material.getCreateDate(), "yyyy-MM-dd")%>
                </th>
                <th>
                    <a href="/admin/material/download?uri=<%=material.getUri()%>&materialName=<%=material.getMaterialName()%>"
                       class="icon-download-alt">����</a>&nbsp;
                    <a href="/admin/material/deleteMaterial?materialID=<%=material.getMaterialID()%>"
                       class="icon-remove" onclick="deleteAlert()">ɾ��</a>
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
