<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="org.auts.bean.*"%>
<%@ page import="org.auts.dao.*"%>
<%@ page import="org.auts.util.*"%>
<%@ page import="java.util.*" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<title>管理页面</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	</head>

	<body>
	<body style="background-color: #ccffee; ">
		<div >
		<center><label style="background-color: #CCFFDD; color: Maroon"><b>以下是设备列表</b></label><strong>
		<hr>
			<table border="2" bgcolor="#FFCCCC" style="width: 717px; height: 668px">
				<%
							EquMessage em = null;
							EquDao ed = new EquDao();
							ArrayList<EquMessage> list = ed.getList();
				%>

				<tr bgcolor="#6C6C6C">
					<td style="color: Maroon; background-color: #CCFFFF">
						设备名
					</td>
					<td style="color: Maroon; background-color: #CCFFFF">
						价格
					</td>
					
				</tr>
				<%
					for (int i = 0; i < list.size(); i++) {
						em = list.get(i);
				%>
				<tr>
					<td>
						<%=em.getName() %>
					</td>
					<td>
						<%=em.getPrice() %>
					</td>
				</tr>
				<%
					}
				%>
			<tr style="color: Maroon;">
			<td style="width: 566px; ">
			<label><b>删除</b></label><form action="delete.jsp">
				请输入设备名：<input type="text" name="name"><br>
						   <div align="center"><input type="submit" value="确认删除" style="background-color: #CCFFFF;"> 
			</div></form>
			</td>
			</tr>
			<tr style="color: Maroon;">
			<td style="width: 566px; ">
			<label><b>增加</b></label><form action="add.jsp">
				请输入设备名： <input type="text" name="name"><br> 
				请输入价格：&nbsp;&nbsp; 	<input type="text" name="price">
						    <br><div align="center"><input type="submit" value="确认增加" style="background-color: #CCFFFF; "> 
			</div></form>
			</td>
			</tr>
			<tr style="color: Maroon;">
			<td style="width: 566px; ">
				<label><b>修改</b></label><form action="update.jsp"><br> 
				请输入要修改设备的名字：<input type="text" name="oldname"><br> 
				请输入新的设备名：&nbsp;       &nbsp;&nbsp;&nbsp;  &nbsp;   <input type="text" name="newname" style="width: 156px; "><br> 
				请输入新的价格：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="text" name="newprice"> 
				<br><div align="center"><input type="submit" value="确认修改" style="background-color: #CCFFFF; "> 
			</div></form>
			</td>
		</tr>
		</table>
		
		</strong></center>
		</div>
	</body>
</html>
