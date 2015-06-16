<%--
  Created by IntelliJ IDEA.
  User: maomao
  Date: 2015/4/29
  Time: 13:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=GBK" language="java" %>
<html>
<head>
    <title></title>
</head>
<body>
<form action="/admin/question/addChecking/save" method="post">
    <div id="panel" class="panel">
        <div class="panel-body">
            <jsp:include page="question_common_ui.jsp"/>
            <%--第二个面板--%>
            <div id="panelOne" class="panel" style="width:1050px ">
                <div class="panel-body">
                    问题： &nbsp; &nbsp; &nbsp;<input type="text" name="content" style="width: 600px"/><br><br>
                    答案： &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="answer" value="1">对&nbsp;&nbsp;&nbsp;
                    <input type="radio" name="answer" value="2">错
                    <br><br>

                    <div align="center">
                        <input type="submit" name="submit" value="提交"/> &nbsp; &nbsp;
                        <input type="reset" name="reset" value="重置"/>
                    </div>

                </div>
            </div>
        </div>
    </div>

</form>
</body>
</html>
