<%@ page import="com.springapp.mvc.entity.Exam" %>
<%@ page import="java.util.List" %>
<%--
  Created by IntelliJ IDEA.
  User: maomao
  Date: 2015/5/21
  Time: 14:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=GBK" language="java" %>
<html>
<head>
    <title></title>
</head>
<body>
<jsp:include page="exam_common_ui.jsp"/>
<div id="panelOne" class="panel" style="width:850px ">
    <div class="panel-body">
        <%
            List<Exam> findAllExamTitles = (List<Exam>) request.getAttribute("findAllExamTitles");
            for (Exam exam : findAllExamTitles) {
        %>
        <div>
            <h4>
                <div style="float:left">
                    <li>
                        <a href="/admin/exam/find?examID=<%=exam.getExamID()%>"><%out.print(exam.getExamTitle());%></a>
                    </li>
                </div>
            </h4>
        </div>
        <br>
        <%
            }
        %>
    </div>
</div>
</body>
</html>
