<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2021-11-30
  Time: 오전 1:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="com.oreilly.servlet.*" %>
<%@ page import="com.oreilly.servlet.multipart.*" %>
<%@ page import="java.util.*" %>
<%@ page import="dao.ItemDao" %>
<%@ page import="dao.Oid" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>register</title>
</head>
<body>
    <%
        ItemDao itemDao = new ItemDao();
        Oid oid = new Oid();

        int nextOid = oid.getNextOid();

        request.setCharacterEncoding("UTF-8");

        String realFolder = "C:\\study\\webproject\\web\\img\\item";
        int maxSize = 5 * 1024 * 1024;
        String encType = "utf-8";

        MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());

        String name = multi.getParameter("name");
        Integer originalPrice = Integer.valueOf(multi.getParameter("originalPrice"));
        Integer eventPrice = null;
        if (multi.getParameter("eventPrice") != null) {
            eventPrice = Integer.valueOf(multi.getParameter("eventPrice"));
        }
        String description = multi.getParameter("description");
        String category = multi.getParameter("category");
        String eventTag = multi.getParameter("eventTag");

        Enumeration files = multi.getFileNames();
        String fname = (String) files.nextElement();
        String fileName = multi.getFilesystemName(fname);

        itemDao.insertItem(nextOid, name, "img/item/" + fileName, originalPrice, eventPrice, description, category, eventTag);

        response.sendRedirect("main.jsp");
    %>
</body>
</html>
