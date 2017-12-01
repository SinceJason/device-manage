<%@ page contentType="text/html;charset=gb2312" %>    
<%@include file="head.jsp"%>
<%
// 判断此用户类型是否为系统管理员，如果不是则不能查看此页面信息
// 这里使用head.jsp文件中的方法isAdmin()
if(isAdmin((String)session.getValue("user_id")))
{
%>
<%!
//此文件完成对基本信息的设置，包括对设备分类、部门的设置
	String sname,oldname,stitle="",showname;
	String stype,helloworld;
	int itype,hello;
%>
<html>
<head>
<link rel="stylesheet" href="public.css">
<title>基本设置</title>
</head>
<script language="javascript">
function DeleteName(){
	if (confirm("真的要删除此名称吗？")){
		return true;
	}
	else{
		return false;
	}
}
</script>
<body>
<%
     request.setCharacterEncoding("GB2312");

	Vector v_Base = new Vector();
	// 取得类型编号：1-设备分类；2-部门名称
	stype = request.getParameter("type");
	// 将类型编号字符串转换为整型
	itype = Integer.parseInt(stype);

       helloworld = request.getParameter("hello");
       if(helloworld !=null)hello = Integer.parseInt(helloworld);
	sname = request.getParameter("name");		// 新名称
 	

       oldname =request.getParameter("oldname");	
       if(oldname!=null)oldname = new String(oldname.getBytes("iso8859-1"),"GBK");
	String sflag = request.getParameter("flag");	// 操作标志
      
	System.out.println("sflag= "+sflag+" , stype= "+stype+" , sname= "+sname+" , oldname= "+oldname);

	//定义基本信息对象
	Base o_base = new Base();
	// 操作标志分为：空值、新建、修改、删除
	if(sflag==null)
		sflag = "new";
	if(sflag.equals("add")&&sname!=null){
		try{
			o_base.setBaseType(itype);
			o_base.setTitle(sname);
			//判断是否已经存在此名称
			if(o_base.getBase())
				out.println("添加失败!已经存在此名称!");
			else{
				//如果不存在此名称，则创建新的名称
				o_base.CreateBase();
				out.println("添加成功!");
			}
		}catch (Exception e) {
			System.err.println("Exception class: " + e);
			e.printStackTrace();
			out.println("名称重复或其它原因,修改失败!<p>");
		}
	}
	// 判断是否为修改操作标志，sname为新名称
	if(sflag.equals("updateok")&&sname!=null){
		try{
			// 设置基本信息属性，类别编号和名称
			o_base.setBaseType(itype);
			o_base.setTitle(sname);
			// 新名称是否存在
			if(o_base.getBase())
				out.println("修改失败!已经存在此名称!");
			else{
				// 修改名称
				o_base.setBaseType(itype);
                           
				o_base.setTitle(sname);
				System.out.println("The values is:"+sname);
				o_base.UpdateBase(oldname);

				out.println("修改成功!");
			}
		}catch (Exception e) {
			System.err.println("Exception class: " + e);
			e.printStackTrace();
			out.println("名称重复或其它原因,修改失败!<p>");
		}
	}
	if(sflag.equals("delete")&&sname!=null)
	{
		try{
			//删除名称
			o_base.setBaseType(itype);
			o_base.setTitle(new String(sname.getBytes("iso8859-1"),"GBK"));
			o_base.DeleteBase();
			out.println("删除成功!");
		}
		catch (Exception e) {
			System.err.println("Exception class: " + e);
			e.printStackTrace();
			out.println("名称重复或其它原因,修改失败!<p>");
		}
	}
%>
<%
// 引入相关文件，定义相关变量，如itype,stitle等过程省略		
try{
	if(itype==1)
		stitle = "分类";
	else if(itype==2)
		stitle = "部门";
	// 取得类型编号为itype的基本信息的所有数据
	Base o_Base = new Base();
	o_Base.setBaseType(itype);
	//使用Vector接收到类型名称
	v_Base = o_Base.getMoreBases();
%>
<p><center><h3><%=stitle%>设置</h3></center></p>
<table border="1" align="center" cellpadding="0" cellspacing="0" width="90%" bordercolorlight="#000080" bordercolordark="#FFFFFF" bordercolor="#000080" style="margin-top: 3; margin-bottom: 3">
<tr>
<td width="60%" bgcolor="#CCFFCC"><%=stitle%>名称</td>
<td width="20%" align="center" bgcolor="#CCFFCC">删除</td>
</tr>
<%
	// 执行循环语句，取出Vector中的所有记录
	for(int i=0;i<v_Base.size();i++)
	{
		// 定义Vector中每条记录为一个对象，再取它的属性值
		o_Base = (Base)v_Base.elementAt(i);
		showname = o_Base.getTitle(); // 信息名称
%>
<tr>
<td><%=showname%></td>
<td align="center"><a href="bsInfo_list.jsp?flag=delete&type=<%=itype%>&name=<%=showname%>" onclick="return DeleteName()">删除</a></td>
</tr>
<%
	}
}catch(Exception e)
 {throw new Exception(e.getMessage());}
%>
</table>
<%// 如果为修改和添加操作，则分别显示下面的内容
if(sflag.equals("update")){%>
	<form name="UFrom" action="bsInfo_list.jsp?type=<%=itype%>&flag=updateok&oldname=<%=sname%>&hello=<%=2%>%>" method="post">
	  <div align="center">
		<font color="#FFFFFF"><b><font color="#000000"><%=stitle%>名称</font></b></font> 
		<input type="text" name="name" size="20" value="<%=sname%>">
		<input type="submit" name="Submit" value=" 修 改 ">
		</div>
	</form>
<%}else{%>
	<form name="AForm" action="bsInfo_list.jsp?type=<%=itype%>&flag=add" method="post">
	  <div align="center">
		<font color="#FFFFFF"><b><font color="#000000"><%=stitle%>名称</font></b></font> 
		<input type="text" name="name" size="20">
		<input type="submit" name="Submit" value=" 添 加 ">
	  </div>
	</form>
<%}%>
</form>
</body>
</html>
<%}
else
	out.println("你没有管理员的权限");		
%>