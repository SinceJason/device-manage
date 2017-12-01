<%@page contentType="text/html;charset=gb2312" %>    
<%@include file="head.jsp"%>
<%
// 判断此用户类型是否为系统管理员，如果不是则不能查看此页面信息
// 这里使用head.jsp文件中的方法isAdmin()
if(isAdmin((String)session.getValue("user_id")))
{
%>

<html>
<head>
<title>保存设备台帐信息</title>
</head>
<body>
<%
request.setCharacterEncoding("GB2312");
%>
<%
	// 创建新设备对象，设置对象各种属性值
    Device o_dev = new Device();
	o_dev.setDevId(request.getParameter("devid"));
	o_dev.setDevType( request.getParameter("devtype"));
	o_dev.setDevCate( request.getParameter("devcate"));
	o_dev.setDevPro( request.getParameter("devpro"));
	o_dev.setUnit(request.getParameter("devunit"));
	o_dev.setDevName(request.getParameter("devname"));
	o_dev.setPostTime(request.getParameter("posttime"));
	o_dev.setPrice(Long.parseLong(request.getParameter("devprc")));
	o_dev.setDevNumber(Integer.parseInt(request.getParameter("devnum")));	
	try{
		// 新建设备信息和编辑设备信息表中都有一个posttime域，如果为新建，则posttime值等于1，否则等于提交时间
		// 用此来判断是否为新建信息
		if(request.getParameter("posttime").equals("1"))	// insert
		{
			o_dev.setPoster(request.getParameter("userid"));
			o_dev.CreateDevice();
		}
		else
		o_dev.UpdateDevice();
		out.println("<br><br><br><center>设备台帐信息已成功保存！</center>");
		}
		catch(Exception e){e.printStackTrace();out.println("<br><br><br><center>设备台帐信息已成功保存！ </center>");}
%>
</body>
<script language="javascript">
// 保存完成后刷新页面，关闭窗口
	opener.location.reload();
	setTimeout("window.close()",800);
</script>
</html>
<%}
else
	out.println("你没有管理员的权限");		
%>