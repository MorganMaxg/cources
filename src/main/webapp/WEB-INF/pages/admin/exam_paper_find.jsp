<%@ page import="com.alibaba.fastjson.JSON" %>
<%@ page import="com.springapp.mvc.entity.Exam" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%--
  Created by IntelliJ IDEA.
  User: maomao
  Date: 2015/5/15
  Time: 15:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=GBK" language="java" %>
<html>
<head>
    <title>考试试卷查询</title>
</head>
<body>
<jsp:include page="exam_common_ui.jsp"/>
<div id="panelOne" class="panel" style="width: 1050px">
    <div class="panel-body">
        <%
            String tempExamTitle = (String) request.getAttribute("tempExamTitle");
        %>
        <div align="center">
            <h1><%=tempExamTitle%>
            </h1>
        </div>
        <h2>选择题、</h2>
        <%
            List<Exam> allSingleChoiceExams = (List<Exam>) request.getAttribute("allQuestions");
            int count1 = 1;
            for (Exam exam : allSingleChoiceExams) {

        %>
        <%
            if (exam.getQuestionType().equals("单选题")) {
        %>
        <br>
        <%
            Map jspMap = new HashMap();
            Map map = new HashMap();
            map = JSON.parseObject(exam.getChoices());
            for (Object o : map.entrySet()) {
                Map.Entry<String, String> entry = (Map.Entry<String, String>) o;
                jspMap.put(entry.getKey(), entry.getValue());
            }
        %>
        <%
            out.print(count1 + "、" + exam.getContent());
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
            out.write(exam.getAnswer());
        %>
        <br><br>

        <%
            count1 = count1 + 1;
        %>
        <%
            }
        %>
        <%
            }
        %>
        -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
        <br>

        <h2>判断题、</h2>
        <%
            List<Exam> allCheckingExams = (List<Exam>) request.getAttribute("allQuestions");
            int count2 = 1;
            for (Exam checkingExam : allCheckingExams) {
        %>
        <%
            if (checkingExam.getQuestionType().equals("判断题")) {
        %>
        <%

            Map jspMap = new HashMap();
            Map map = new HashMap();
            map = JSON.parseObject(checkingExam.getChoices());
            for (Object o : map.entrySet()) {
                Map.Entry<String, String> entry = (Map.Entry<String, String>) o;
                jspMap.put(entry.getKey(), entry.getValue());
            }
        %>
        <%
            out.print(count2 + "、" + checkingExam.getContent());
        %>
        <br><br>
        <button class="btn btn-default"><i class="icon-edit"></i> 答案</button>
        &nbsp;
        <%
            out.write(checkingExam.getAnswer());
        %>
        <br><br>
        <%
            count2 = count2 + 1;
        %>
        <%
            }
        %>
        <%
            }
        %>
        -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
        <h2>简答题、</h2>
        <%
            List<Exam> allShortAnswerExams = (List<Exam>) request.getAttribute("allQuestions");
            int count3 = 1;
            for (Exam shortAnswerExam : allShortAnswerExams) {

        %>
        <%
            if (shortAnswerExam.getQuestionType().equals("简答题")) {
        %>
        <%
            out.print(count3 + "、" + shortAnswerExam.getContent());
        %>
        <br>
        <br>
        <button class="btn btn-default"><i class="icon-edit"></i> 答案</button>
        &nbsp;
        <%
            out.write(shortAnswerExam.getAnswer());
        %>
        <br><br>
        <%
                count3 = count3 + 1;
            }
        %>
        <%
            }
        %>
        -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
        <br>

        <h2>主观题、</h2>
        <%
            List<Exam> allSubjectiveExams = (List<Exam>) request.getAttribute("allQuestions");
            int count4 = 1;
            for (Exam subjectiveExam : allSubjectiveExams) {

        %>
        <%
            if (subjectiveExam.getQuestionType().equals("主观题")) {
        %>
        <%
            out.print(count4 + "、" + subjectiveExam.getContent());
        %>
        <br>
        <br>
        <button class="btn btn-default"><i class="icon-edit"></i> 解析</button>
        &nbsp;
        <%
            out.write(subjectiveExam.getAnswer());
        %>
        <br><br>
        -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
        <br>
        <%
            count4 = count4 + 1;
        %>
        <%
            }
        %>
        <%
            }
        %>
    </div>
</div>
</body>
</html>
