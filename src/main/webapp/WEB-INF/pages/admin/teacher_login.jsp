<%--
  Created by IntelliJ IDEA.
  User: maomao
  Date: 2015/3/12
  Time: 17:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html;charset=GBK" %>
<html>
<head>
    <title>�û���¼-Java������ƾ�Ʒ�γ���վ��̨</title>
    <link href="/css/login.css" rel="stylesheet" type="text/css"/>
</head>
<body>
<form method="POST" name="frmLogin" action="/admin/login/checkLogin" onsubmit="return validateLogin()">
    <div class="wapper">
        <div class="logobox">
        </div>
        <div id="loginbox">
            <div class="title">
                <div id="login">
                    <h1>�û���¼</h1>
                    <ul>

                        <li>
                            <label>�û���</label>
                            <input type="text" id="username" name="username" style="color: #000">
                        </li>
                        <br>
                        <li>
                            <label>����</label>
                            <input type="password" id="password" name="password">
                        </li>
                        <div class="lbtn">
                            <input id="submit" type="submit" value="�� ¼">&nbsp;&nbsp;&nbsp;&nbsp;
                            <input id="reset" type="reset" value="�� ��">
                        </div>
                    </ul>
                </div>
            </div>
        </div>
        <div id="footer">
            <p>Copyright &copy; 2015 <a href="" target="_blank">Java������ƾ�Ʒ�γ���վ</a> | <a href="http://www.zjut.edu.cn"
                                                                                        target="_blank">�㽭��ҵ��ѧ</a>&nbsp.&nbspAll
                Rights Reserved</p>
        </div>
    </div>
</form>
<script language="javascript">
    function validateLogin() {
        var sUserName = document.getElementById("username").value;
        var sPassword = document.getElementById("password").value;
        if ((sUserName == "")) {
            alert("�û�������Ϊ��,�������û���!");
            return false;
        }

        if ((sPassword == "")) {
            alert("���벻��Ϊ��,����������!");
            return false;
        }
    }
</script>
</body>
</html>

