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
    <title>资料管理</title>
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
<%request.setCharacterEncoding("GBK");%>
<%response.setCharacterEncoding("GBK");%>
<jsp:include page="common_ui.jsp"></jsp:include>
<div id="panelOne" class="panel" style="width: 250px">
    <div class="panel-body">
        <div class="example" contenteditable="false" align="center">
            <nav class="menu" data-toggle='menu' style='width: 200px'>
                <ul class="nav nav-primary">
                    <li>
                        <a href="/admin/material/management"><i class="icon-th"></i> 管理资料</a>
                    </li>
                    <li>
                        <a href="/admin/material/uploadMaterial"><i class="icon-plus-sign"></i> 上传资料</a>
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
                <th>资料标题</th>
                <th>老师</th>
                <th>时间</th>
                <th>操作</th>
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
                       class="icon-download-alt">下载</a>&nbsp;
                    <a href="/admin/material/deleteMaterial?materialID=<%=material.getMaterialID()%>"
                       class="icon-remove" onclick="deleteAlert()">删除</a>
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
