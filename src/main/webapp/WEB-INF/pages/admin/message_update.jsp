<%--
  Created by IntelliJ IDEA.
  User: maomao
  Date: 2015/4/20
  Time: 15:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=GBK" language="java" %>
<html>
<head>
    <title></title>
</head>
<body>
<jsp:include page="common_ui.jsp"></jsp:include>
<form action="/admin/message/updateMessage/save" method="post">
    <input type="text" name="messageID" class="hidden" value="<%=request.getAttribute("messageID")%>">

    <div class="panel panel-primary">
        <div class="panel-body" align="center">
            <div id="panelOne" class="panel" style="width: 500px">
                <div class="panel-body">
                    <table class="table">
                        <tr>
                            <th width='200px'></th>
                            <th width='10px'></th>
                        </tr>
                        <tr>
                            <td><strong>需要修改的通知标题:</strong></td>
                            <td><input type="text" name="title" class='form-control' placeholder="请输入新标题"></td>
                        </tr>
                        <tr>
                            <td><strong>需要修改的通知内容:</strong></td>
                            <td><input type="text" name="messageContent" class='form-control' placeholder="请输入新的内容">
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </div>
    <tr>
        <div align="center">
            <td><input type="submit" name="submit" value="提交"></td>
            <td><input type="reset" name="reset" value="重置"></td>
        </div>
    </tr>
</form>
</body>
</html>
