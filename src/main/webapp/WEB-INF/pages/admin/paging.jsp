<%@ page import="com.springapp.mvc.entity.Page" %>
<%--
  Created by IntelliJ IDEA.
  User: maomao
  Date: 2015/5/4
  Time: 10:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=GBK" language="java" %>
<html>
<head>
    <title></title>
</head>
<body>
<%Page pager = new Page();%>
    <span><font size="2">总<%=pager.getTotalRecord()%>条记录|总<%=pager.getTotalPage()%>页|当前<%=pager.getCurrentPage() + 1%>
        页|每页<%=pager.getPageSize()%>条|
        <%
            //如果已经到了首页就去掉前一页的链接
            if (pager.getCurrentRecord() - pager.getPageSize() < 0)
                out.println("首页|");
            else
                //上一页就是把当前记录位置减去一页显示记录的条数
                out.print("<a href='Page.jsp?currentRecord=" + (pager.getCurrentRecord() - pager.getPageSize()) + "&pageSize=" + pager.getPageSize() + "'>上一页</a>|");
            //如果到了尾页就去掉下一页的链接
            if (pager.getCurrentRecord() + pager.getPageSize() > pager.getTotalRecord())
                out.println("尾页");
            else
                //下一页就是把当前记录位置加上一页显示记录的条数
                out.print("<a href='Page.jsp?currentRecord=" + (pager.getCurrentRecord() + pager.getPageSize()) + "&pageSize=" + pager.getPageSize() + "'>下一页</a>|");
        %>
    </font></span>
</body>
</html>
