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
    <title>用户登录-Java程序设计精品课程网站后台</title>
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
                    <h1>用户登录</h1>
                    <ul>

                        <li>
                            <label>用户名</label>
                            <input type="text" id="username" name="username" style="color: #000">
                        </li>
                        <br>
                        <li>
                            <label>密码</label>
                            <input type="password" id="password" name="password">
                        </li>
                        <div class="lbtn">
                            <input id="submit" type="submit" value="登 录">&nbsp;&nbsp;&nbsp;&nbsp;
                            <input id="reset" type="reset" value="重 置">
                        </div>
                    </ul>
                </div>
            </div>
        </div>
        <div id="footer">
            <p>Copyright &copy; 2015 <a href="" target="_blank">Java程序设计精品课程网站</a> | <a href="http://www.zjut.edu.cn"
                                                                                        target="_blank">浙江工业大学</a>&nbsp.&nbspAll
                Rights Reserved</p>
        </div>
    </div>
</form>
<script language="javascript">
    function validateLogin() {
        var sUserName = document.getElementById("username").value;
        var sPassword = document.getElementById("password").value;
        if ((sUserName == "")) {
            alert("用户名不能为空,请输入用户名!");
            return false;
        }

        if ((sPassword == "")) {
            alert("密码不能为空,请输入密码!");
            return false;
        }
    }
</script>
</body>
</html>

