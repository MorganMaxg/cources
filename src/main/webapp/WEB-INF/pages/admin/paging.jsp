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
    <span><font size="2">��<%=pager.getTotalRecord()%>����¼|��<%=pager.getTotalPage()%>ҳ|��ǰ<%=pager.getCurrentPage() + 1%>
        ҳ|ÿҳ<%=pager.getPageSize()%>��|
        <%
            //����Ѿ�������ҳ��ȥ��ǰһҳ������
            if (pager.getCurrentRecord() - pager.getPageSize() < 0)
                out.println("��ҳ|");
            else
                //��һҳ���ǰѵ�ǰ��¼λ�ü�ȥһҳ��ʾ��¼������
                out.print("<a href='Page.jsp?currentRecord=" + (pager.getCurrentRecord() - pager.getPageSize()) + "&pageSize=" + pager.getPageSize() + "'>��һҳ</a>|");
            //�������βҳ��ȥ����һҳ������
            if (pager.getCurrentRecord() + pager.getPageSize() > pager.getTotalRecord())
                out.println("βҳ");
            else
                //��һҳ���ǰѵ�ǰ��¼λ�ü���һҳ��ʾ��¼������
                out.print("<a href='Page.jsp?currentRecord=" + (pager.getCurrentRecord() + pager.getPageSize()) + "&pageSize=" + pager.getPageSize() + "'>��һҳ</a>|");
        %>
    </font></span>
</body>
</html>
