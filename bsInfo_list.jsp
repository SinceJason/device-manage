<%@ page contentType="text/html;charset=gb2312" %>    
<%@include file="head.jsp"%>
<%
// �жϴ��û������Ƿ�Ϊϵͳ����Ա������������ܲ鿴��ҳ����Ϣ
// ����ʹ��head.jsp�ļ��еķ���isAdmin()
if(isAdmin((String)session.getValue("user_id")))
{
%>
<%!
//���ļ���ɶԻ�����Ϣ�����ã��������豸���ࡢ���ŵ�����
	String sname,oldname,stitle="",showname;
	String stype,helloworld;
	int itype,hello;
%>
<html>
<head>
<link rel="stylesheet" href="public.css">
<title>��������</title>
</head>
<script language="javascript">
function DeleteName(){
	if (confirm("���Ҫɾ����������")){
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
	// ȡ�����ͱ�ţ�1-�豸���ࣻ2-��������
	stype = request.getParameter("type");
	// �����ͱ���ַ���ת��Ϊ����
	itype = Integer.parseInt(stype);

       helloworld = request.getParameter("hello");
       if(helloworld !=null)hello = Integer.parseInt(helloworld);
	sname = request.getParameter("name");		// ������
 	

       oldname =request.getParameter("oldname");	
       if(oldname!=null)oldname = new String(oldname.getBytes("iso8859-1"),"GBK");
	String sflag = request.getParameter("flag");	// ������־
      
	System.out.println("sflag= "+sflag+" , stype= "+stype+" , sname= "+sname+" , oldname= "+oldname);

	//���������Ϣ����
	Base o_base = new Base();
	// ������־��Ϊ����ֵ���½����޸ġ�ɾ��
	if(sflag==null)
		sflag = "new";
	if(sflag.equals("add")&&sname!=null){
		try{
			o_base.setBaseType(itype);
			o_base.setTitle(sname);
			//�ж��Ƿ��Ѿ����ڴ�����
			if(o_base.getBase())
				out.println("���ʧ��!�Ѿ����ڴ�����!");
			else{
				//��������ڴ����ƣ��򴴽��µ�����
				o_base.CreateBase();
				out.println("��ӳɹ�!");
			}
		}catch (Exception e) {
			System.err.println("Exception class: " + e);
			e.printStackTrace();
			out.println("�����ظ�������ԭ��,�޸�ʧ��!<p>");
		}
	}
	// �ж��Ƿ�Ϊ�޸Ĳ�����־��snameΪ������
	if(sflag.equals("updateok")&&sname!=null){
		try{
			// ���û�����Ϣ���ԣ�����ź�����
			o_base.setBaseType(itype);
			o_base.setTitle(sname);
			// �������Ƿ����
			if(o_base.getBase())
				out.println("�޸�ʧ��!�Ѿ����ڴ�����!");
			else{
				// �޸�����
				o_base.setBaseType(itype);
                           
				o_base.setTitle(sname);
				System.out.println("The values is:"+sname);
				o_base.UpdateBase(oldname);

				out.println("�޸ĳɹ�!");
			}
		}catch (Exception e) {
			System.err.println("Exception class: " + e);
			e.printStackTrace();
			out.println("�����ظ�������ԭ��,�޸�ʧ��!<p>");
		}
	}
	if(sflag.equals("delete")&&sname!=null)
	{
		try{
			//ɾ������
			o_base.setBaseType(itype);
			o_base.setTitle(new String(sname.getBytes("iso8859-1"),"GBK"));
			o_base.DeleteBase();
			out.println("ɾ���ɹ�!");
		}
		catch (Exception e) {
			System.err.println("Exception class: " + e);
			e.printStackTrace();
			out.println("�����ظ�������ԭ��,�޸�ʧ��!<p>");
		}
	}
%>
<%
// ��������ļ���������ر�������itype,stitle�ȹ���ʡ��		
try{
	if(itype==1)
		stitle = "����";
	else if(itype==2)
		stitle = "����";
	// ȡ�����ͱ��Ϊitype�Ļ�����Ϣ����������
	Base o_Base = new Base();
	o_Base.setBaseType(itype);
	//ʹ��Vector���յ���������
	v_Base = o_Base.getMoreBases();
%>
<p><center><h3><%=stitle%>����</h3></center></p>
<table border="1" align="center" cellpadding="0" cellspacing="0" width="90%" bordercolorlight="#000080" bordercolordark="#FFFFFF" bordercolor="#000080" style="margin-top: 3; margin-bottom: 3">
<tr>
<td width="60%" bgcolor="#CCFFCC"><%=stitle%>����</td>
<td width="20%" align="center" bgcolor="#CCFFCC">ɾ��</td>
</tr>
<%
	// ִ��ѭ����䣬ȡ��Vector�е����м�¼
	for(int i=0;i<v_Base.size();i++)
	{
		// ����Vector��ÿ����¼Ϊһ��������ȡ��������ֵ
		o_Base = (Base)v_Base.elementAt(i);
		showname = o_Base.getTitle(); // ��Ϣ����
%>
<tr>
<td><%=showname%></td>
<td align="center"><a href="bsInfo_list.jsp?flag=delete&type=<%=itype%>&name=<%=showname%>" onclick="return DeleteName()">ɾ��</a></td>
</tr>
<%
	}
}catch(Exception e)
 {throw new Exception(e.getMessage());}
%>
</table>
<%// ���Ϊ�޸ĺ���Ӳ�������ֱ���ʾ���������
if(sflag.equals("update")){%>
	<form name="UFrom" action="bsInfo_list.jsp?type=<%=itype%>&flag=updateok&oldname=<%=sname%>&hello=<%=2%>%>" method="post">
	  <div align="center">
		<font color="#FFFFFF"><b><font color="#000000"><%=stitle%>����</font></b></font> 
		<input type="text" name="name" size="20" value="<%=sname%>">
		<input type="submit" name="Submit" value=" �� �� ">
		</div>
	</form>
<%}else{%>
	<form name="AForm" action="bsInfo_list.jsp?type=<%=itype%>&flag=add" method="post">
	  <div align="center">
		<font color="#FFFFFF"><b><font color="#000000"><%=stitle%>����</font></b></font> 
		<input type="text" name="name" size="20">
		<input type="submit" name="Submit" value=" �� �� ">
	  </div>
	</form>
<%}%>
</form>
</body>
</html>
<%}
else
	out.println("��û�й���Ա��Ȩ��");		
%>