<%@ page import="com.springapp.mvc.entity.Student" %>
<%--
  Created by IntelliJ IDEA.
  User: maomao
  Date: 2015/3/26
  Time: 18:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=GBK" language="java" %>
<html>
<head>
    <title></title>
</head>
<body>
提交成功
<%Student student = new Student(); %>
<%out.print(student.getClassID());%>
</body>
</html>
