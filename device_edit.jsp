<%@ page contentType="text/html;charset=gb2312" %>    
<%@include file="head.jsp"%>
<%
// �жϴ��û������Ƿ�Ϊϵͳ����Ա������������ܲ鿴��ҳ����Ϣ
// ����ʹ��head.jsp�ļ��еķ���isAdmin()
if(isAdmin((String)session.getValue("user_id")))
{
%>

<html>
<head>
<link rel="stylesheet" href="public.css">
<title>�豸̨����Ϣ</title>
</head>
<script Language="JavaScript">
// �����Ҫ���Ƿ�Ϊ��
function ChkFields() {
	if (document.myform.devname.value=='') {
		window.alert ("�������豸���ƣ�")
		return false
	}
	if (document.myform.devid.value=='') {		
		window.alert ("�������豸��ţ�")
		return false
	}
	if (document.myform.devtype.value=='') {
		window.alert ("�������豸�ͺţ�")
		return false	
	}
	if (document.myform.devcate.value=='') {
		window.alert ("�������豸���ͣ�")
		return false	
	}	
	return true
}
</script>
<body>
<form method="POST" action="device_save.jsp" name="myform" onsubmit="return ChkFields()">
<%
// �༭�豸��Ϣ
try{
	// ȡ���豸���
	String devid = request.getParameter("devid");
	String sEname;
	// �½��豸����
	Device o_dev = new Device();
	// ���ö�����
	o_dev.setDevId(devid);
	// �ж��Ƿ���ڴ��豸��Ϣ
	if(!o_dev.getDevice())
		out.println("�����ڴ��豸��");
	else
	{
		// ������ڴ��豸������ȡ�����Ϣ
		// �����û���ȡ���û�����
		// �½��û�����
		User o_User = new User();
		// �����û�������
		o_User.setUserId(o_dev.getPoster());
		// ������ڴ��û�����ȡ���û�����
		if(o_User.getUser())
			sEname = o_User.getEmplName();
		else
			sEname = "&nbsp;";
%>
<h3><p align="center">�豸̨����Ϣ</p></h3>
 <table align="center" border="1" cellpadding="1" cellspacing="1" width="100%" bordercolor="#808080" bordercolordark="#FFFFFF" style="font-size: 9pt; font-family: ����">
      <tr>
        <td width="20%">�豸���</td>
		<td width="30%"><input type="text" name="devid" size="20" value="<%=o_dev.getDevId()%>" style="font-size: 9pt; font-family: ����"></td>
		<td width="20%">�豸����</td>
		<td width="30%"><input type="text" name="devname" size="20" value="<%=o_dev.getDevName()%>" style="font-size: 9pt; font-family: ����"></td>
      </tr>
	  <tr>
        <td>�豸�ͺ�</td>
        <td><input type="text" name="devtype" size="20" value="<%=o_dev.getDevType()%>" style="font-size: 9pt; font-family: ����"></td>
        <td>�豸���</td>
        <td>
	   <select name="devcate" style="font-size: 9pt; font-family: ����">
		<%
	// ����豸����б��е�������ƺʹ��豸�������һ��������������Ϊselected��
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
        <td>��������</td>
        <td><input type="text" name="devpro" size="20" value="<%=o_dev.getDevPro()%>" style="font-size: 9pt; font-family: ����"></td>
        <td>��λ</td>
        <td><input type="text" name="devunit" size="10" value="<%=o_dev.getUnit()%>" style="font-size: 9pt; font-family: ����"></td>
      </tr>
      <tr>
        <td>�������</td>
        <td><input type="text" name="devnum" size="20" style="font-size: 9pt; font-family: ����" value="<%=o_dev.getDevNumber()%>">
		</td>
        <td>����</td>
        <td><input type="text" name="devprc" size="20" style="font-size: 9pt; font-family: ����"  value="<%=o_dev.getPrice()%>"></td>
      </tr>
		<tr>
        <td>�ܽ��</td>
        <td><input type="text" name="total" size="20" style="background-color: #FFFFFF; border-style: solid; border-color: #FFFFFF;font-size: 9pt; font-family: ����" value="<%=o_dev.getDevNumber()*o_dev.getPrice()%>"></td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td width="755" colspan="4">��</td>
      </tr>
      <tr>
        <td>��д��</td>
        <td><%=sEname%></td>
        <td>��д����</td>
        <td><%=o_dev.getPostTime()%><input type="hidden" name="posttime" value="<%=o_dev.getPostTime()%>"></td>
      </tr>	  
  </table>
<p align="center"><input type="submit" value=" �� �� " name="B2" style="font-size: 9pt; font-family: ����"></p>
<%
	}
}catch(Exception e){e.printStackTrace();}
%>
</form>  
</body>
</html>
<%}
else
	out.println("��û�й���Ա��Ȩ��");		
%>