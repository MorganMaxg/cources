<%--
  Created by IntelliJ IDEA.
  User: maomao
  Date: 2015/5/25
  Time: 13:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
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

        #panelOne #panelTwo {
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
                        <a href="/admin/studentManage"><i class="icon icon-list-alt"></i>查看学生</a>
                    </li>
                    <li>
                        <a href="/admin/addStudent"><i class="icon icon-plus-sign"></i>添加学生</a>
                    </li>
                    <li>
                        <a href="/admin/lesson/add"><i class="icon icon-plus-sign"></i>添加课程</a>
                    </li>
                    <%--<li>--%>
                    <%--<a href="/admin/findStudent"><i class="icon icon-search"></i>查找学生</a>--%>
                    <%--</li>--%>
                </ul>
            </nav>
        </div>
    </div>
</div>
</body>
</html>
