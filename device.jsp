<%@ page contentType="text/html;charset=gb2312" %>    
<%@include file="head.jsp"%>
<%
// �жϴ��û������Ƿ�Ϊϵͳ����Ա������������ܲ鿴��ҳ����Ϣ
// ����ʹ��head.jsp�ļ��еķ���isAdmin()
if(isAdmin((String)session.getValue("user_id")))
{
%>

<%
	// �������ڶ��󣬰��� YYYY-MM-DD ��ʽȡ�õ�ǰ����
	java.util.Date dnow = new java.util.Date();
	SimpleDateFormat formatter1 = new SimpleDateFormat ("yyyy-MM-dd");
	String ShowDate = formatter1.format(dnow);

	String uid = (String)session.getAttribute("user_id");
	
	// ���ݵ�ǰ�û���ȡ���û���������Ϣ
	User o_User = new User();
	// ��session���������ú�ȡֵ����ʹ��session.getValue("user_id")��Ҳ����ʹ��session.getAttribute("user_id"),
	// getAttribute��jdk�߰汾��֧�ֵģ��������jdk�汾�ͣ�ʹ��getValue��
	// ������Ҫ���õ���ֵǿ��ת��Ϊ�ַ�����ʽ
	o_User.setUserId(uid);
	o_User.getUser();
	String sEname = o_User.getEmplName();
%>
<html>
<head>
<link rel="stylesheet" href="public.css">
<title>������豸</title>
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
// �����ܶ���ֵ��Ϊ����*����
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
<h3><p align="center">�豸̨����Ϣ</p></h3>

 <table align="center" border="1" cellpadding="1" cellspacing="1" width="100%" bordercolor="#808080" bordercolordark="#FFFFFF" style="font-size: 9pt; font-family: ����">
      <tr>
        <td width="20%">�豸���</td>
		<td width="30%"><input type="text" name="devid" size="20" style="font-size: 9pt; font-family: ����"></td>
		<td width="20%">�豸����</td>
		<td width="30%"><input type="text" name="devname" size="20" style="font-size: 9pt; font-family: ����"></td>
      </tr>
	  <tr>
        <td>�豸�ͺ�</td>
        <td><input type="text" name="devtype" size="20" style="font-size: 9pt; font-family: ����"></td>
        <td>�豸���</td>
        <td>
		<select name="devcate" style="font-size: 9pt; font-family: ����">
		<%
		// �����ݿ���ȡ�������Ϣ����Ϊ�����б����ݣ������Ϊ1
		 Vector v_Base = new Vector();
		 Base o_Base = new Base();
		 o_Base.setBaseType(1);
		 v_Base = o_Base.getMoreBases();
		 for(int i=0 ;i<v_Base.size();i++)
		 {
			 // ȡVector��ÿ����¼��Ϣ
			 o_Base = (Base)v_Base.elementAt(i);
		%>
		<option value="<%=o_Base.getTitle()%>"><%=o_Base.getTitle()%></option>
		<%}%>
		</select>
		</td>
      </tr>
      <tr>
        <td>��������</td>
        <td><input type="text" name="devpro" size="20" style="font-size: 9pt; font-family: ����"></td>
        <td>��λ</td>
        <td><input type="text" name="devunit" size="10" style="font-size: 9pt; font-family: ����"></td>
      </tr>
      <tr>
        <td>�������</td>
        <td><input type="text" name="devnum" size="20" style="font-size: 9pt; font-family: ����" value="0" onchange="CaculateSum()">
		</td>
        <td>����</td>
        <td><input type="text" name="devprc" size="20" style="font-size: 9pt; font-family: ����" value="0" onchange="CaculateSum()"></td>
      </tr>
      <tr>
        <td>�ܽ��</td>
        <td><input type="text" name="total" size="20" style="background-color: #FFFFFF; border-style: solid; border-color: #FFFFFF;font-size: 9pt; font-family: ����" value="0">
		</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td>��д��</td>
        <td><%=sEname%></td>
        <td>��д����</td>
        <td><%=ShowDate%></td>
      </tr>
	  
  </table> 
<p align="center"><input type="submit" value=" �� �� " name="B2" style="font-size: 9pt; font-family: ����"></p>
</form>  
</body>
</html>
<%}
else
	out.println("��û�й���Ա��Ȩ��");		
%>