<%@page contentType="text/html;charset=gb2312" %>    
<%@include file="head.jsp"%>
<%
// �жϴ��û������Ƿ�Ϊϵͳ����Ա������������ܲ鿴��ҳ����Ϣ
// ����ʹ��head.jsp�ļ��еķ���isAdmin()
if(isAdmin((String)session.getValue("user_id")))
{
%>

<html>
<head>
<title>�����豸̨����Ϣ</title>
</head>
<body>
<%
request.setCharacterEncoding("GB2312");
%>
<%
	// �������豸�������ö����������ֵ
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
		// �½��豸��Ϣ�ͱ༭�豸��Ϣ���ж���һ��posttime�����Ϊ�½�����posttimeֵ����1����������ύʱ��
		// �ô����ж��Ƿ�Ϊ�½���Ϣ
		if(request.getParameter("posttime").equals("1"))	// insert
		{
			o_dev.setPoster(request.getParameter("userid"));
			o_dev.CreateDevice();
		}
		else
		o_dev.UpdateDevice();
		out.println("<br><br><br><center>�豸̨����Ϣ�ѳɹ����棡</center>");
		}
		catch(Exception e){e.printStackTrace();out.println("<br><br><br><center>�豸̨����Ϣ�ѳɹ����棡 </center>");}
%>
</body>
<script language="javascript">
// ������ɺ�ˢ��ҳ�棬�رմ���
	opener.location.reload();
	setTimeout("window.close()",800);
</script>
</html>
<%}
else
	out.println("��û�й���Ա��Ȩ��");		
%>