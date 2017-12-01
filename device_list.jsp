<%@ page contentType="text/html;charset=gb2312" %>    
<%@include file="head.jsp"%>
<%
// 判断此用户类型是否为系统管理员，如果不是则不能查看此页面信息
// 这里使用head.jsp文件中的方法isAdmin()
if(isAdmin((String)session.getValue("user_id")))
{
%>
<%!
// 为分页定义变量
	int i=0,pageno=0,totalPage=0;
	Vector v_dev;
	// cMaxPerPage-每页显示的记录个数
	int iDevCnt,ShowCount,lPage,nPage,cMaxPerPage=10;
	String strPage;
	// currentpage - 当前页；iPageStop - 循环停止得记录个数；iMaxPage-最大页数
	int currentpage=1,iNext=0,iFinish=0,iMaxPage=0,iPageStop;
%>
<html>
<head>
<title></title>
<link rel="stylesheet" href="public.css">
<script language="JavaScript">
// 弹出新窗口函数，url表示新的链接地址
function newwin(url) {
  // 设置弹出窗口属性
  var status =   "toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=yes,width=600,height=450";
  var newwin=window.open(url,"newwin",status);
  newwin.focus();
  return false;
}
</script>
</head>
<body>
<h3><p align="center">设备列表</p></h3>
<table width='96%' align=center cellspacing=1 cellpadding=2 border=1 bordercolor="#808080" bordercolordark="#FFFFFF" style="font-size: 9pt; font-family: 宋体"  bordercolorlight="#D8D8D8">
<tr>
<td align="center" width='10%' bgcolor="#D8D8D8">设备类别</td>
<td align="center" width='12%' bgcolor="#D8D8D8">设备编号</td>
<td align="center" width='16%' bgcolor="#D8D8D8">设备名称</td>
<td align="center" width='10%' bgcolor="#D8D8D8">设备型号</td>
<td align="center" width='10%' bgcolor="#D8D8D8">库存数量</td>
<td align="center" width='12%' bgcolor="#D8D8D8">单价</td>
<td align="center" width='16%' bgcolor="#D8D8D8">总&nbsp;金&nbsp;额</td>
<td align="center" width='6%' bgcolor="#D8D8D8">修改</td>
<td align="center" width='6%' bgcolor="#D8D8D8">删除</td>
</tr>
<%
try{
	// 新建设备对象，取多个设备信息
	Device o_dev = new Device();
	v_dev = o_dev.getMoreDevice();
	iDevCnt = v_dev.size();	// 设备个数

	if(iDevCnt==0) 
		out.println("<tr align='center'><td colspan=9><font color=red>目前还没有设备</font></td></tr>");
	else
	{
		// 从传递的参数中取的页数值
		strPage = request.getParameter("page");
		// 如果页数值为null，则设置当前页为1，否则为页数值
		// 把字符型变量转为数字型使用：Integer.parseInt(strParameter)方法，同样有:Long.parseLong(strParameter)
		if(strPage == null)
			currentpage = 1;
		else
			currentpage = Integer.parseInt(strPage);
		// 如果当前页小于1，则当前页设为1
		if(currentpage<1)
			currentpage = 1;
		// 最大页数=记录个数/每页记录最大值
		if ((iDevCnt%cMaxPerPage)==0)
	      iMaxPage = iDevCnt / cMaxPerPage;
	    else
	      iMaxPage = iDevCnt / cMaxPerPage + 1;		
		// 分情况显示设备记录信息
        if (currentpage==1){
			// 当记录个数大于每页最大记录数时，每页应该显示最大记录数
			if(iDevCnt>cMaxPerPage)
				iPageStop = cMaxPerPage;
			// 如果记录个数小于每页最大记录数时，每页应该显示记录个数
			else
				iPageStop = iDevCnt;
			// 显示设备记录信息
			for(i=0;i<iPageStop;i++){ 
			  o_dev =(Device)v_dev.elementAt(i);
%>
<tr>
<td align="center"><%=o_dev.getDevCate()%></td>
<td><a href="device_view.jsp?devid=<%=o_dev.getDevId()%>" onclick="return newwin(this.href)"><%=o_dev.getDevId()%></a></td>
<td><%=o_dev.getDevName()%></td>
<td><%=o_dev.getDevType()%></td>
<td align="right"><%=o_dev.getDevNumber()%></td>
<td align="right"><%=o_dev.getPrice()%></td>
<td align="right"><%=o_dev.getPrice()*o_dev.getDevNumber()%></td>
<td align="center"><a href="device_edit.jsp?devid=<%=o_dev.getDevId()%>" onclick="return newwin(this.href)">修改</a></td>
<td align="center"><a href="device_delt.jsp?devid=<%=o_dev.getDevId()%>" onclick="return newwin(this.href)">删除</a></td>
</tr>

<%
			}  //end for
		}  // end if
		else
		{
			// 得到开始显示的记录值iNext，以及剩余记录个数iFinish
		   iNext = (currentpage-1)*cMaxPerPage;
		   iFinish = iDevCnt - iNext ;
		   // 如果剩余记录个数大于每页最大记录数，每页应该显示最大记录数，否则显示记录个数
		   if(iFinish>cMaxPerPage)
			   iPageStop = cMaxPerPage;
		   else
			   iPageStop = iFinish;
	       if (iNext<iDevCnt){
			   for(int j=iNext;j<iNext+iPageStop;j++){ 
				o_dev =(Device)v_dev.elementAt(j);
%>
<tr>
<td align="center"><%=o_dev.getDevCate()%></td>
<td><a href="device_view.jsp?devid=<%=o_dev.getDevId()%>" onclick="return newwin(this.href)"><%=o_dev.getDevId()%></a></td>
<td><%=o_dev.getDevName()%></td>
<td><%=o_dev.getDevType()%></td>
<td align="right"><%=o_dev.getDevNumber()%></td>
<td align="right"><%=o_dev.getPrice()%></td>
<td align="right"><%=o_dev.getPrice()*o_dev.getDevNumber()%></td>
<td align="center"><a href="device_edit.jsp?devid=<%=o_dev.getDevId()%>" onclick="return newwin(this.href)">修改</a></td>
<td align="center"><a href="device_delt.jsp?devid=<%=o_dev.getDevId()%>" onclick="return newwin(this.href)">删除</a></td>
</tr>
<%				}
			}
		}
		%>
		<table align=center><tr><td>
第<%=currentpage%>页&nbsp;/&nbsp;总<%=iMaxPage%>页 本页<%=iPageStop%>条&nbsp;/&nbsp;总<%=iDevCnt%>条
<%if (currentpage == 1)
	{%>首页 上一页 <%}
else{lPage = currentpage-1;
	%><a href='device_list.jsp?page=1'>首页</a>&nbsp;&nbsp;<a href='device_list.jsp?page=<%=lPage%>'>上一页</a> 
<%}
if(currentpage ==iMaxPage)
	{%>下一页&nbsp;&nbsp;尾页 <%}
else{nPage = currentpage+1;
	%><a href='device_list.jsp?page=<%=nPage%>'>下一页</a>&nbsp;&nbsp;<a href='device_list.jsp?page=<%=iMaxPage%>'>尾页</a>
<%}%>
</td></tr></table>
<%
	  }  //end else
}catch(Exception e){e.printStackTrace();}
%>
</table>
<br>
<p align=center><a href="device.jsp" onclick="return newwin(this.href)">添加设备信息</a></p>
</body>
</html>
<%}
else
	out.println("你没有管理员的权限");		
%>