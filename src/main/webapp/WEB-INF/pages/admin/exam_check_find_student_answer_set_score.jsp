<%@ page import="com.springapp.mvc.entity.Exam" %>
<%@ page import="java.util.List" %>
<%--
  Created by IntelliJ IDEA.
  User: maomao
  Date: 2015/5/28
  Time: 15:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=GBK" language="java" %>
<html>
<head>
    <title></title>
    <link href="/css/zui.css">
    <script src="/js/jquery-1.11.2.min.js"></script>
    <script src="/js/zui.js"></script>
    <script>
        //下一页
        $(document).ready(function () {
            $("#nextPage").on("click", function (e) {
                var currentPage = $("#currentPage").val();//当前页数
                currentPage = parseInt(currentPage) + 1;
                var studentScore = $("#studentScore").val();//学生每道考试题目成绩
                var examID = $("#examID").val();//考试ID
                var studentID = $("#studentID").val();//学生ID
                var questionID = $("#questionID").val();//题目ID
                var lessonID = $("#lessonID").val();//课程ID
                document.getElementById("checkForm").action = "/admin/exam/checking/findAnswerAndSetScore?studentScore=" + studentScore + "&examID=" + examID + "&studentID=" + studentID + "&questionID=" + questionID + "&currentPage=" + currentPage + "&lessonID=" + lessonID + "";
                document.getElementById("checkForm").submit();
            });
        });
        //上一页
        $(document).ready(function () {
            $("#upPage").on("click", function (e) {
                var currentPage = $("#currentPage").val();//当前页数
                currentPage = currentPage - 1;
                var examQuestionScore = $("#studentScore").val();//学生每道考试题目成绩
                var examID = $("#examID").val();//考试ID
                var studentID = $("studentID").val();//学生ID
                var questionID = $("questionID").val();//题目ID
                document.getElementById("checkForm").action = "/admin/exam/checking/findAnswerAndSetScore?examQuestionScore=" + examQuestionScore + "&examID=" + examID + "&studentID=" + studentID + "&questionID=" + questionID + "&currentPage=" + currentPage + "";
                document.getElementById("checkForm").submit();
            });
        });
    </script>
</head>
<body>
<jsp:include page="exam_common_ui.jsp"></jsp:include>
<div id="panelOne" class="panel" style="width: 80%">
    <div class="panel-body">
        <%
            List<Exam> examQuestionStudents = (List<Exam>) request.getAttribute("examQuestionStudents");
            for (Exam examQuestionStudent : examQuestionStudents) {
        %>
        <form id="checkForm" class="form-horizontal form-condensed" role="form" method="post">
            <div class="form-group">
                <label class="col-md-2 control-label required">题目类型</label>

                <div class="col-md-8">
                    <p>
                        <%=examQuestionStudent.getQuestionType()%>
                    </p>
                </div>
            </div>

            <div class="form-group">
                <label class="col-md-2 control-label">题目</label>

                <div class="col-md-8">
                    <p>
                        <%=examQuestionStudent.getContent()%>
                    </p>
                </div>
            </div>

            <div class="form-group">
                <label class="col-md-2 control-label">学生答案</label>

                <div class="col-md-8">
                    <p>
                        <%=examQuestionStudent.getStudentAnswer()%>
                    </p>
                </div>
            </div>

            <div class="form-group">
                <label class="col-md-2 control-label">参考答案</label>

                <div class="col-md-8">
                    <p>
                        <%=examQuestionStudent.getAnswer()%>
                    </p>
                </div>
            </div>


            <div class="form-group">
                <label class="col-md-2 control-label">分数</label>

                <div class="col-md-2">
                    <input type="text" id="studentScore" name="studentScore" class="form-control" placeholder="">
                    <input type="text" id="examID" class="hidden" value="<%=request.getAttribute("examID")%>">
                    <input type="text" id="studentID" class="hidden" value="<%=request.getAttribute("studentID")%>">
                    <input type="text" id="questionID" class="hidden" value="<%=examQuestionStudent.getQuestionID()%>">
                    <input type="text" id="currentPage" class="hidden" value="<%=request.getAttribute("currentPage")%>">
                    <input type="text" id="lessonID" class="hidden" value="<%=request.getAttribute("lessonID")%>">
                </div>
            </div>
        </form>

        <div>
            <div>
                <button id="upPage" class="btn" type="submit">上一题</button>
                <button id="nextPage" class="btn" type="submit">下一题</button>
            </div>
            <ul class="pager pager-loose pager-pills" style="float: right">
                <li>
                    <h3>
                        当前第<%=request.getAttribute("currentPage")%>题
                    </h3>
                </li>
                <li>
                    <h3>
                        一共<%=request.getAttribute("totalCount")%>题
                    </h3>

                </li>
            </ul>
        </div>
        <%
            }
        %>
    </div>
</div>
</body>
</html>
