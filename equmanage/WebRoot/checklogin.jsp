<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="org.auts.util.*" %>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登陆处理</title>
</head>
<body>
	<%
	String username=request.getParameter("username");
	String password=request.getParameter("password");
	String sql="select * from user where username='"+username+"' and password='"+password+"'";
	DataBase db=new DataBase();
	ResultSet rs=db.selectData(sql);
	if(rs.next()){
		response.sendRedirect("index.jsp");
	}else{
		response.sendRedirect("error.jsp");
	}
	 %>
</body>
</html>