<%--
  Created by IntelliJ IDEA.
  User: maomao
  Date: 2015/4/30
  Time: 15:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=GBK" language="java" %>
<html>
<head>
    <title></title>

</head>
<body>
<jsp:include page="exam_common_ui.jsp"/>
<form action="/admin/exam/add/examSave" method="post">
    <div id="panelOne" class="panel" style="width:1050px ">
        <div class="panel-body">
            <div class="alert alert-info" align="center">
                <strong><h3>�Ծ�����</h3></strong>
            </div>

            <div id="addExam">
                <tr>
                    <td>�������Ծ�ı��⣺</td>
                    <td><input type="text" name="examTitle"></td>
                </tr>
                <br>
                <br>
                <tr>
                    <td>������ѡ����������</td>
                    <td><input type="text" name="singleChoiceNum"></td>
                </tr>
                <br>
                <br>
                <tr>
                    <td>�������ж���������</td>
                    <td><input type="text" name="checkingNum"></td>
                </tr>
                <br>
                <br>
                <tr>
                    <td>����������������</td>
                    <td><input type="text" name="shortAnswerNum"></td>
                </tr>
                <br>
                <br>
                <tr>
                    <td>������������������</td>
                    <td><input type="text" name="subjectiveNum"></td>
                </tr>
                <br>
                <br>

                <div align="center">
                    <input type="submit" name="submit" value="�ύ">
                    <input type="reset" name="reset" value="����">
                </div>
            </div>
</form>

</div>
</div>
</body>
</html>
