<%@ page contentType="text/html;charset=gb2312" %>    
<%@include file="head.jsp"%>
<%!
// �豸�б�����ѡ���豸��Ϣ
	int i=0,pageno=0,totalPage=0;
	Vector v_dev;
	int iTotal,ShowCount,lPage,nPage,cMaxPerPage=10;
	String strPage,targetjsp;
	int currentpage=1,iNext=0,iFinish=0,iMaxPage=0,iPageStop;
%>
<html>
<head>
<title>�豸�б�</title>
<link rel="stylesheet" href="public.css">
<script language="JavaScript">
// �������豸��Ϣ��¼ʱ���رմ���ͬʱ�����ݷ������Ӧ������
function exitWin(devid,devname,devtype,devcate,devpro,devprc,devcnt)
{
	opener.document.all.item("devid").value = devid;
	opener.document.all.item("devname").value= devname; 
	opener.document.all.item("devtype").value = devtype;
	opener.document.all.item("devcate").value= devcate;
	opener.document.all.item("devpro").value= devpro;
	opener.document.all.item("devprc").value= devprc;
	opener.document.all.item("devcnt").value = devcnt;
	window.close();
}
</script>
</head>
<body link="#000080" vlink="#008080">
<form action="<%=targetjsp%>" name="myform" method="POST">
<h3><p align="center">�豸�б�</p></h3>

<table width='100%' align=center cellspacing=1 cellpadding=2 border=1 bordercolor="#808080" bordercolordark="#FFFFFF" style="font-size: 9pt; font-family: ����"  bordercolorlight="#D8D8D8">
<tr>
<td align="center" width='14%' bgcolor="#D8D8D8">���</td>
<td align="center" width='12%' bgcolor="#D8D8D8">�豸���</td>
<td align="center" width='20%' bgcolor="#D8D8D8">�豸����</td>
<td align="center" width='20%' bgcolor="#D8D8D8">�豸�ͺ�</td>
<td align="center" width='20%' bgcolor="#D8D8D8">��������</td>
<td align="center" width='14%' bgcolor="#D8D8D8">�������</td>
</tr>
<%
// �����豸��Ϣ�ύ��ҳ��
targetjsp = request.getParameter("filename");
try{
	// �豸��Ϣ�б���ʽ����ǰ��ͬ����ο�devic_list.jsp��ע��
	Device o_dev = new Device();
	v_dev = o_dev.getMoreDevice();
	iTotal = v_dev.size();

	if(iTotal==0) 
		out.println("<tr align='center'><td colspan=3><font color=red>Ŀǰ��û���豸</font></td></tr>");
	else
	{
		strPage = request.getParameter("page");
		if(strPage == null)
			currentpage = 1;
		else
			currentpage = Integer.parseInt(strPage);

		if(currentpage<1)
			currentpage = 1;

		//���ҳ��
		if ((iTotal%cMaxPerPage)==0)
	      iMaxPage = iTotal / cMaxPerPage;
	    else
	      iMaxPage = iTotal / cMaxPerPage + 1;

        if (currentpage==1)//-----1
		{
			if(iTotal>cMaxPerPage)
				iPageStop = cMaxPerPage;
			else
				iPageStop = iTotal;

			for(i=0;i<iPageStop;i++)
			{ 
			  o_dev =(Device)v_dev.elementAt(i);
%>
<tr>
<td align="center"><%=o_dev.getDevCate()%></td>
<td><a href=# onclick="exitWin('<%=o_dev.getDevId()%>','<%=o_dev.getDevName()%>','<%=o_dev.getDevType()%>','<%=o_dev.getDevCate()%>','<%=o_dev.getDevPro()%>','<%=o_dev.getPrice()%>','<%=o_dev.getDevNumber()%>')"><%=o_dev.getDevId()%></a></td>
<td><%=o_dev.getDevName()%></td>
<td><%=o_dev.getDevType()%></td>
<td><%=o_dev.getDevPro()%></td> 
<td align="right"><%=o_dev.getDevNumber()%></td>
</tr>

<%
			}  //end for
		}  // end if
		else
		{
		   iNext = (currentpage-1)*cMaxPerPage;
		   iFinish = iTotal - iNext ;
		   if(iFinish>cMaxPerPage)
			   iPageStop = cMaxPerPage;
		   else
			   iPageStop = iFinish;
	       if (iNext<iTotal)
			{
			   for(int j=iNext;j<iNext+iPageStop;j++)
			   { 
				o_dev =(Device)v_dev.elementAt(j);
%>
<tr>
<td align="center"><%=o_dev.getDevCate()%></td>
<td><a href=# onclick="exitWin('<%=o_dev.getDevId()%>','<%=o_dev.getDevName()%>','<%=o_dev.getDevType()%>','<%=o_dev.getDevCate()%>','<%=o_dev.getDevPro()%>','<%=o_dev.getPrice()%>','<%=o_dev.getDevNumber()%>')"><%=o_dev.getDevId()%></a></td>
<td><%=o_dev.getDevName()%></td>
<td><%=o_dev.getDevType()%></td>
<td><%=o_dev.getDevPro()%></td> 
<td align="right"><%=o_dev.getDevNumber()%></td>
</tr>

<%				}
			}
		}
		%>
		<table align=center><tr><td>
��<%=currentpage%>ҳ&nbsp;/&nbsp;��<%=iMaxPage%>ҳ ��ҳ<%=iPageStop%>��&nbsp;/&nbsp;��<%=iTotal%>��
<%if (currentpage == 1)
	{%>��ҳ ��һҳ <%}
else{lPage = currentpage-1;
	%><a href='device_select.jsp?page=1&filename=<%=targetjsp%>'>��ҳ</a>&nbsp;&nbsp;<a href='device_select.jsp?page=<%=lPage%>&filename=<%=targetjsp%>'>��һҳ</a> 
<%}
if(currentpage ==iMaxPage)
	{%>��һҳ&nbsp;&nbsp;βҳ <%}
else{nPage = currentpage+1;
	%><a href='device_select.jsp?page=<%=nPage%>&filename=<%=targetjsp%>'>��һҳ</a>&nbsp;&nbsp;<a href='device_select.jsp?page=<%=iMaxPage%>&filename=<%=targetjsp%>'>βҳ</a>
<%}%>
</td></tr></table>
<%
	  }  //end else
}catch(Exception e){e.printStackTrace();}
%>
</table>
</form>
</body>
</html>