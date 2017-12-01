<%@ page contentType="text/html;charset=gb2312" %>    
<%@include file="head.jsp"%>
<%
// 判断此用户类型是否为系统管理员，如果不是则不能查看此页面信息
// 这里使用head.jsp文件中的方法isAdmin()
if(isAdmin((String)session.getValue("user_id")))
{
%>

<html>
<head>
<link rel="stylesheet" href="public.css">
<title>设备台帐信息</title>
</head>
<script Language="JavaScript">
// 检查主要域是否为空
function ChkFields() {
	if (document.myform.devname.value=='') {
		window.alert ("请输入设备名称！")
		return false
	}
	if (document.myform.devid.value=='') {		
		window.alert ("请输入设备编号！")
		return false
	}
	if (document.myform.devtype.value=='') {
		window.alert ("请输入设备型号！")
		return false	
	}
	if (document.myform.devcate.value=='') {
		window.alert ("请输入设备类型！")
		return false	
	}	
	return true
}
</script>
<body>
<form method="POST" action="device_save.jsp" name="myform" onsubmit="return ChkFields()">
<%
// 编辑设备信息
try{
	// 取得设备编号
	String devid = request.getParameter("devid");
	String sEname;
	// 新建设备对象
	Device o_dev = new Device();
	// 设置对象编号
	o_dev.setDevId(devid);
	// 判断是否存在此设备信息
	if(!o_dev.getDevice())
		out.println("不存在此设备！");
	else
	{
		// 如果存在此设备，则提取相关信息
		// 根据用户名取得用户姓名
		// 新建用户对象
		User o_User = new User();
		// 设置用户名属性
		o_User.setUserId(o_dev.getPoster());
		// 如果存在此用户，则取得用户姓名
		if(o_User.getUser())
			sEname = o_User.getEmplName();
		else
			sEname = "&nbsp;";
%>
<h3><p align="center">设备台帐信息</p></h3>
 <table align="center" border="1" cellpadding="1" cellspacing="1" width="100%" bordercolor="#808080" bordercolordark="#FFFFFF" style="font-size: 9pt; font-family: 宋体">
      <tr>
        <td width="20%">设备编号</td>
		<td width="30%"><input type="text" name="devid" size="20" value="<%=o_dev.getDevId()%>" style="font-size: 9pt; font-family: 宋体"></td>
		<td width="20%">设备名称</td>
		<td width="30%"><input type="text" name="devname" size="20" value="<%=o_dev.getDevName()%>" style="font-size: 9pt; font-family: 宋体"></td>
      </tr>
	  <tr>
        <td>设备型号</td>
        <td><input type="text" name="devtype" size="20" value="<%=o_dev.getDevType()%>" style="font-size: 9pt; font-family: 宋体"></td>
        <td>设备类别</td>
        <td>
	   <select name="devcate" style="font-size: 9pt; font-family: 宋体">
		<%
	// 如果设备类别列表中得类别名称和此设备类别名称一样，则此类别名称为selected项
		 Vector v_Base = new Vector();
		 Base o_Base = new Base();
		 o_Base.setBaseType(1);
		 v_Base = o_Base.getMoreBases();
		 for(int i=0 ;i<v_Base.size();i++)
		 {
			 o_Base = (Base)v_Base.elementAt(i);
	//		 System.out.println(o_Base.getTitle()+" -- "+o_dev.getDeviceCate());
			 if(o_Base.getTitle().equals(o_dev.getDevCate()))
			 {
			%>
			<option value="<%=o_Base.getTitle()%>" selected><%=o_Base.getTitle()%></option>
			<%}else{%>
			<option value="<%=o_Base.getTitle()%>"><%=o_Base.getTitle()%></option>
			<%}
		 }%>
		</select>
       </td>
      </tr>
      <tr>
        <td>生产厂家</td>
        <td><input type="text" name="devpro" size="20" value="<%=o_dev.getDevPro()%>" style="font-size: 9pt; font-family: 宋体"></td>
        <td>单位</td>
        <td><input type="text" name="devunit" size="10" value="<%=o_dev.getUnit()%>" style="font-size: 9pt; font-family: 宋体"></td>
      </tr>
      <tr>
        <td>库存数量</td>
        <td><input type="text" name="devnum" size="20" style="font-size: 9pt; font-family: 宋体" value="<%=o_dev.getDevNumber()%>">
		</td>
        <td>单价</td>
        <td><input type="text" name="devprc" size="20" style="font-size: 9pt; font-family: 宋体"  value="<%=o_dev.getPrice()%>"></td>
      </tr>
		<tr>
        <td>总金额</td>
        <td><input type="text" name="total" size="20" style="background-color: #FFFFFF; border-style: solid; border-color: #FFFFFF;font-size: 9pt; font-family: 宋体" value="<%=o_dev.getDevNumber()*o_dev.getPrice()%>"></td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td width="755" colspan="4">　</td>
      </tr>
      <tr>
        <td>填写人</td>
        <td><%=sEname%></td>
        <td>填写日期</td>
        <td><%=o_dev.getPostTime()%><input type="hidden" name="posttime" value="<%=o_dev.getPostTime()%>"></td>
      </tr>	  
  </table>
<p align="center"><input type="submit" value=" 提 交 " name="B2" style="font-size: 9pt; font-family: 宋体"></p>
<%
	}
}catch(Exception e){e.printStackTrace();}
%>
</form>  
</body>
</html>
<%}
else
	out.println("你没有管理员的权限");		
%>