<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title></title>
	<!-- 以下方式定时转到其他页面 -->
	<!-- <script language='javascript'>
	document.location = 'newsShow.jsp';
	</script>  -->
	
  </head>
  
  <body>
    <h2><font color="red">您所查询的信息不存在!</font></h2><br>
  </body>
</html>
