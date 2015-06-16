<%@ page import="com.springapp.mvc.entity.Question" %>
<%@ page import="java.util.List" %>
<%--
  Created by IntelliJ IDEA.
  User: maomao
  Date: 2015/4/29
  Time: 0:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=GBK" language="java" %>
<html>
<head>
    <title></title>
</head>
<body>
<div id="panel" class="panel">
    <div class="panel-body">
        <jsp:include page="question_common_ui.jsp"/>

        <%--第二个面板--%>
        <div id="panelOne" class="panel" style="width:1050px ">
            <div class="panel-body">
                <div class="alert alert-warning" align="center">
                    <h2><strong>主观题题库</strong></h2>
                </div>
                <%
                    List<Question> questions = (List<Question>) request.getAttribute("questions");
                    int count = 1;
                    for (Question question : questions) {
                %>
                <%
                    out.print(count + "、" + question.getContent());
                %>
                <br>
                <br>
                <button class="btn btn-default"><i class="icon-edit"></i> 解析</button>
                &nbsp;
                <%
                    out.write(question.getAnswer());
                %>
                <br><br>
                -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
                <br>
                <%
                        count = count + 1;
                    }
                %>
            </div>
        </div>
    </div>
</div>
</body>
</html>
