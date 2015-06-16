<%@ page import="com.alibaba.fastjson.JSON" %>
<%@ page import="com.springapp.mvc.entity.Question" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%--
  Created by IntelliJ IDEA.
  User: maomao
  Date: 2015/4/28
  Time: 23:46
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
                <div class="alert alert-success" align="center">
                    <h2><strong>单选题题库</strong></h2>
                </div>
                <%
                    List<Question> questions = (List<Question>) request.getAttribute("questions");
                    int count = 1;
                    for (Question question : questions) {
                %>
                <%
                    Map jspMap = new HashMap();
                    Map map = new HashMap();
                    map = JSON.parseObject(question.getChoices());
                    for (Object o : map.entrySet()) {
                        Map.Entry<String, String> entry = (Map.Entry<String, String>) o;
                        jspMap.put(entry.getKey(), entry.getValue());
                    }
                %>
                <%
                    out.print(count + "、" + question.getContent());
                %>
                <br>
                <%
                    out.write("A、" + jspMap.get("A"));
                %>
                <br>
                <%
                    out.write("B、" + jspMap.get("B"));
                %>
                <br>
                <%
                    out.write("C、" + jspMap.get("C"));
                %>
                <br>
                <%
                    out.write("D、" + jspMap.get("D"));
                %>
                <br><br>
                <button class="btn btn-default"><i class="icon-edit"></i> 答案</button>
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
