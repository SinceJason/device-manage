<%@ page contentType="text/html;charset=gb2312" %>    
<%@include file="head.jsp"%>
<%!
// Ϊ��ҳ�������
	int i=0,pageno=0,totalPage=0;
	Vector v_dev;
	// cMaxPerPage-ÿҳ��ʾ�ļ�¼����
	int iDevCnt,ShowCount,lPage,nPage,cMaxPerPage=10;
	String strPage;
	// currentpage - ��ǰҳ��iPageStop - ѭ��ֹͣ�ü�¼������iMaxPage-���ҳ��
	int currentpage=1,iNext=0,iFinish=0,iMaxPage=0,iPageStop;
%>
<html>
<head>
<title></title>
<link rel="stylesheet" href="public.css">
<script language="JavaScript">
// �����´��ں�����url��ʾ�µ����ӵ�ַ
function newwin(url) {
  // ���õ�����������
  var status =   "toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=yes,width=600,height=450";
  var newwin=window.open(url,"newwin",status);
  newwin.focus();
  return false;
}
</script>
</head>
<body>
<h3><p align="center">�豸�б�</p></h3>
 <form name="form1" method="post" action="device_listuser.jsp">
  <table width="600" border="0" align="center" cellpadding="0" cellspacing="0" class="tabletoolbar">    
	 <tr>
        <td height="30" align="right">�豸���</td>
		<td align="left">
		<select name="combobox2">
<option value="����ʵ��">����ʵ��</option>
<option value="��ѧʵ��">��ѧʵ��</option>
<option value="��������">��������</option>
<option value="��е����">��е����</option>
<option value="���������">���������</option>
<option value="����ʵ��">����ʵ��</option>
<option value="����ʵ��">����ʵ��</option>
<option value="����ʵ��">����ʵ��</option>
<option value="����ʵ��">����ʵ��</option>
</select>

</td>
<td height="30" align="right">�豸����<input name="devicename" type="text" class="text1">
<input type="submit" value="ȷ����ѯ" name="button1"></td>
		<td align="left">
		<br></td>
      </tr>
  </table>

<table width='96%' align=center cellspacing=1 cellpadding=2 border=1 bordercolor="#808080" bordercolordark="#FFFFFF" style="font-size: 9pt; font-family: ����"  bordercolorlight="#D8D8D8">
<tr>
<td align="center" width='10%' bgcolor="#D8D8D8">�豸���</td>
<td align="center" width='12%' bgcolor="#D8D8D8">�豸���</td>
<td align="center" width='16%' bgcolor="#D8D8D8">�豸����</td>
<td align="center" width='10%' bgcolor="#D8D8D8">�豸�ͺ�</td>
<td align="center" width='10%' bgcolor="#D8D8D8">�������</td>
<td align="center" width='12%' bgcolor="#D8D8D8">����</td>
<td align="center" width='16%' bgcolor="#D8D8D8">��&nbsp;��&nbsp;��</td>
</tr>
<%
 request.setCharacterEncoding("gb2312");
try{
	String commitFlag = (String) request.getParameter("button1");//�õ���ť�¼�
    Device o_dev = new Device();
    if(commitFlag==null){
	// �½��豸����ȡ����豸��Ϣ   
	  v_dev = o_dev.getMoreDevice();
	  iDevCnt = v_dev.size();	// �豸����
    }else {
	  String type = request.getParameter("combobox2");
	  String name = request.getParameter("devicename");
	  if(type!=null && name != null){		 
		  v_dev = o_dev.getMoreDevicehello(type,name);
		  iDevCnt = v_dev.size();	// �豸����
	  }
	}
	if(iDevCnt==0) 
		out.println("<tr align='center'><td colspan=9><font color=red>Ŀǰ��û���豸</font></td></tr>");
	else
	{
		// �Ӵ��ݵĲ�����ȡ��ҳ��ֵ
		strPage = request.getParameter("page");
		// ���ҳ��ֵΪnull�������õ�ǰҳΪ1������Ϊҳ��ֵ
		// ���ַ��ͱ���תΪ������ʹ�ã�Integer.parseInt(strParameter)������ͬ����:Long.parseLong(strParameter)
		if(strPage == null)
			currentpage = 1;
		else
			currentpage = Integer.parseInt(strPage);
		// �����ǰҳС��1����ǰҳ��Ϊ1
		if(currentpage<1)
			currentpage = 1;
		// ���ҳ��=��¼����/ÿҳ��¼���ֵ
		if ((iDevCnt%cMaxPerPage)==0)
	      iMaxPage = iDevCnt / cMaxPerPage;
	    else
	      iMaxPage = iDevCnt / cMaxPerPage + 1;		
		// �������ʾ�豸��¼��Ϣ
        if (currentpage==1){
			// ����¼��������ÿҳ����¼��ʱ��ÿҳӦ����ʾ����¼��
			if(iDevCnt>cMaxPerPage)
				iPageStop = cMaxPerPage;
			// �����¼����С��ÿҳ����¼��ʱ��ÿҳӦ����ʾ��¼����
			else
				iPageStop = iDevCnt;
			// ��ʾ�豸��¼��Ϣ
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
</tr>

<%
			}  //end for
		}  // end if
		else
		{
			// �õ���ʼ��ʾ�ļ�¼ֵiNext���Լ�ʣ���¼����iFinish
		   iNext = (currentpage-1)*cMaxPerPage;
		   iFinish = iDevCnt - iNext ;
		   // ���ʣ���¼��������ÿҳ����¼����ÿҳӦ����ʾ����¼����������ʾ��¼����
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
</tr>
<%				}
			}
		}
		%>
		<table align=center><tr><td>
��<%=currentpage%>ҳ&nbsp;/&nbsp;��<%=iMaxPage%>ҳ ��ҳ<%=iPageStop%>��&nbsp;/&nbsp;��<%=iDevCnt%>��
<%if (currentpage == 1)
	{%>��ҳ ��һҳ <%}
else{lPage = currentpage-1;
	%><a href='device_list.jsp?page=1'>��ҳ</a>&nbsp;&nbsp;<a href='device_list.jsp?page=<%=lPage%>'>��һҳ</a> 
<%}
if(currentpage ==iMaxPage)
	{%>��һҳ&nbsp;&nbsp;βҳ <%}
else{nPage = currentpage+1;
	%><a href='device_list.jsp?page=<%=nPage%>'>��һҳ</a>&nbsp;&nbsp;<a href='device_list.jsp?page=<%=iMaxPage%>'>βҳ</a>
<%}%>
</td></tr></table>
<%
	  }  //end else
}catch(Exception e){e.printStackTrace();}
%>
</table>
<br>
 </form>
</body>
</html>