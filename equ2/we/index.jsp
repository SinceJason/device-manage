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
		<center><strong><label style="background-color: #CCFFDD; color: Maroon"><b>以下是设备列表</b></label></strong></center>
		<center>
			<table border="2" bgcolor="#FFCCCC" style="width: 800px; height: 100px">
				<%
							EquMessage em = null;
							EquDao ed = new EquDao();
							ArrayList<EquMessage> list = ed.getList();
				%>

				<tr bgcolor="#6C6C6C">
					<td style="color: Maroon; background-color: #CCFFFF;width: 391px;">
						设备名
					</td>
					<td style="color: Maroon; background-color: #CCFFFF;width: 50px;">
						价格
					</td>
					<td style="color: Maroon; background-color: #CCFFFF; width: 105px">
						型号规格
					</td>
					<td style="color: Maroon; background-color: #CCFFFF">
						购置日期
					</td>
					
				</tr>
				<%
					for (int i = 0; i < list.size(); i++) {
						em = list.get(i);
				%>
				<tr>
					<td style="width: 499px; height: 2px">
						<%=em.getName() %>
					</td>
					<td style="width: 175px; height: 2px">
						<%=em.getPrice() %>
					</td>
					<td style="width: 160px; ">
						<%=em.getModel() %>
					</td>
					<td style="width: 146px; ">
						<%=em.getDate() %>
					</td>										
				</tr>
				<%
					}
				%>
			</table>
			<table border="2" bgcolor="#FFCCCC" style="width: 800px; height: 100px">
			<tr style="color: Maroon;">
			<td style="width: 795px; ">
			<center><label><b>删除</b></label><form action="delete.jsp" style="width: 790px; ">
				请输入设备名：<input type="text" name="name"><br>
						   <div align="center"><input type="submit" value="确认删除" style="background-color: #CCFFFF;"> 
			</div></form>
			</td>
			</tr>
			
			</table>
			
			<table border="2" bgcolor="#FFCCCC" style="width: 800px; height: 100px">
			<tr style="color: Maroon;">
			<td style="width: 800px; ">
			<center><label><b>增加</b></label><form action="add.jsp">
				请输入设备名： &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="name"><br> 
				请输入价格：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 	<input type="text" name="price"><br>
				请输入型号规格：&nbsp;&nbsp; 	<input type="text" name="model"><br>
				请输入购置日期：&nbsp;&nbsp; 	<input type="text" name="date"><br>
						    <br><div align="center"><input type="submit" value="确认增加" style="background-color: #CCFFFF; "> 
			</div></form>
			</td>
			</tr>
			</center>
			</table>
			</center>
			
			<center>
			<table border="2" bgcolor="#FFCCCC" style="width: 800px; height: 100px">
			<tr style="color: Maroon;">
			<td style="width: 800px; ">
				<center><label><b>修改</b></label><form action="update.jsp"><br> 
				请输入要修改设备的名字：<input type="text" name="oldname"><br> 
				请输入新的设备名：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;       &nbsp;&nbsp;&nbsp;  &nbsp;   <input type="text" name="newname" style="width: 156px; "><br> 
				请输入新的价格：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="text" name="newprice"> <br>
				请输入新的型号规格：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="text" name="newmodel"> <br>
				请输入新的购置日期：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="text" name="newdate"> <br>
				<br><div align="center"><input type="submit" value="确认修改" style="background-color: #CCFFFF; "> 
			</div></form>
			</td>
		</tr>
		</center>
		</table>
		</center>
		

		</div>
	</body>
</html>