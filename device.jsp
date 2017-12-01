<%@ page contentType="text/html;charset=gb2312" %>    
<%@include file="head.jsp"%>
<%
// 判断此用户类型是否为系统管理员，如果不是则不能查看此页面信息
// 这里使用head.jsp文件中的方法isAdmin()
if(isAdmin((String)session.getValue("user_id")))
{
%>

<%
	// 定义日期对象，按照 YYYY-MM-DD 格式取得当前日期
	java.util.Date dnow = new java.util.Date();
	SimpleDateFormat formatter1 = new SimpleDateFormat ("yyyy-MM-dd");
	String ShowDate = formatter1.format(dnow);

	String uid = (String)session.getAttribute("user_id");
	
	// 根据当前用户名取得用户的姓名信息
	User o_User = new User();
	// 对session的属性设置和取值可以使用session.getValue("user_id")，也可以使用session.getAttribute("user_id"),
	// getAttribute在jdk高版本中支持的，所以如果jdk版本低，使用getValue；
	// 而且需要将得到的值强制转换为字符串格式
	o_User.setUserId(uid);
	o_User.getUser();
	String sEname = o_User.getEmplName();
%>
<html>
<head>
<link rel="stylesheet" href="public.css">
<title>添加新设备</title>
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
// 计算总额域值，为单价*数量
function CaculateSum()
{
	var dcnt = document.myform.devnum.value;
	var dprc = document.myform.devprc.value;
	document.myform.total.value = dcnt * dprc;
}
</script>
<body>
<%
request.setCharacterEncoding("GB2312");
%>
<form method="POST" action="device_save.jsp" name="myform" onsubmit="return ChkFields()">
<input type="hidden" name="userid" value="<%=uid%>"><input type="hidden" name="posttime" value="1">
<h3><p align="center">设备台帐信息</p></h3>

 <table align="center" border="1" cellpadding="1" cellspacing="1" width="100%" bordercolor="#808080" bordercolordark="#FFFFFF" style="font-size: 9pt; font-family: 宋体">
      <tr>
        <td width="20%">设备编号</td>
		<td width="30%"><input type="text" name="devid" size="20" style="font-size: 9pt; font-family: 宋体"></td>
		<td width="20%">设备名称</td>
		<td width="30%"><input type="text" name="devname" size="20" style="font-size: 9pt; font-family: 宋体"></td>
      </tr>
	  <tr>
        <td>设备型号</td>
        <td><input type="text" name="devtype" size="20" style="font-size: 9pt; font-family: 宋体"></td>
        <td>设备类别</td>
        <td>
		<select name="devcate" style="font-size: 9pt; font-family: 宋体">
		<%
		// 从数据库中取出类别信息，作为下拉列表内容，类别编号为1
		 Vector v_Base = new Vector();
		 Base o_Base = new Base();
		 o_Base.setBaseType(1);
		 v_Base = o_Base.getMoreBases();
		 for(int i=0 ;i<v_Base.size();i++)
		 {
			 // 取Vector中每条记录信息
			 o_Base = (Base)v_Base.elementAt(i);
		%>
		<option value="<%=o_Base.getTitle()%>"><%=o_Base.getTitle()%></option>
		<%}%>
		</select>
		</td>
      </tr>
      <tr>
        <td>生产厂家</td>
        <td><input type="text" name="devpro" size="20" style="font-size: 9pt; font-family: 宋体"></td>
        <td>单位</td>
        <td><input type="text" name="devunit" size="10" style="font-size: 9pt; font-family: 宋体"></td>
      </tr>
      <tr>
        <td>库存数量</td>
        <td><input type="text" name="devnum" size="20" style="font-size: 9pt; font-family: 宋体" value="0" onchange="CaculateSum()">
		</td>
        <td>单价</td>
        <td><input type="text" name="devprc" size="20" style="font-size: 9pt; font-family: 宋体" value="0" onchange="CaculateSum()"></td>
      </tr>
      <tr>
        <td>总金额</td>
        <td><input type="text" name="total" size="20" style="background-color: #FFFFFF; border-style: solid; border-color: #FFFFFF;font-size: 9pt; font-family: 宋体" value="0">
		</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td>填写人</td>
        <td><%=sEname%></td>
        <td>填写日期</td>
        <td><%=ShowDate%></td>
      </tr>
	  
  </table> 
<p align="center"><input type="submit" value=" 提 交 " name="B2" style="font-size: 9pt; font-family: 宋体"></p>
</form>  
</body>
</html>
<%}
else
	out.println("你没有管理员的权限");		
%>