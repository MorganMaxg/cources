<%--
  Created by IntelliJ IDEA.
  User: maomao
  Date: 2015/4/28
  Time: 16:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=GBK" language="java" %>
<html>
<head>
    <title>��ӵ�ѡ��</title>
</head>
<body>
<form action="/admin/question/addSingleChoice/save" method="post">
    <div id="panel" class="panel">
        <div class="panel-body">
            <jsp:include page="question_common_ui.jsp"/>
            <%--�ڶ������--%>
            <div id="panelOne" class="panel" style="width:1050px ">
                <div class="panel-body">
                    ���⣺ &nbsp; &nbsp; &nbsp;<input type="text" name="content" style="width: 600px"/><br><br>
                    ѡ� <br>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    A��<input type="text" name="map['choiceA']" style="width: 600px"><br><br>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    B��<input type="text" name="map['choiceB']" style="width: 600px"/><br><br>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    C��<input type="text" name="map['choiceC']" style="width: 600px"/><br><br>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    D��<input type="text" name="map['choiceD']" style="width: 600px"/><br><br>
                    �𰸣� &nbsp;<input type="radio" name="answer" value="1">A&nbsp;&nbsp;&nbsp;
                    <input type="radio" name="answer" value="2">B&nbsp;&nbsp;&nbsp;
                    <input type="radio" name="answer" value="3">C&nbsp;&nbsp;&nbsp;
                    <input type="radio" name="answer" value="4">D
                    <br><br>

                    <div align="center">
                        <input type="submit" name="submit" value="�ύ"/> &nbsp; &nbsp;
                        <input type="reset" name="reset" value="����"/>
                    </div>

                </div>
            </div>
        </div>
    </div>

</form>

</body>
</html>
