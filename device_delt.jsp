<%@ page contentType="text/html;charset=gb2312" %>    
<%@include file="head.jsp"%>
<%
// �жϴ��û������Ƿ�Ϊϵͳ����Ա������������ܲ鿴��ҳ����Ϣ
// ����ʹ��head.jsp�ļ��еķ���isAdmin()
if(isAdmin((String)session.getValue("user_id")))
{
%>
<%!
	String strid;
%>
<html>
<head>
<title>�豸ɾ��</title>
</head>
<body>
<form name="form1" method="POST">
<%
try
{
	strid = request.getParameter("devid");
	// �½�Device����ִ��ɾ���豸�ķ���
	Device o_dev = new Device();
	o_dev.DeleteDevice(strid);
	out.print("�豸̨����Ϣ�ɹ�ɾ����");
	%>
	<script language="javascript">
		// ˢ�¸������ڣ��رմ˴���
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
	out.println("��û�й���Ա��Ȩ��");		
%>