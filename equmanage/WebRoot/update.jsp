<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="org.auts.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改</title>
</head>
<body>
<%
	String oldname=request.getParameter("oldname");
	String newname=request.getParameter("newname");
	String newprice=request.getParameter("newprice");
	String sql="update equmessage set name='"+newname+"',price='"+newprice+"' where name='"+oldname+"'";
	DataBase db=new  DataBase();
	db.alertData(sql);
	response.sendRedirect("index.jsp");
 %>
</body>
</html>