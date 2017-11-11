<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="org.auts.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>增加</title>
</head>
<body>
	<%
		String name=request.getParameter("name");
		String price=request.getParameter("price");
		DataBase db=new DataBase();
		String sql="insert into	equmessage(name,price) values('"+name+"','"+price+"')";
		db.alertData(sql);
		response.sendRedirect("index.jsp");
	 %>
</body>
</html>