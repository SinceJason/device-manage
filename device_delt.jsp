<%@ page contentType="text/html;charset=gb2312" %>    
<%@include file="head.jsp"%>
<%
// 判断此用户类型是否为系统管理员，如果不是则不能查看此页面信息
// 这里使用head.jsp文件中的方法isAdmin()
if(isAdmin((String)session.getValue("user_id")))
{
%>
<%!
	String strid;
%>
<html>
<head>
<title>设备删除</title>
</head>
<body>
<form name="form1" method="POST">
<%
try
{
	strid = request.getParameter("devid");
	// 新建Device对象，执行删除设备的方法
	Device o_dev = new Device();
	o_dev.DeleteDevice(strid);
	out.print("设备台帐信息成功删除！");
	%>
	<script language="javascript">
		// 刷新父级窗口，关闭此窗口
		opener.location.reload();
		setTimeout("window.close()",800);
	</script>
	<%
}catch(Exception e)
{
  throw new Exception(e.getMessage());
}
%>
</form>
</body>
</html>
<%}
else
	out.println("你没有管理员的权限");		
%>