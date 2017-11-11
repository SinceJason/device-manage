<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="org.auts.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>删除</title>
</head>
<body>
	<%
	String name=request.getParameter("name");
	DataBase db=new  DataBase();
	String sql="delete from equmessage where name='"+name+"'";
	db.alertData(sql);
	response.sendRedirect("index.jsp");
	 %>
</body>
</html>